import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(() {
      if (controller.isLoading.value) {
        return const TShimmerEffect(width: double.infinity, height: 190);
      }

      if (controller.bannersList.isEmpty) {
        return const Center(child: Text('No Data Found!'));
      } else {
        return Column(
          children: [
            CarouselSlider(
              items: controller.bannersList
                  .map((banner) => TRoundedImage(
                        imgUrl: banner.imageUrl,
                        isNetworkImage: true,
                        onPressed: () => Get.toNamed(banner.targetScreen),
                      ))
                  .toList(),
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
                  for (int i = 0; i < controller.bannersList.length; i++)
                    TCircleContainer(
                      width:
                          controller.carouselCurrentIndex.value == i ? 40 : 15,
                      height: 5,
                      backgroundColor:
                          controller.carouselCurrentIndex.value == i
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
    });
  }
}
