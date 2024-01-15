import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

//! variables

  final isLoading = false.obs;
  RxList<ProductModel> featuredProductsList = <ProductModel>[].obs;
  final productRepository = Get.put(ProductRepository());

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
      isLoading.value = true;

      //! fetch the products
      final products = await productRepository.getFeaturedProduct();

      //
      //! assign all that gained products to the featured products list above
      featuredProductsList.assignAll(products);
    } catch (e) {
      print('in try block element are ${products.length}');
      TLoaders.errorSnackbar(title: 'OOPS!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

//! for getting the price.
  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    //! if no variation exists return the simple price or the sale price
// ye return karega k agar sale price ki value greater hai 0 say matalab k
// kuch sale mein hai ya sale laga huaa hai tu humein sale price
// return kar dega else simple price return kr dega.
    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price)
          .toString();
    } else {
      // calculate the smallest and largest price among the variations
      // ye wala loop product vatiatino ki sari values mein loop
      // karega.
      for (var variation in product.productVariations!) {
        // determine the price to consider (sale price if available,otherwise regular price)
        double priceToConsider =
            product.salePrice > 0.0 ? variation.salePrice : variation.price;

        // update the prices of smallest and largest

        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }
        if (priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
      }
      // if the smalles and the largest are same
      // if (smallestPrice.isEqual(largestPrice)) {
      if (smallestPrice.isEqual(largestPrice)) {
        return largestPrice.toString();
      } else {
        return '$smallestPrice ~ \$$largestPrice';
      }
    }
  }

//! for calculating the percentage
  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

//! get the stock status of the product

  String getProductStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out Of Stock';
  }
}
