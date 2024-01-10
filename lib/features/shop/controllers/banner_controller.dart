import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class BannerController extends GetxController {
  // varaibles
  final carouselCurrentIndex = 0.obs;
  final isLoading = false.obs;

  final RxList<BannerModel> bannersList = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

//! update the page index.(for the home page courousel index).
  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

  //fetch the banners.

  Future<void> fetchBanners() async {
    try {
      //! show the loader while category is loading
      isLoading.value = true;

      //! fetch all the banners

      final bannerRepository = Get.put(BannerRepository());
      final banners = await bannerRepository.fetchBanners();

      //Assign all that banners.

      bannersList.assignAll(banners);

      //! filter the featured categories
    } catch (e) {
      TLoaders.errorSnackbar(title: 'OOPSS', message: e.toString());
    } finally {
      //! remove the loader
      isLoading.value = false;
    }
  }
}
