import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../models/product.dart';
import '../../../providers/providers.dart';
import '../../../utils/formatters.dart';
import '../../product/product_detail_screen.dart';

class CategoryList extends HookConsumerWidget {
  final String categoryId;
  final String categoryName;
  final EdgeInsetsGeometry? padding;

  const CategoryList({
    super.key,
    required this.categoryId,
    required this.categoryName,
    this.padding,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final refreshController = useRefreshController(initialRefresh: false);
    final scrollController = useScrollController();

    final productsAsync = ref.watch(productListProvider);

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
        final categoryProducts = products
            .where((product) => product.category == categoryName)
            .toList();

        if (categoryProducts.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  CupertinoIcons.shopping_cart,
                  size: 64,
                  color: CupertinoColors.systemGrey3,
                ),
                const SizedBox(height: 16),
                Text(
                  'Keine Produkte in $categoryName',
                  style: CupertinoTheme.of(context).textTheme.textStyle,
                ),
              ],
            ),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category Header
            Padding(
              padding: padding ?? const EdgeInsets.all(16),
              child: Row(
                children: [
                  Text(
                    categoryName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.label,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${categoryProducts.length} Artikel',
                    style: const TextStyle(
                      fontSize: 14,
                      color: CupertinoColors.systemGrey,
                    ),
                  ),
                ],
              ),
            ),
            // Products List
            Expanded(
              child: SmartRefresher(
                controller: refreshController,
                onRefresh: () async {
                  ref.refresh(productListProvider);
                  refreshController.refreshCompleted();
                },
                child: ListView.builder(
                  controller: scrollController,
                  padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: categoryProducts.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: CategoryProductCard(product: categoryProducts[index]),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class CategoryProductCard extends StatelessWidget {
  final Product product;

  const CategoryProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final unitPrice = calculateUnitPrice(product.price, product.unitSize, product.unit);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (context) => ProductDetailScreen(productId: product.id),
          ),
        );
      },
      child: Container(
        height: 120,
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
        child: Row(
          children: [
            // Product Image
            Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.horizontal(left: Radius.circular(12)),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.horizontal(left: Radius.circular(12)),
                    child: product.imageUrls.isNotEmpty
                        ? CachedNetworkImage(
                            imageUrl: product.imageUrls.first,
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              color: CupertinoColors.systemGrey6,
                              child: const Center(
                                child: CupertinoActivityIndicator(),
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
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
                  // Badges
                  if (product.hasOffer && product.offerText != null)
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: CupertinoColors.systemRed,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          'Angebot',
                          style: const TextStyle(
                            color: CupertinoColors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  if (product.isOrganic)
                    Positioned(
                      bottom: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: CupertinoColors.systemGreen,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          'Bio',
                          style: const TextStyle(
                            color: CupertinoColors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            // Product Details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Brand
                    Text(
                      product.brand,
                      style: const TextStyle(
                        fontSize: 12,
                        color: CupertinoColors.systemGrey,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    // Product Name
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: CupertinoColors.label,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
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
                        Text(
                          '${formatRating(product.rating)} (${formatReviewCount(product.reviewCount)})',
                          style: const TextStyle(
                            fontSize: 10,
                            color: CupertinoColors.systemGrey,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    // Price Section
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                if (product.hasOffer && product.originalPrice > product.price) ...[
                                  Text(
                                    formatCurrency(product.price),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: CupertinoColors.systemRed,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    formatCurrency(product.originalPrice),
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: CupertinoColors.systemGrey,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ] else
                                  Text(
                                    formatCurrency(product.price),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: CupertinoColors.label,
                                    ),
                                  ),
                              ],
                            ),
                            Text(
                              formatUnitPrice(unitPrice, product.unit),
                              style: const TextStyle(
                                fontSize: 10,
                                color: CupertinoColors.systemGrey,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        // Add to Cart Button
                        CupertinoButton(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          minSize: 32,
                          color: CupertinoColors.activeBlue,
                          borderRadius: BorderRadius.circular(20),
                          onPressed: () {
                            // TODO: Add to cart functionality
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
                          child: const Icon(
                            CupertinoIcons.plus,
                            size: 16,
                            color: CupertinoColors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Mock SmartRefresher for compilation
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
    return RefreshIndicator(
      onRefresh: () async {
        onRefresh?.call();
      },
      child: child,
    );
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