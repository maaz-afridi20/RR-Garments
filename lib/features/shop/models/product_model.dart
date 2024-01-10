import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class ProductModel {
  final String id;
  final String title;
  final int stock;
  final double price;
  final bool isFeatured;
  final String thumbnail;
  final String description;
  final BrandModel brand;
  final List<String>? images;
  final double salePrice;
  final String sku;
  final String categoryId;
  final List<ProductAttributeModel> productAttributes;
  final List<ProductVariationModel>? productVariations;
  final String productType;

  ProductModel({
    required this.id,
    required this.title,
    required this.stock,
    required this.price,
    required this.isFeatured,
    required this.thumbnail,
    required this.description,
    required this.brand,
    this.images,
    required this.salePrice,
    required this.sku,
    required this.categoryId,
    required this.productAttributes,
    this.productVariations,
    required this.productType,
  });
}
