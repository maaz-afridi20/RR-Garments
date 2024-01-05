import 'package:coding_with_t_ecommerce2/utils/constants/image_string.dart';

class CartModel {
  final String cartId;
  final List<CartItemModel> items;

  CartModel({
    required this.cartId,
    required this.items,
  });
}

class CartItemModel {
  final String productId;
  final String variantId;
  final int quantity;
  final String title;
  final String image;
  final String brandName;
  final double price;
  final List<String> selectedVariation;

  CartItemModel({
    required this.productId,
    required this.variantId,
    required this.quantity,
    required this.title,
    required this.image,
    required this.brandName,
    required this.price,
    required this.selectedVariation,
  });
}

class Product {
  final String title;
  final String thumbnail;
  final Brand? brand; // Assuming Brand is another class
  final List<ProductVariation>?
      productVariations; // Assuming ProductVariation is another class

  Product({
    required this.title,
    required this.thumbnail,
    this.brand,
    this.productVariations,
  });
}

class Brand {
  final String name;

  Brand({required this.name});
}

class ProductVariation {
  final double price;
  final List<String> attributeValues;

  ProductVariation({
    required this.price,
    required this.attributeValues,
  });
}

List<Product> products = [
  Product(
    title: 'Product 1',
    thumbnail: TImages.animalIcon,
    brand: Brand(name: 'Brand A'),
    productVariations: [
      ProductVariation(
        price: 19.99,
        attributeValues: ['Size: M', 'Color: Blue'],
      ),
    ],
  ),
];
