import 'package:carousel_slider/carousel_slider.dart';
import 'package:coding_with_t_ecommerce2/common/widgets/custom_shapes/circle_container.dart';
import 'package:coding_with_t_ecommerce2/features/shop/controllers/home_controller.dart';

import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          items:
              banners.map((imgUrll) => TRoundedImage(imgUrl: imgUrll)).toList(),
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, reason) =>
                controller.updatePageIndicator(index),
          ),
        ),
        const SizedBox(height: TSizes.spaceBwItems),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < banners.length; i++)
                TCircleContainer(
                  width: controller.carouselCurrentIndex.value == i ? 40 : 15,
                  height: 5,
                  backgroundColor: controller.carouselCurrentIndex.value == i
                      ? TColors.grey
                      : TColors.buttonDisabledColor,
                  margin: const EdgeInsets.only(left: 10),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
