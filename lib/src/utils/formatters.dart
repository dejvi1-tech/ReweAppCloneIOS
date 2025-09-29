import 'package:intl/intl.dart';

String formatCurrency(double value) {
  final formatter = NumberFormat.currency(locale: 'de_DE', symbol: '€');
  return formatter.format(value);
}

String formatUnitPrice(double unitPrice, String unit) {
  final formattedPrice = formatCurrency(unitPrice);

  // Determine the display unit based on the product unit
  String displayUnit;
  if (unit.toLowerCase().contains('kg') || unit.toLowerCase().contains('g')) {
    displayUnit = '100 g';
  } else if (unit.toLowerCase().contains('l') || unit.toLowerCase().contains('ml')) {
    displayUnit = 'l';
  } else {
    displayUnit = unit;
  }

  return '$formattedPrice / $displayUnit';
}

String priceBadge(double price, double? salePrice) {
  if (salePrice != null && salePrice < price) {
    // Sale price first, then crossed out original price
    return '${formatCurrency(salePrice)} ${formatCurrency(price)}';
  }
  return formatCurrency(price);
}

double calculateUnitPrice(double price, double unitSize, String unit) {
  // Calculate price per 100g or per 1l based on unit type
  if (unit.toLowerCase().contains('kg')) {
    // Convert to price per 100g
    return (price / unitSize) / 10;
  } else if (unit.toLowerCase().contains('g')) {
    // Convert to price per 100g
    return (price / unitSize) * 100;
  } else if (unit.toLowerCase().contains('l')) {
    // Convert to price per 1l
    return price / unitSize;
  } else if (unit.toLowerCase().contains('ml')) {
    // Convert to price per 1l
    return (price / unitSize) * 1000;
  }

  // Default: return price per unit
  return price / unitSize;
}

String formatWeight(double weightInKg) {
  if (weightInKg >= 1.0) {
    return '${weightInKg.toStringAsFixed(1)} kg';
  } else {
    return '${(weightInKg * 1000).round()} g';
  }
}

String formatVolume(double volumeInL) {
  if (volumeInL >= 1.0) {
    return '${volumeInL.toStringAsFixed(1)} l';
  } else {
    return '${(volumeInL * 1000).round()} ml';
  }
}

String formatQuantity(int quantity, String unit) {
  if (quantity == 1) {
    return '1 $unit';
  }
  return '$quantity $unit';
}

String formatOfferText(double originalPrice, double salePrice) {
  final saved = originalPrice - salePrice;
  if (saved < 1.0) {
    final centsaved = (saved * 100).round();
    return '$centsaved Cent gespart';
  } else {
    return '${formatCurrency(saved)} gespart';
  }
}

String formatRating(double rating) {
  return rating.toStringAsFixed(1);
}

String formatReviewCount(int count) {
  if (count >= 1000) {
    final thousands = count / 1000;
    return '${thousands.toStringAsFixed(1)}k';
  }
  return count.toString();
}