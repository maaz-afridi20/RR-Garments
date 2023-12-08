import 'package:coding_with_t_ecommerce2/common/widgets/custom_shapes/curved_edges_widget.dart';
import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgesWidget(
      child: Container(
        color: dark ? TColors.darkGrey : TColors.lightGrey,
        child: Stack(
          children: [
            //! -----------------------main large image-----------------------
            const SizedBox(
                height: 400,
                child: Padding(
                  padding: EdgeInsets.all(TSizes.productImageRadius * 2),
                  child: Center(
                      child: Image(image: AssetImage(TImages.productImage1))),
                )),

            // -----------------------image slider-----------------------

            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => TRoundedImage(
                      width: 80,
                      backgroundColor: dark
                          ? TColors.backgroundDarkColor
                          : TColors.backgroundLightColor,
                      border: Border.all(color: TColors.textPrimaryColor),
                      padding: const EdgeInsets.all(TSizes.sm),
                      imgUrl: TImages.productImage2),
                  separatorBuilder: (_, __) => const SizedBox(
                    width: TSizes.spaceBwItems,
                  ),
                  itemCount: 6,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),

            //! -----------------------Appbar Icons-----------------------

            const TAppbar(
              showBackArrow: true,
              actions: [
                TCirculorIcon(icon: Iconsax.heart5, color: Colors.red),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
