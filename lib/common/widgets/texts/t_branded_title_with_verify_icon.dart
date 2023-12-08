import 'package:coding_with_t_ecommerce2/common/widgets/texts/t_brand_title_text.dart';
import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class TBrandTitleWithVerifiedIcon extends StatelessWidget {
  const TBrandTitleWithVerifiedIcon({
    super.key,
    this.textColor,
    this.maxLines = 1,
    required this.title,
    this.iconColor = TColors.textPrimaryColor,
    this.textAlign = TextAlign.center,
    this.brandTextSizes = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSizes;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: TBrandTitleText(
            title: title,
            maxLines: maxLines,
            textAlign: textAlign,
            color: textColor,
            brandTextSizes: brandTextSizes,
          ),
        ),
        const SizedBox(width: TSizes.xs),
        const Icon(Iconsax.verify5,
            color: TColors.buttonPrimaryColor, size: TSizes.iconXs),
      ],
    );
  }
}
