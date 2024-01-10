import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class ProductCategoryModel {
  String productId;
  String categoryId;
  ProductCategoryModel({
    required this.categoryId,
    required this.productId,
  });

  //! convert to json

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'categoryId': categoryId,
    };
  }

//! from snapshot(firebase)

  factory ProductCategoryModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return ProductCategoryModel(
        categoryId: data['categoryId'] ?? '',
        productId: data['productId'] ?? '');
  }
}
