import '../../../../../utils/constants/imported_statement.dart';

class TFooter extends StatelessWidget {
  const TFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const TSocialButton(),
        const SizedBox(width: TSizes.spaceBwItems),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: TColors.softGrey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: TSizes.iconMd,
              height: TSizes.iconMd,
              image: AssetImage(TImages.facebooklogo),
            ),
          ),
        )
      ],
    );
  }
}
