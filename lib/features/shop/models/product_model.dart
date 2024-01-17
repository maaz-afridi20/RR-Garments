import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class ProductModel {
  String id;
  String title;
  int stock;
  double price;
  bool? isFeatured;
  String thumbnail;
  String? description;
  DateTime? date;
  BrandModel? brand;
  List<String>? images;
  double salePrice;
  String? sku;
  String? categoryId;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;
  String productType;

  ProductModel({
    this.images,
    this.isFeatured,
    this.date,
    this.productVariations,
    this.productAttributes,
    this.categoryId,
    this.sku,
    this.brand,
    this.description,
    required this.id,
    required this.title,
    required this.stock,
    required this.price,
    required this.thumbnail,
    this.salePrice = 0.0,
    required this.productType,
  });

  //! empty model

  static ProductModel empty() => ProductModel(
      id: '', title: '', stock: 0, price: 0, thumbnail: '', productType: '');
//
//
//! convert to json
  toJson() {
    return {
      'SKU': sku,
      'Title': title,
      'Stock': stock,
      'Price': price,
      'Images': images ?? [],
      'Thumbnail': thumbnail,
      'SalePrice': salePrice,
      'IsFeatured': isFeatured,
      'CategoryId': categoryId,
      'Brand': brand!.toJson(),
      'Description': description,
      'ProductType': productType,
      'ProductAttributes': productAttributes != null
          ? productAttributes!.map((e) => e.toJson()).toList()
          : [],
      'ProductVariations': productVariations != null
          ? productVariations!.map((e) => e.toJson()).toList()
          : [],
      // 'ProductAttributes':
      //     productAttributes?.map((attr) => attr.toJson()).toList(),
      // 'ProductVariations':
      //     productVariations?.map((variation) => variation.toJson()).toList(),
      // 'Id': id,
      // 'Brand': BrandModel(id: id, image: image, name: name).toJson(),
      // 'Brand': TDummyData.products[0].brand.toJson(),
    };
  }

//! getting from firebase

  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return ProductModel.empty();

    final data = document.data()!;

    return ProductModel(
        id: document.id,
        // id: data['Id'] ?? '',
        sku: data['SKU'],
        title: data['Title'],
        stock: data['Stock'] ?? 0,
        isFeatured: data['IsFeatured'] ?? false,
        // price: data['Price'] ?? 0.0.toDouble(),

        //
        //
        price: double.parse((data['Price'] ?? 0.0).toString()),

        //! {price: double.tryParse(data['Price'].toString()) ?? 0.0,}

        // salePrice: (data['SalePrice'] ?? 0.0),
        salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
        //!   { salePrice: double.tryParse(data['SalePrice'].toString()) ?? 0.0,  }
        thumbnail: data['Thumbnail'] ?? '',
        categoryId: data['CategoryId'] ?? '',
        description: data['Description'] ?? '',
        productType: data['ProductType'] ?? '',
        // brand: data['Brand'] ?? '',
        brand: BrandModel.fromJson(data['Brand']),
        // salePrice: data['SalePrice'] ?? '',
        // productAttributes: data['ProductAttributes'] ?? '',

        //
        images: data['Images'] != null ? List<String>.from(data['Images']) : [],
        //

        productAttributes: (data['ProductAttributes'] as List<dynamic>)
            .map((e) => ProductAttributeModel.fromJson(e))
            .toList(),
        // my logic
        // productAttributes: (data['ProductAttributes'] as List<dynamic>?)
        //         ?.map((attributes) =>
        //             ProductAttributeModel.fromJson(attributes ?? {}))
        //         .toList() ??
        //     [],
        //
        //

//! sir logic.
        productVariations: (data['ProductVariations'] as List<dynamic>)
            .map((e) => ProductVariationModel.fromJson(e))
            .toList()

        // my logic
        // productVariations: (data['ProductVariations'] as List<dynamic>?)
        //         ?.map((variations) =>
        //             ProductVariationModel.fromJson(variations ?? {}))
        //         .toList() ??
        //     [],
        );
  }

  factory ProductModel.fromQuerySnapshot(
      QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;

    return ProductModel(
      id: document.id,
      title: data['Title'],
      sku: data['Sku'] ?? '',
      stock: data['Stock'] ?? 0,
      isFeatured: data['IsFeatured'] ?? false,
      price: double.parse((data['Price'] ?? 0.0).toString()),
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      thumbnail: data['Thumbnail'] ?? '',
      categoryId: data['CategoryId'],
      description: data['Description'],
      productType: data['ProductType'] ?? '',
      brand: BrandModel.fromJson(data['Brand']),
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      productAttributes: (data['ProductAttributes'] as List<dynamic>)
          .map((e) => ProductAttributeModel.fromJson(e))
          .toList(),
      productVariations: (data['ProductVariations'] as List<dynamic>)
          .map((e) => ProductVariationModel.fromJson(e))
          .toList(),
    );
  }
}
