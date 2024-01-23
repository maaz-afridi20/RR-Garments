import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class TBrandShowCase extends StatelessWidget {
  const TBrandShowCase(
      {super.key,
      required this.dark,
      required this.images,
      required this.brand});

  final bool dark;
  final List<String> images;
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProductScreen(brand: brand)),
      child: TRoundedContainer(
        showBorder: true,
        backgroundColor: TColors.transparent,
        borderColor: TColors.darkGrey,
        padding: const EdgeInsets.all(TSizes.md),
        margin: const EdgeInsets.only(bottom: TSizes.spaceBwItems),
        child: Column(
          children: [
            //! --------------Brand with product count--------------

            TBrandCard(showBorder: false, brand: brand),
            const SizedBox(height: TSizes.spaceBwItems),
            //! --------------Brand top 3 product images--------------
            Row(
              children: images
                  .map((e) => brandTopProductImageWidget(e, context))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

Widget brandTopProductImageWidget(String image, context) {
  return Expanded(
    child: TRoundedContainer(
      height: 100,
      backgroundColor: THelperFunction.isDarkMode(context)
          ? TColors.darkGrey
          : TColors.lightGrey,
      margin: const EdgeInsets.only(right: TSizes.sm),
      padding: const EdgeInsets.all(TSizes.md),
      child: CachedNetworkImage(
        fit: BoxFit.contain,
        imageUrl: image,
        progressIndicatorBuilder: (context, url, progress) =>
            const TShimmerEffect(width: 100, height: 100),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    ),
  );
}
