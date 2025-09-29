import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../models/product.dart';
import '../../../providers/providers.dart';
import '../../../utils/formatters.dart';
import '../../product/product_detail_screen.dart';

class ProductGrid extends HookConsumerWidget {
  final String? categoryFilter;
  final EdgeInsetsGeometry? padding;

  const ProductGrid({
    super.key,
    this.categoryFilter,
    this.padding,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final refreshController = useRefreshController(initialRefresh: false);
    final scrollController = useScrollController();
    final currentPage = useState(1);
    const itemsPerPage = 20;

    print('🏠 ProductGrid: Building ProductGrid widget...');
    final productsAsync = ref.watch(productListProvider);
    print('🏠 ProductGrid: Watched productListProvider, state: ${productsAsync.runtimeType}');

    return productsAsync.when(
      loading: () => const Center(
        child: CupertinoActivityIndicator(),
      ),
      error: (error, stack) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              CupertinoIcons.exclamationmark_circle,
              size: 48,
              color: CupertinoColors.systemRed,
            ),
            const SizedBox(height: 16),
            Text(
              'Fehler beim Laden der Produkte',
              style: CupertinoTheme.of(context).textTheme.textStyle,
            ),
            const SizedBox(height: 8),
            CupertinoButton(
              onPressed: () => ref.refresh(productListProvider),
              child: const Text('Erneut versuchen'),
            ),
          ],
        ),
      ),
      data: (products) {
        final filteredProducts = categoryFilter != null
            ? products.where((product) => product.category == categoryFilter).toList()
            : products;

        final displayedProducts = filteredProducts.take(currentPage.value * itemsPerPage).toList();

        return SmartRefresher(
          controller: refreshController,
          onRefresh: () async {
            ref.refresh(productListProvider);
            refreshController.refreshCompleted();
          },
          onLoading: () async {
            if (displayedProducts.length < filteredProducts.length) {
              await Future.delayed(const Duration(milliseconds: 500));
              currentPage.value++;
              refreshController.loadComplete();
            } else {
              refreshController.loadNoData();
            }
          },
          enablePullUp: displayedProducts.length < filteredProducts.length,
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Calculate responsive columns
              const minTileWidth = 170.0;
              final crossAxisCount = (constraints.maxWidth / minTileWidth).floor().clamp(2, 4);
              final childAspectRatio = _calculateAspectRatio(constraints.maxWidth, crossAxisCount);
              final bottomNavHeight = kBottomNavigationBarHeight;
              final bottomPadding = MediaQuery.of(context).padding.bottom;

              return GridView.builder(
                controller: scrollController,
                padding: (padding ?? const EdgeInsets.all(16)).add(
                  EdgeInsets.only(bottom: bottomNavHeight + bottomPadding + 16)
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  childAspectRatio: childAspectRatio,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: displayedProducts.length,
                itemBuilder: (context, index) {
                  return ProductTile(product: displayedProducts[index]);
                },
              );
            },
          ),
        );
      },
    );
  }

  double _calculateAspectRatio(double screenWidth, int columns) {
    // Adjust aspect ratio for different screen sizes and column counts
    if (screenWidth > 414) {
      // Larger screens (iPad, etc.)
      return columns == 4 ? 0.8 : 0.75;
    } else {
      // Standard iPhone sizes
      return columns == 3 ? 0.7 : 0.75;
    }
  }
}

class ProductTile extends ConsumerWidget {
  final Product product;

  const ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => ProductDetailScreen(productId: product.id),
              ),
            );
          },
          child: AspectRatio(
            aspectRatio: 0.75,
            child: Container(
              decoration: BoxDecoration(
                color: CupertinoColors.systemBackground,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: CupertinoColors.separator,
                  width: 0.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: CupertinoColors.systemGrey.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              clipBehavior: Clip.hardEdge,
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product Image with badges
                      AspectRatio(
                        aspectRatio: 4 / 3,
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                              ),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                                child: product.imageUrls.isNotEmpty
                                    ? Image.asset(
                                        product.imageUrls.first,
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) => Container(
                                          color: CupertinoColors.systemGrey6,
                                          child: const Icon(
                                            CupertinoIcons.photo,
                                            size: 32,
                                            color: CupertinoColors.systemGrey3,
                                          ),
                                        ),
                                      )
                                    : Container(
                                        color: CupertinoColors.systemGrey6,
                                        child: const Icon(
                                          CupertinoIcons.photo,
                                          size: 32,
                                          color: CupertinoColors.systemGrey3,
                                        ),
                                      ),
                              ),
                            ),
                            // Badges
                            Positioned(
                              top: 8,
                              left: 8,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (product.hasOffer && product.offerText != null)
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: CupertinoColors.systemRed,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: const Text(
                                        'Angebot',
                                        style: TextStyle(
                                          color: CupertinoColors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  if (product.isOrganic)
                                    Container(
                                      margin: const EdgeInsets.only(top: 4),
                                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: CupertinoColors.systemGreen,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: const Text(
                                        'Bio',
                                        style: TextStyle(
                                          color: CupertinoColors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Product Details
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Brand
                              Text(
                                product.brand,
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: CupertinoColors.systemGrey,
                                  fontWeight: FontWeight.w500,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 2),
                              // Product Name
                              Flexible(
                                child: Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: CupertinoColors.label,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(height: 4),
                              // Rating
                              Row(
                                children: [
                                  ...List.generate(5, (index) {
                                    return Icon(
                                      index < product.rating.floor()
                                          ? CupertinoIcons.star_fill
                                          : (index < product.rating ? CupertinoIcons.star_lefthalf_fill : CupertinoIcons.star),
                                      size: 12,
                                      color: CupertinoColors.systemYellow,
                                    );
                                  }),
                                  const SizedBox(width: 4),
                                  Flexible(
                                    child: Text(
                                      '${formatRating(product.rating)} (${formatReviewCount(product.reviewCount)})',
                                      style: const TextStyle(
                                        fontSize: 10,
                                        color: CupertinoColors.systemGrey,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              // Price Section - Reserve space for button
                              Padding(
                                padding: const EdgeInsets.only(bottom: 32),
                                child: Row(
                                  children: [
                                    if (product.hasOffer && product.originalPrice > product.price) ...[
                                      Text(
                                        formatCurrency(product.price),
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: CupertinoColors.systemRed,
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      Flexible(
                                        child: Text(
                                          formatCurrency(product.originalPrice),
                                          style: const TextStyle(
                                            fontSize: 10,
                                            color: CupertinoColors.systemGrey,
                                            decoration: TextDecoration.lineThrough,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ] else
                                      Text(
                                        formatCurrency(product.price),
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: CupertinoColors.label,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Add Button positioned at bottom
                  Positioned(
                    bottom: 8 + (bottomPadding > 0 ? 4 : 0),
                    left: 8,
                    right: 8,
                    child: SizedBox(
                      height: 28,
                      child: CupertinoButton(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        color: CupertinoColors.activeBlue,
                        borderRadius: BorderRadius.circular(6),
                        onPressed: () {
                          final cartItem = CartItem(
                            productId: product.id,
                            variantId: product.variants.isNotEmpty ? product.variants.first.id : 'default',
                            quantity: 1,
                            price: product.price,
                            name: product.name,
                            imageUrl: product.imageUrls.isNotEmpty ? product.imageUrls.first : '',
                          );
                          ref.read(cartProvider.notifier).addItem(cartItem);

                          // Show success feedback
                          showCupertinoDialog(
                            context: context,
                            builder: (context) => CupertinoAlertDialog(
                              title: const Text('Hinzugefügt'),
                              content: Text('${product.name} wurde zum Warenkorb hinzugefügt'),
                              actions: [
                                CupertinoDialogAction(
                                  child: const Text('OK'),
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Semantics(
                          label: 'Hinzufügen ${product.name} zum Warenkorb',
                          button: true,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                CupertinoIcons.plus,
                                size: 12,
                                color: CupertinoColors.white,
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Hinzufügen',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: CupertinoColors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// Cupertino-compatible SmartRefresher
class SmartRefresher extends StatelessWidget {
  final Widget child;
  final Function()? onRefresh;
  final Function()? onLoading;
  final bool enablePullUp;
  final dynamic controller;

  const SmartRefresher({
    super.key,
    required this.child,
    this.onRefresh,
    this.onLoading,
    this.enablePullUp = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return child; // Just return the child for now, no pull-to-refresh
  }
}

// Mock refresh controller hook
RefreshController useRefreshController({bool initialRefresh = false}) {
  return RefreshController();
}

class RefreshController {
  void refreshCompleted() {}
  void loadComplete() {}
  void loadNoData() {}
}