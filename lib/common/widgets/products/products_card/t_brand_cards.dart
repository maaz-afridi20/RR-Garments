import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,
    required this.dark,
    this.showBorder = false,
    this.onTapp,
  });

  final bool dark;
  final bool showBorder;
  final void Function()? onTapp;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapp,
      child: TRoundedContainer(
        padding: const EdgeInsets.all(TSizes.sm),
        showBorder: showBorder,
        backgroundColor: TColors.transparent,
        child: Row(
          children: [
            // ----------------------------Icon------------------------------------
            Flexible(
              child: TCircularImage(
                dark: dark,
                isNetworkImage: false,
                image: TImages.clothIcon,
                backgroundColor: TColors.transparent,
                overlayColor: dark ? TColors.white : TColors.black,
              ),
            ),
            const SizedBox(width: TSizes.spaceBwItems / 2),
            // ----------------------------Text------------------------------------

            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TBrandTitleWithVerifiedIcon(
                    title: 'Nike',
                    brandTextSizes: TextSizes.large,
                  ),
                  Text(
                    '256 Products asdfasdfarsfafasaf',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
