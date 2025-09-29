import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/product.dart';
import '../../providers/providers.dart';
import '../../utils/formatters.dart';

class CheckoutScreen extends HookConsumerWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);
    final addresses = ref.watch(addressesProvider);
    final selectedAddressId = useState<String?>(null);
    final selectedPaymentMethod = useState<CheckoutPaymentMethod>(CheckoutPaymentMethod.creditCard);
    final deliveryInstructions = useState<String>('');

    if (cartItems.isEmpty) {
      return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Kasse'),
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                CupertinoIcons.shopping_cart,
                size: 80,
                color: CupertinoColors.systemGrey3,
              ),
              SizedBox(height: 16),
              Text(
                'Warenkorb ist leer',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: CupertinoColors.systemGrey,
                ),
              ),
            ],
          ),
        ),
      );
    }

    final subtotal = cartItems.fold<double>(0, (sum, item) => sum + (item.price * item.quantity));
    final deliveryFee = subtotal >= 39.0 ? 0.0 : 4.95;
    final total = subtotal + deliveryFee;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Kasse'),
        leading: CupertinoNavigationBarBackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Order Summary
                _buildSection(
                  title: 'Bestellübersicht',
                  child: Column(
                    children: [
                      ...cartItems.map((item) => _buildOrderItem(item)),
                      Container(
                        height: 1,
                        color: CupertinoColors.separator,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                      ),
                      _buildPriceRow('Zwischensumme', formatCurrency(subtotal)),
                      _buildPriceRow('Lieferung', deliveryFee == 0 ? 'Kostenlos' : formatCurrency(deliveryFee)),
                      Container(
                        height: 1,
                        color: CupertinoColors.separator,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                      ),
                      _buildPriceRow('Gesamt', formatCurrency(total), isBold: true),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Delivery Address
                _buildSection(
                  title: 'Lieferadresse',
                  child: Column(
                    children: [
                      if (addresses.isEmpty)
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: CupertinoColors.systemGrey6,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              const Icon(CupertinoIcons.location, color: CupertinoColors.systemGrey),
                              const SizedBox(width: 12),
                              const Expanded(
                                child: Text(
                                  'Keine Lieferadresse gespeichert',
                                  style: TextStyle(color: CupertinoColors.systemGrey),
                                ),
                              ),
                              CupertinoButton(
                                padding: EdgeInsets.zero,
                                child: const Text('Hinzufügen'),
                                onPressed: () {
                                  _showAddAddressDialog(context, ref);
                                },
                              ),
                            ],
                          ),
                        )
                      else
                        ...addresses.map((address) => _buildAddressOption(
                          address,
                          selectedAddressId.value == address.id,
                          () => selectedAddressId.value = address.id,
                        )),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Payment Method
                _buildSection(
                  title: 'Zahlungsmethode',
                  child: Column(
                    children: CheckoutPaymentMethod.values.map((method) => _buildPaymentOption(
                      method,
                      selectedPaymentMethod.value == method,
                      () => selectedPaymentMethod.value = method,
                    )).toList(),
                  ),
                ),

                const SizedBox(height: 24),

                // Delivery Instructions
                _buildSection(
                  title: 'Lieferhinweise (optional)',
                  child: CupertinoTextField(
                    placeholder: 'z.B. An der Haustür klingeln...',
                    maxLines: 3,
                    onChanged: (value) => deliveryInstructions.value = value,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: CupertinoColors.systemGrey4),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                // Place Order Button
                SizedBox(
                  width: double.infinity,
                  child: CupertinoButton.filled(
                    onPressed: (selectedAddressId.value != null || addresses.isEmpty)
                        ? () => _placeOrder(context, ref, total, selectedAddressId.value, selectedPaymentMethod.value, deliveryInstructions.value)
                        : null,
                    child: Text('Bestellung aufgeben • ${formatCurrency(total)}'),
                  ),
                ),

                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: CupertinoColors.systemBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: CupertinoColors.systemGrey5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: child,
          ),
        ],
      ),
    );
  }

  Widget _buildOrderItem(CartItem item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: CupertinoColors.systemGrey6,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              CupertinoIcons.shopping_cart,
              color: CupertinoColors.systemGrey3,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  '${item.quantity}x ${formatCurrency(item.price)}',
                  style: const TextStyle(
                    color: CupertinoColors.systemGrey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Text(
            formatCurrency(item.price * item.quantity),
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              fontSize: isBold ? 16 : 14,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
              fontSize: isBold ? 16 : 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressOption(DeliveryAddress address, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? CupertinoColors.activeBlue.withOpacity(0.1) : CupertinoColors.systemGrey6,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? CupertinoColors.activeBlue : CupertinoColors.systemGrey5,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? CupertinoIcons.checkmark_circle_fill : CupertinoIcons.location,
              color: isSelected ? CupertinoColors.activeBlue : CupertinoColors.systemGrey,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address.label,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '${address.street}\n${address.postalCode} ${address.city}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: CupertinoColors.systemGrey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(CheckoutPaymentMethod method, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? CupertinoColors.activeBlue.withOpacity(0.1) : CupertinoColors.systemGrey6,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? CupertinoColors.activeBlue : CupertinoColors.systemGrey5,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? CupertinoIcons.checkmark_circle_fill : _getPaymentIcon(method),
              color: isSelected ? CupertinoColors.activeBlue : CupertinoColors.systemGrey,
            ),
            const SizedBox(width: 12),
            Text(
              _getPaymentLabel(method),
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getPaymentIcon(CheckoutPaymentMethod method) {
    switch (method) {
      case CheckoutPaymentMethod.creditCard:
        return CupertinoIcons.creditcard;
      case CheckoutPaymentMethod.paypal:
        return CupertinoIcons.money_dollar_circle;
      case CheckoutPaymentMethod.applePay:
        return CupertinoIcons.device_phone_portrait;
      case CheckoutPaymentMethod.cash:
        return CupertinoIcons.money_euro;
    }
  }

  String _getPaymentLabel(CheckoutPaymentMethod method) {
    switch (method) {
      case CheckoutPaymentMethod.creditCard:
        return 'Kreditkarte';
      case CheckoutPaymentMethod.paypal:
        return 'PayPal';
      case CheckoutPaymentMethod.applePay:
        return 'Apple Pay';
      case CheckoutPaymentMethod.cash:
        return 'Barzahlung bei Lieferung';
    }
  }

  void _showAddAddressDialog(BuildContext context, WidgetRef ref) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Adresse hinzufügen'),
        content: const Text('Adressverwaltung wird in einer vollständigen Version implementiert.'),
        actions: [
          CupertinoDialogAction(
            child: const Text('OK'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  void _placeOrder(BuildContext context, WidgetRef ref, double total, String? addressId, CheckoutPaymentMethod paymentMethod, String instructions) {
    // Clear cart
    ref.read(cartProvider.notifier).clearCart();

    // Show success dialog
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Bestellung aufgegeben!'),
        content: Text(
          'Ihre Bestellung über ${formatCurrency(total)} wurde erfolgreich aufgegeben.\n\nSie erhalten in Kürze eine Bestätigungs-E-Mail.',
        ),
        actions: [
          CupertinoDialogAction(
            child: const Text('Zur Startseite'),
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          ),
        ],
      ),
    );
  }
}

enum CheckoutPaymentMethod {
  creditCard,
  paypal,
  applePay,
  cash,
}