import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../models/product.dart';
import '../../providers/providers.dart';
import '../../utils/formatters.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final orders = ref.watch(ordersProvider);

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Mein Konto'),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // User Profile Section
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Avatar
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: CupertinoColors.activeBlue,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: const Icon(
                        CupertinoIcons.person_fill,
                        size: 40,
                        color: CupertinoColors.white,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // User Info
                    user.when(
                      loading: () => const CupertinoActivityIndicator(),
                      error: (error, stack) => const Text('Max Mustermann'),
                      data: (userData) => Column(
                        children: [
                          Text(
                            userData != null ? '${userData.firstName} ${userData.lastName}' : 'Max Mustermann',
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            userData?.email ?? 'max.mustermann@email.de',
                            style: const TextStyle(
                              fontSize: 16,
                              color: CupertinoColors.systemGrey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Loyalty Card
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [CupertinoColors.systemRed, CupertinoColors.systemOrange],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'REWE Kundenkarte',
                                style: TextStyle(
                                  color: CupertinoColors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: CupertinoColors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Text(
                                  'PREMIUM',
                                  style: TextStyle(
                                    color: CupertinoColors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Kartennummer: •••• •••• •••• 1234',
                            style: TextStyle(
                              color: CupertinoColors.white,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Text(
                                'Punktestand: 2.456 Punkte',
                                style: TextStyle(
                                  color: CupertinoColors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Spacer(),
                              const Icon(
                                CupertinoIcons.barcode,
                                color: CupertinoColors.white,
                                size: 24,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Menu Sections
              Container(
                color: CupertinoColors.systemGroupedBackground,
                child: Column(
                  children: [
                    // Orders Section
                    ProfileSection(
                      title: 'Bestellungen',
                      items: [
                        ProfileMenuItem(
                          icon: CupertinoIcons.bag,
                          title: 'Meine Bestellungen',
                          subtitle: 'Bestellhistorie und Status',
                          onTap: () {
                            Navigator.of(context).push(
                              CupertinoPageRoute(
                                builder: (context) => const OrdersListScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),

                    // Recent Orders Preview
                    orders.when(
                      loading: () => const SizedBox(),
                      error: (error, stack) => const SizedBox(),
                      data: (ordersList) {
                        final recentOrders = ordersList.take(3).toList();
                        if (recentOrders.isEmpty) return const SizedBox();

                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: CupertinoColors.systemBackground,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Letzte Bestellungen',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 12),
                              ...recentOrders.map((order) => RecentOrderItem(order: order)),
                            ],
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 20),

                    // Addresses Section
                    ProfileSection(
                      title: 'Adressen & Zahlung',
                      items: [
                        ProfileMenuItem(
                          icon: CupertinoIcons.location,
                          title: 'Lieferadressen',
                          subtitle: 'Adressen verwalten',
                          onTap: () {
                            Navigator.of(context).push(
                              CupertinoPageRoute(
                                builder: (context) => const AddressesScreen(),
                              ),
                            );
                          },
                        ),
                        ProfileMenuItem(
                          icon: CupertinoIcons.creditcard,
                          title: 'Zahlungsmethoden',
                          subtitle: 'Karten und Konten verwalten',
                          onTap: () {
                            Navigator.of(context).push(
                              CupertinoPageRoute(
                                builder: (context) => const PaymentMethodsScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Lists Section
                    ProfileSection(
                      title: 'Listen',
                      items: [
                        ProfileMenuItem(
                          icon: CupertinoIcons.heart,
                          title: 'Meine Listen',
                          subtitle: 'Merkzettel und Favoriten',
                          onTap: () {
                            Navigator.of(context).push(
                              CupertinoPageRoute(
                                builder: (context) => const SavedListsScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Settings Section
                    ProfileSection(
                      title: 'Einstellungen',
                      items: [
                        ProfileMenuItem(
                          icon: CupertinoIcons.settings,
                          title: 'App-Einstellungen',
                          subtitle: 'Benachrichtigungen, Sprache',
                          onTap: () {
                            showCupertinoDialog(
                              context: context,
                              builder: (context) => CupertinoAlertDialog(
                                title: const Text('Einstellungen'),
                                content: const Text('Einstellungen werden noch entwickelt.'),
                                actions: [
                                  CupertinoDialogAction(
                                    child: const Text('OK'),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        ProfileMenuItem(
                          icon: CupertinoIcons.question_circle,
                          title: 'Hilfe & Support',
                          subtitle: 'FAQ, Kontakt, Feedback',
                          onTap: () {
                            showCupertinoDialog(
                              context: context,
                              builder: (context) => CupertinoAlertDialog(
                                title: const Text('Hilfe & Support'),
                                content: const Text('Support-Bereich wird noch entwickelt.'),
                                actions: [
                                  CupertinoDialogAction(
                                    child: const Text('OK'),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Logout Section
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      child: CupertinoButton(
                        color: CupertinoColors.systemRed,
                        borderRadius: BorderRadius.circular(12),
                        onPressed: () {
                          showCupertinoDialog(
                            context: context,
                            builder: (context) => CupertinoAlertDialog(
                              title: const Text('Abmelden'),
                              content: const Text('Möchten Sie sich wirklich abmelden?'),
                              actions: [
                                CupertinoDialogAction(
                                  child: const Text('Abbrechen'),
                                  onPressed: () => Navigator.pop(context),
                                ),
                                CupertinoDialogAction(
                                  isDestructiveAction: true,
                                  child: const Text('Abmelden'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    // TODO: Implement logout
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                        child: const Text(
                          'Abmelden',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  final String title;
  final List<ProfileMenuItem> items;

  const ProfileSection({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: CupertinoColors.systemBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: CupertinoColors.label,
              ),
            ),
          ),
          ...items.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            final isLast = index == items.length - 1;

            return Column(
              children: [
                item,
                if (!isLast)
                  Container(
                    height: 0.5,
                    margin: const EdgeInsets.only(left: 16),
                    color: CupertinoColors.separator,
                  ),
              ],
            );
          }),
        ],
      ),
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.all(16),
      onPressed: onTap,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: CupertinoColors.systemFill,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              icon,
              color: CupertinoColors.activeBlue,
              size: 22,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: CupertinoColors.label,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: CupertinoColors.systemGrey,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            CupertinoIcons.chevron_right,
            color: CupertinoColors.systemGrey3,
            size: 16,
          ),
        ],
      ),
    );
  }
}

class RecentOrderItem extends StatelessWidget {
  final Order order;

  const RecentOrderItem({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: _getStatusColor(order.status),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bestellung #${order.id.length > 8 ? order.id.substring(0, 8) : order.id}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  _getStatusText(order.status),
                  style: TextStyle(
                    fontSize: 12,
                    color: _getStatusColor(order.status),
                  ),
                ),
              ],
            ),
          ),
          Text(
            formatCurrency(order.total),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'delivered':
      case 'zugestellt':
        return CupertinoColors.systemGreen;
      case 'processing':
      case 'in bearbeitung':
        return CupertinoColors.systemOrange;
      case 'shipped':
      case 'versandt':
        return CupertinoColors.activeBlue;
      default:
        return CupertinoColors.systemGrey;
    }
  }

  String _getStatusText(String status) {
    switch (status.toLowerCase()) {
      case 'delivered':
        return 'Zugestellt';
      case 'processing':
        return 'In Bearbeitung';
      case 'shipped':
        return 'Versandt';
      default:
        return status;
    }
  }
}

// Supporting screens (placeholder implementations)
class OrdersListScreen extends StatelessWidget {
  const OrdersListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Meine Bestellungen'),
      ),
      child: const Center(
        child: Text('Bestellungen werden implementiert...'),
      ),
    );
  }
}

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Lieferadressen'),
      ),
      child: const Center(
        child: Text('Adressen werden implementiert...'),
      ),
    );
  }
}

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Zahlungsmethoden'),
      ),
      child: const Center(
        child: Text('Zahlungsmethoden werden implementiert...'),
      ),
    );
  }
}

class SavedListsScreen extends StatelessWidget {
  const SavedListsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Meine Listen'),
      ),
      child: const Center(
        child: Text('Listen werden implementiert...'),
      ),
    );
  }
}