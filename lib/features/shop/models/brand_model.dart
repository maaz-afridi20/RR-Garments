import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class BrandModel {
  String id;
  String image;
  String name;
  int? productsCount;
  bool? isFeatured;

  BrandModel(
      {required this.id,
      required this.image,
      required this.name,
      this.productsCount,
      this.isFeatured});

//! convert to json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'productsCount': productsCount,
      'isFeatured': isFeatured,
      'image': image,
    };
  }

//! for getting the data from the firebase in the type of json(map).

  factory BrandModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return BrandModel(
        id: data['id'] ?? '',
        image: data['image'] ?? '',
        name: data['name'] ?? '',
        productsCount: data['productsCount'] ?? '',
        isFeatured: data['isFeatured']! ?? false);
  }
}
