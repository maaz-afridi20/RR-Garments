import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final _categoryRepository = Get.put(CategoryRepository());
  final RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  final RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  final isLoading = false.obs;

  // hm chahtay hain k siraf pahlii baar jab ye app open ho tu siraf aik hii baaar
  // ye call ho tu hm on init method ko use krtay hainn.. tkay baar baar
  // use na karein orr data slow na ho..

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

//!  Load the data

  Future<void> fetchCategories() async {
    try {
      //! show the loader while category is loading
      isLoading.value = true;

      //! fetch the categories
      final categories = await _categoryRepository.getAllCategories();

      //! update the categories list
      // ye hm nay iss liye use kiyaa hai assignAll k hm agar
      // dobara dobara firebase ko call karengay tu ye bad approach hai
      // tu hm nay ye kiya k jo b aik dafa fetch ho jaye us ko all categories list
      // mein add krr diya hai tu ab jab b  humein category k related kuch b
      // fetch krna ho tu hm siraf isss method ko call karengay tu iss say
      // hm zyada loading orr size say bach jayengay....
      allCategories.assignAll(categories);

      //! filter the featured categories
      // tu jo ham nay ye likha hm nay featured categories meiin wo
      // all categories ko use kiyaa hai orr uss all categories
      // mein hm nay where ko use kuyaa hai tu ye uss ko dhekegaaa k jiss ki
      // parent id empty haii matlab k jo khud parent hai...
      // by this use hm parent category ko fetch kr lengay
      // orr hm nay take(8) likha hai kk matlab un mei siraf 8 categories ko fetch kro
      // orr baad mein hm nay uss ko tolist kr diya. hai..
      featuredCategories.assignAll(allCategories
          .where(
              (categoryy) => categoryy.isFeatured && categoryy.parentId.isEmpty)
          .take(8)
          .toList());
    } catch (e) {
      TLoaders.errorSnackbar(title: 'OOPSS', message: e.toString());
    } finally {
      //! remove the loader
      isLoading.value = false;
    }
  }

//! load the selected category data

//! Get the category and subcategory

  Future<List<ProductModel>> getCategoryProducts(
      {required String categoryId, int limit = 4}) async {
    final products = await ProductRepository.instance
        .getProductsForCategory(categoryId: categoryId, limit: limit);
    return products;
  }
}
