import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class TBrandShowCase extends StatelessWidget {
  const TBrandShowCase({
    super.key,
    required this.dark,
    required this.images,
  });

  final bool dark;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      backgroundColor: TColors.transparent,
      borderColor: TColors.darkGrey,
      padding: const EdgeInsets.all(TSizes.md),
      margin: const EdgeInsets.only(bottom: TSizes.spaceBwItems),
      child: Column(
        children: [
          //! --------------Brand with product count--------------

          TBrandCard(showBorder: false, brand: BrandModel.empty()),
          const SizedBox(height: TSizes.spaceBwItems),
          //! --------------Brand top 3 product images--------------
          Row(
            children: images
                .map((e) => brandTopProductImageWidget(e, context))
                .toList(),
          ),
        ],
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
      child: Image(fit: BoxFit.contain, image: AssetImage(image)),
    ),
  );
}
