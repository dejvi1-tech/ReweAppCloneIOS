import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/product.dart';
import '../../providers/providers.dart';
import '../../utils/formatters.dart';

class ProductDetailScreen extends HookConsumerWidget {
  final String productId;

  const ProductDetailScreen({
    super.key,
    required this.productId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedVariantId = useState<String?>(null);
    final quantity = useState(1);
    final pageController = usePageController();
    final currentImageIndex = useState(0);

    final productsAsync = ref.watch(productListProvider);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Produktdetails'),
        leading: CupertinoNavigationBarBackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      child: productsAsync.when(
        loading: () => const Center(child: CupertinoActivityIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                CupertinoIcons.exclamationmark_circle,
                size: 64,
                color: CupertinoColors.systemRed,
              ),
              const SizedBox(height: 16),
              const Text('Fehler beim Laden des Produkts'),
              const SizedBox(height: 16),
              CupertinoButton(
                onPressed: () => ref.refresh(productListProvider),
                child: const Text('Erneut versuchen'),
              ),
            ],
          ),
        ),
        data: (products) {
          final product = products.firstWhere(
            (p) => p.id == productId,
            orElse: () => products.first,
          );

          // Set default variant if not selected
          if (selectedVariantId.value == null && product.variants.isNotEmpty) {
            selectedVariantId.value = product.variants.first.id;
          }

          final selectedVariant = product.variants.firstWhere(
            (v) => v.id == selectedVariantId.value,
            orElse: () => product.variants.first,
          );

          final unitPrice = calculateUnitPrice(product.price, product.unitSize, product.unit);

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Multi-Image Carousel
                      if (product.imageUrls.isNotEmpty)
                        MultiImageCarousel(
                          images: product.imageUrls,
                          controller: pageController,
                          currentIndex: currentImageIndex,
                          hasOffer: product.hasOffer,
                          isOrganic: product.isOrganic,
                        ),

                      // Product Info
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Brand
                            Text(
                              product.brand,
                              style: const TextStyle(
                                fontSize: 14,
                                color: CupertinoColors.systemGrey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4),

                            // Product Name
                            Text(
                              product.name,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: CupertinoColors.label,
                              ),
                            ),
                            const SizedBox(height: 8),

                            // Rating
                            Row(
                              children: [
                                ...List.generate(5, (index) {
                                  return Icon(
                                    index < product.rating.floor()
                                        ? CupertinoIcons.star_fill
                                        : (index < product.rating
                                            ? CupertinoIcons.star_lefthalf_fill
                                            : CupertinoIcons.star),
                                    size: 16,
                                    color: CupertinoColors.systemYellow,
                                  );
                                }),
                                const SizedBox(width: 8),
                                Text(
                                  '${formatRating(product.rating)} (${formatReviewCount(product.reviewCount)} Bewertungen)',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: CupertinoColors.systemGrey,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),

                            // Price Section
                            Row(
                              children: [
                                if (product.hasOffer && product.originalPrice > product.price) ...[
                                  Text(
                                    formatCurrency(product.price),
                                    style: const TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: CupertinoColors.systemRed,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    formatCurrency(product.originalPrice),
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: CupertinoColors.systemGrey,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ] else
                                  Text(
                                    formatCurrency(product.price),
                                    style: const TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: CupertinoColors.label,
                                    ),
                                  ),
                              ],
                            ),
                            Text(
                              formatUnitPrice(unitPrice, product.unit),
                              style: const TextStyle(
                                fontSize: 14,
                                color: CupertinoColors.systemGrey,
                              ),
                            ),

                            // Offer Badge
                            if (product.hasOffer && product.offerText != null)
                              Container(
                                margin: const EdgeInsets.only(top: 8),
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: CupertinoColors.systemRed,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  product.offerText!,
                                  style: const TextStyle(
                                    color: CupertinoColors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                            const SizedBox(height: 24),

                            // Description
                            Text(
                              'Beschreibung',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: CupertinoColors.label,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              product.description,
                              style: const TextStyle(
                                fontSize: 14,
                                color: CupertinoColors.systemGrey,
                                height: 1.4,
                              ),
                            ),
                            const SizedBox(height: 24),

                            // Variants Picker
                            if (product.variants.length > 1)
                              VariantPicker(
                                variants: product.variants,
                                selectedVariantId: selectedVariantId.value,
                                onVariantSelected: (variantId) {
                                  selectedVariantId.value = variantId;
                                },
                              ),

                            // Quantity Selector
                            QuantitySelector(
                              quantity: quantity.value,
                              unit: product.unit,
                              onQuantityChanged: (newQuantity) {
                                quantity.value = newQuantity;
                              },
                            ),
                          ],
                        ),
                      ),

                      // Recommended Products
                      RecommendedProducts(
                        category: product.category,
                        excludeProductId: product.id,
                      ),
                    ],
                  ),
                ),
              ),

              // Add to Cart Button
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: CupertinoColors.systemBackground,
                  border: Border(
                    top: BorderSide(
                      color: CupertinoColors.separator,
                      width: 0.5,
                    ),
                  ),
                ),
                child: SafeArea(
                  child: SizedBox(
                    width: double.infinity,
                    child: CupertinoButton(
                      color: CupertinoColors.activeBlue,
                      borderRadius: BorderRadius.circular(12),
                      onPressed: () {
                        final cartNotifier = ref.read(cartProvider.notifier);
                        final cartItem = CartItem(
                          productId: product.id,
                          variantId: selectedVariant.id,
                          quantity: quantity.value,
                          price: selectedVariant.price,
                          name: product.name,
                          imageUrl: product.imageUrls.isNotEmpty ? product.imageUrls.first : '',
                          specialOffer: product.hasOffer ? product.offerText : null,
                        );

                        cartNotifier.addItem(cartItem);

                        // Show confirmation
                        showCupertinoDialog(
                          context: context,
                          builder: (context) => CupertinoAlertDialog(
                            title: const Text('Hinzugefügt!'),
                            content: Text('${quantity.value}x ${product.name} wurde zum Warenkorb hinzugefügt'),
                            actions: [
                              CupertinoDialogAction(
                                child: const Text('Weiter einkaufen'),
                                onPressed: () => Navigator.pop(context),
                              ),
                              CupertinoDialogAction(
                                isDefaultAction: true,
                                child: const Text('Zum Warenkorb'),
                                onPressed: () {
                                  Navigator.pop(context);
                                  // TODO: Navigate to cart screen
                                },
                              ),
                            ],
                          ),
                        );
                      },
                      child: Text(
                        'Für ${formatCurrency(selectedVariant.price * quantity.value)} in den Warenkorb',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class MultiImageCarousel extends StatelessWidget {
  final List<String> images;
  final PageController controller;
  final ValueNotifier<int> currentIndex;
  final bool hasOffer;
  final bool isOrganic;

  const MultiImageCarousel({
    super.key,
    required this.images,
    required this.controller,
    required this.currentIndex,
    required this.hasOffer,
    required this.isOrganic,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        children: [
          PageView.builder(
            controller: controller,
            onPageChanged: (index) {
              currentIndex.value = index;
            },
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                color: CupertinoColors.systemGrey6,
                child: Image.asset(
                  images[index],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Center(
                    child: Icon(
                      CupertinoIcons.photo,
                      size: 64,
                      color: CupertinoColors.systemGrey3,
                    ),
                  ),
                ),
              );
            },
          ),

          // Badges
          Positioned(
            top: 16,
            left: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (hasOffer)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: CupertinoColors.systemRed,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      'Angebot',
                      style: TextStyle(
                        color: CupertinoColors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                if (isOrganic)
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: CupertinoColors.systemGreen,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      'Bio',
                      style: TextStyle(
                        color: CupertinoColors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ),

          // Page Indicator
          if (images.length > 1)
            Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: ValueListenableBuilder<int>(
                valueListenable: currentIndex,
                builder: (context, index, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: images.asMap().entries.map((entry) {
                      return Container(
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: entry.key == index
                              ? CupertinoColors.white
                              : CupertinoColors.white.withValues(alpha: 0.4),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

class VariantPicker extends StatelessWidget {
  final List<ProductVariant> variants;
  final String? selectedVariantId;
  final Function(String) onVariantSelected;

  const VariantPicker({
    super.key,
    required this.variants,
    required this.selectedVariantId,
    required this.onVariantSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Größe/Variante',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: CupertinoColors.label,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: variants.map((variant) {
            final isSelected = variant.id == selectedVariantId;
            return GestureDetector(
              onTap: () => onVariantSelected(variant.id),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? CupertinoColors.activeBlue : CupertinoColors.systemBackground,
                  border: Border.all(
                    color: isSelected ? CupertinoColors.activeBlue : CupertinoColors.separator,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '${variant.name} - ${formatCurrency(variant.price)}',
                  style: TextStyle(
                    color: isSelected ? CupertinoColors.white : CupertinoColors.label,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final String unit;
  final Function(int) onQuantityChanged;

  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.unit,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isWeightBased = unit.toLowerCase().contains('kg') || unit.toLowerCase().contains('g');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Menge',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: CupertinoColors.label,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            CupertinoButton(
              padding: const EdgeInsets.all(8),
              minSize: 44,
              onPressed: quantity > 1 ? () => onQuantityChanged(quantity - 1) : null,
              child: const Icon(CupertinoIcons.minus),
            ),
            Container(
              width: 60,
              height: 44,
              decoration: BoxDecoration(
                border: Border.all(color: CupertinoColors.separator),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  isWeightBased ? '${quantity.toStringAsFixed(1)} kg' : quantity.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            CupertinoButton(
              padding: const EdgeInsets.all(8),
              minSize: 44,
              onPressed: () => onQuantityChanged(quantity + 1),
              child: const Icon(CupertinoIcons.plus),
            ),
          ],
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}

class RecommendedProducts extends ConsumerWidget {
  final String category;
  final String excludeProductId;

  const RecommendedProducts({
    super.key,
    required this.category,
    required this.excludeProductId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(productListProvider);

    return productsAsync.when(
      loading: () => const SizedBox(),
      error: (error, stack) => const SizedBox(),
      data: (products) {
        final recommendedProducts = products
            .where((p) => p.category == category && p.id != excludeProductId)
            .take(6)
            .toList();

        if (recommendedProducts.isEmpty) return const SizedBox();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Empfohlene Produkte',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.label,
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: recommendedProducts.length,
                itemBuilder: (context, index) {
                  final product = recommendedProducts[index];
                  return Container(
                    width: 140,
                    margin: const EdgeInsets.only(right: 12),
                    child: RecommendedProductCard(product: product),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
          ],
        );
      },
    );
  }
}

class RecommendedProductCard extends StatelessWidget {
  final Product product;

  const RecommendedProductCard({super.key, required this.product});

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
        decoration: BoxDecoration(
          color: CupertinoColors.systemBackground,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: CupertinoColors.separator, width: 0.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                child: product.imageUrls.isNotEmpty
                    ? Image.asset(
                        product.imageUrls.first,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: CupertinoColors.systemGrey6,
                          child: const Icon(CupertinoIcons.photo, color: CupertinoColors.systemGrey3),
                        ),
                      )
                    : Container(
                        color: CupertinoColors.systemGrey6,
                        child: const Icon(CupertinoIcons.photo, color: CupertinoColors.systemGrey3),
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    formatCurrency(product.price),
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    formatUnitPrice(unitPrice, product.unit),
                    style: const TextStyle(fontSize: 10, color: CupertinoColors.systemGrey),
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