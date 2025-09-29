import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../routes.dart';
import '../../providers/providers.dart';
import 'widgets/product_grid.dart';
import '../cart/cart_screen.dart';
import '../profile/profile_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: 'Suchen',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart),
            label: 'Warenkorb',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Profil',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return _buildHomeTab(context);
          case 1:
            return _buildSearchTab();
          case 2:
            return _buildCartTab(context);
          case 3:
            return _buildProfileTab(context);
          default:
            return Container();
        }
      },
    );
  }

  Widget _buildHomeTab(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('REWE'),
        trailing: Consumer(
          builder: (context, ref, child) {
            final cartItems = ref.watch(cartProvider);
            final itemCount = cartItems.fold<int>(0, (sum, item) => sum + item.quantity);

            return GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(AppRoutes.cart),
              child: Stack(
                children: [
                  const Icon(CupertinoIcons.shopping_cart),
                  if (itemCount > 0)
                    Positioned(
                      right: -6,
                      top: -6,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          color: CupertinoColors.systemRed,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Text(
                          '$itemCount',
                          style: const TextStyle(
                            color: CupertinoColors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Banner
            Container(
              width: double.infinity,
              height: 120,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [CupertinoColors.systemRed, Color(0xFFD32F2F)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Guten Tag!',
                      style: TextStyle(
                        color: CupertinoColors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Entdecke frische Lebensmittel',
                      style: TextStyle(
                        color: CupertinoColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Product Grid
            const Expanded(
              child: ProductGrid(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchTab() {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Suchen'),
      ),
      child: Center(
        child: Text(
          'Suchfunktion',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  Widget _buildCartTab(BuildContext context) {
    return const CartScreen();
  }

  Widget _buildProfileTab(BuildContext context) {
    return const ProfileScreen();
  }
}