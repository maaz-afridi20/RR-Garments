import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  // variables

  final myPageController = PageController();
  Rx<int> myCurrentPageIndex = 0.obs;

  // update current index when page scroll
  void updatePageIndicator(index) => myCurrentPageIndex.value = index;

  // jump to the specific index dot selected page
  void dotNavigationClick(index) {
    myCurrentPageIndex.value = index;
    myPageController.jumpTo(index);
  }

  void nextPage() {
    if (myCurrentPageIndex.value == 2) {
      final storage = GetStorage();

      storage.write('isFirstTime', false);
      Get.offAll(const LoginScreen());
    } else {
      int page = myCurrentPageIndex.value + 1;
      myPageController.jumpToPage(page);
    }
  }

  // update current index and jump to the last page

  void skipPage() {
    myCurrentPageIndex.value = 2;
    myPageController.jumpToPage(2);
  }
}
