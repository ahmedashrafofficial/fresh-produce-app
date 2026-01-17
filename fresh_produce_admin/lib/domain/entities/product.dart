class Product {
  final String id;
  final String name;
  final String unit;
  final double minInventoryAmount;
  final String? imageUrl;
  final double? estimatedWholesalePrice;

  Product({
    required this.id,
    required this.name,
    required this.unit,
    required this.minInventoryAmount,
    this.imageUrl,
    this.estimatedWholesalePrice,
  });
}
