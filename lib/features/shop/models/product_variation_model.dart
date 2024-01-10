class ProductVariationModel {
  final String id;
  final int stock;
  final double price;
  final double? salePrice;
  final String image;
  final String? description;
  final Map<String, String> attributesValues;

  ProductVariationModel({
    required this.id,
    required this.stock,
    required this.price,
    this.salePrice,
    required this.image,
    this.description,
    required this.attributesValues,
  });
}
