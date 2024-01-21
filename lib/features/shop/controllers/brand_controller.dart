import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

//! variables.
  RxBool isLoading = true.obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  final brandRepository = Get.put(BrandRepository());

  @override
  void onInit() {
    getFeatureBrands();
    super.onInit();
  }

  // Load the brands

  Future<void> getFeatureBrands() async {
    try {
      isLoading.value = true;

      final brands = await brandRepository.getAllBrands();

      // this will load all the brands
      allBrands.assignAll(brands);

      // this will load only the featured brands
      featuredBrands.assignAll(
        allBrands.where((brand) => brand.isFeatured ?? false).take(4),
      );
    } catch (e) {
      TLoaders.errorSnackbar(title: 'OHH Snap.', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // get brand

  // get the brand specific  from your data sourcce.

  Future<List<ProductModel>> getBrandProducts(String brandId) async {
    try {
      final products = await ProductRepository.instance
          .getProductsForBrands(brandId: brandId);
      return products;
    } catch (e) {
      TLoaders.errorSnackbar(
          title: 'some error occured', message: e.toString());
      return [];
    }
  }
}
