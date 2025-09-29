import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../models/product.dart';
import '../../providers/providers.dart';
import '../../utils/formatters.dart';

class CartScreen extends HookConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final couponController = useTextEditingController();
    final appliedCoupon = useState<String?>(null);
    final couponDiscount = useState<double>(0.0);

    final cartItems = ref.watch(cartProvider);
    final cartNotifier = ref.read(cartProvider.notifier);

    // Sample coupon codes for validation
    final validCoupons = {
      'REWE10': 0.10, // 10% discount
      'WILLKOMMEN': 5.00, // 5€ discount
      'NEUKUNDE': 0.15, // 15% discount
      'SOMMER24': 3.00, // 3€ discount
    };

    // Calculate totals
    double subtotal = cartItems.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
    double discountAmount = couponDiscount.value;

    // Apply percentage discounts
    if (appliedCoupon.value != null && validCoupons.containsKey(appliedCoupon.value)) {
      final couponValue = validCoupons[appliedCoupon.value]!;
      if (couponValue < 1.0) {
        // Percentage discount
        discountAmount = subtotal * couponValue;
      } else {
        // Fixed amount discount
        discountAmount = couponValue;
      }
    }

    // Delivery fee calculation
    const deliveryThreshold = 39.00;
    const deliveryFee = 4.95;
    double actualDeliveryFee = subtotal >= deliveryThreshold ? 0.0 : deliveryFee;

    double total = subtotal - discountAmount + actualDeliveryFee;

    void applyCoupon() {
      final code = couponController.text.trim().toUpperCase();
      if (validCoupons.containsKey(code)) {
        appliedCoupon.value = code;
        final value = validCoupons[code]!;
        couponDiscount.value = value < 1.0 ? subtotal * value : value;
        couponController.clear();

        showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            title: const Text('Gutschein angewendet!'),
            content: Text('Gutschein "$code" wurde erfolgreich angewendet.'),
            actions: [
              CupertinoDialogAction(
                child: const Text('OK'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      } else {
        showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            title: const Text('Ungültiger Gutschein'),
            content: const Text('Der eingegebene Gutscheincode ist nicht gültig.'),
            actions: [
              CupertinoDialogAction(
                child: const Text('OK'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      }
    }

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Warenkorb'),
      ),
      child: cartItems.isEmpty
          ? const EmptyCartView()
          : Column(
              children: [
                // Cart Items List
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: CartItemCard(
                          item: cartItems[index],
                          onQuantityChanged: (quantity) {
                            cartNotifier.updateQuantity(
                              cartItems[index].productId,
                              cartItems[index].variantId,
                              quantity,
                            );
                          },
                          onRemove: () {
                            cartNotifier.removeItem(
                              cartItems[index].productId,
                              cartItems[index].variantId,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),

                // Coupon Section
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: CupertinoColors.systemBackground,
                    border: Border(
                      top: BorderSide(color: CupertinoColors.separator, width: 0.5),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Gutscheincode',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      if (appliedCoupon.value != null)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: CupertinoColors.systemGreen.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: CupertinoColors.systemGreen),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                CupertinoIcons.checkmark_circle_fill,
                                color: CupertinoColors.systemGreen,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Gutschein "${appliedCoupon.value}" angewendet',
                                  style: const TextStyle(
                                    color: CupertinoColors.systemGreen,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              CupertinoButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  appliedCoupon.value = null;
                                  couponDiscount.value = 0.0;
                                },
                                child: const Icon(
                                  CupertinoIcons.xmark,
                                  color: CupertinoColors.systemGreen,
                                  size: 16,
                                ),
                              ),
                            ],
                          ),
                        )
                      else
                        Row(
                          children: [
                            Expanded(
                              child: CupertinoTextField(
                                controller: couponController,
                                placeholder: 'Gutscheincode eingeben',
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                decoration: BoxDecoration(
                                  border: Border.all(color: CupertinoColors.separator),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            CupertinoButton(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              color: CupertinoColors.activeBlue,
                              borderRadius: BorderRadius.circular(8),
                              onPressed: applyCoupon,
                              child: const Text('Anwenden'),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),

                // Order Summary
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: CupertinoColors.systemBackground,
                    border: Border(
                      top: BorderSide(color: CupertinoColors.separator, width: 0.5),
                    ),
                  ),
                  child: Column(
                    children: [
                      // Subtotal
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Zwischensumme',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            formatCurrency(subtotal),
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),

                      // Discount
                      if (discountAmount > 0) ...[
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Rabatt (${appliedCoupon.value})',
                              style: const TextStyle(
                                fontSize: 16,
                                color: CupertinoColors.systemGreen,
                              ),
                            ),
                            Text(
                              '-${formatCurrency(discountAmount)}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: CupertinoColors.systemGreen,
                              ),
                            ),
                          ],
                        ),
                      ],

                      // Delivery Fee
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Lieferung',
                                style: TextStyle(fontSize: 16),
                              ),
                              if (actualDeliveryFee > 0)
                                Text(
                                  'Kostenlos ab ${formatCurrency(deliveryThreshold)}',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: CupertinoColors.systemGrey,
                                  ),
                                ),
                            ],
                          ),
                          Text(
                            actualDeliveryFee > 0 ? formatCurrency(actualDeliveryFee) : 'Kostenlos',
                            style: TextStyle(
                              fontSize: 16,
                              color: actualDeliveryFee > 0
                                  ? CupertinoColors.label
                                  : CupertinoColors.systemGreen,
                              fontWeight: actualDeliveryFee == 0 ? FontWeight.w600 : FontWeight.normal,
                            ),
                          ),
                        ],
                      ),

                      Container(
                        height: 1,
                        margin: const EdgeInsets.symmetric(vertical: 12),
                        color: CupertinoColors.separator,
                      ),

                      // Total
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Gesamtsumme',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            formatCurrency(total),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Checkout Button
                      SizedBox(
                        width: double.infinity,
                        child: CupertinoButton(
                          color: CupertinoColors.activeBlue,
                          borderRadius: BorderRadius.circular(12),
                          onPressed: () {
                            showCupertinoDialog(
                              context: context,
                              builder: (context) => CupertinoAlertDialog(
                                title: const Text('Zur Kasse'),
                                content: Text('Weiter zur Kasse mit ${formatCurrency(total)}'),
                                actions: [
                                  CupertinoDialogAction(
                                    child: const Text('Abbrechen'),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                  CupertinoDialogAction(
                                    isDefaultAction: true,
                                    child: const Text('Weiter'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      // TODO: Navigate to checkout screen
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Text(
                            'Zur Kasse (${formatCurrency(total)})',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

class EmptyCartView extends StatelessWidget {
  const EmptyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            CupertinoIcons.shopping_cart,
            size: 80,
            color: CupertinoColors.systemGrey3,
          ),
          const SizedBox(height: 16),
          const Text(
            'Ihr Warenkorb ist leer',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: CupertinoColors.label,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Fügen Sie Produkte hinzu, um loszulegen',
            style: TextStyle(
              fontSize: 16,
              color: CupertinoColors.systemGrey,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          CupertinoButton(
            color: CupertinoColors.activeBlue,
            borderRadius: BorderRadius.circular(12),
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Weiter einkaufen'),
          ),
        ],
      ),
    );
  }
}

class CartItemCard extends StatelessWidget {
  final CartItem item;
  final Function(int) onQuantityChanged;
  final VoidCallback onRemove;

  const CartItemCard({
    super.key,
    required this.item,
    required this.onQuantityChanged,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final itemTotal = item.price * item.quantity;

    return Container(
      decoration: BoxDecoration(
        color: CupertinoColors.systemBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: CupertinoColors.separator, width: 0.5),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.systemGrey.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // Product Image
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: CupertinoColors.systemGrey6,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: item.imageUrl.isNotEmpty
                    ? CachedNetworkImage(
                        imageUrl: item.imageUrl,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const Center(
                          child: CupertinoActivityIndicator(),
                        ),
                        errorWidget: (context, url, error) => const Icon(
                          CupertinoIcons.photo,
                          color: CupertinoColors.systemGrey3,
                        ),
                      )
                    : const Icon(
                        CupertinoIcons.photo,
                        color: CupertinoColors.systemGrey3,
                      ),
              ),
            ),

            const SizedBox(width: 12),

            // Product Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 4),

                  // Special Offer
                  if (item.specialOffer != null)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemRed,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        item.specialOffer!,
                        style: const TextStyle(
                          color: CupertinoColors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                  const SizedBox(height: 8),

                  // Price and Quantity Controls
                  Row(
                    children: [
                      // Price
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            formatCurrency(item.price),
                            style: const TextStyle(
                              fontSize: 14,
                              color: CupertinoColors.systemGrey,
                            ),
                          ),
                          Text(
                            formatCurrency(itemTotal),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      const Spacer(),

                      // Quantity Controls
                      Row(
                        children: [
                          CupertinoButton(
                            padding: const EdgeInsets.all(4),
                            onPressed: item.quantity > 1
                                ? () => onQuantityChanged(item.quantity - 1)
                                : null,
                            child: Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: item.quantity > 1
                                    ? CupertinoColors.systemGrey4
                                    : CupertinoColors.systemGrey5,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Icon(
                                CupertinoIcons.minus,
                                size: 16,
                                color: CupertinoColors.white,
                              ),
                            ),
                          ),

                          Container(
                            width: 50,
                            height: 32,
                            decoration: BoxDecoration(
                              border: Border.all(color: CupertinoColors.separator),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Center(
                              child: Text(
                                item.quantity.toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),

                          CupertinoButton(
                            padding: const EdgeInsets.all(4),
                            onPressed: () => onQuantityChanged(item.quantity + 1),
                            child: Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: CupertinoColors.activeBlue,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Icon(
                                CupertinoIcons.plus,
                                size: 16,
                                color: CupertinoColors.white,
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Remove Button
                      CupertinoButton(
                        padding: const EdgeInsets.all(4),
                        onPressed: () {
                          showCupertinoDialog(
                            context: context,
                            builder: (context) => CupertinoAlertDialog(
                              title: const Text('Artikel entfernen'),
                              content: Text('Möchten Sie "${item.name}" aus dem Warenkorb entfernen?'),
                              actions: [
                                CupertinoDialogAction(
                                  child: const Text('Abbrechen'),
                                  onPressed: () => Navigator.pop(context),
                                ),
                                CupertinoDialogAction(
                                  isDestructiveAction: true,
                                  child: const Text('Entfernen'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    onRemove();
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                        child: const Icon(
                          CupertinoIcons.trash,
                          size: 20,
                          color: CupertinoColors.systemRed,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}