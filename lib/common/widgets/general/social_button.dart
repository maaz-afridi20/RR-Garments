import '../../../utils/constants/imported_statement.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: TColors.softGrey),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        onPressed: () {},
        icon: const Image(
          width: TSizes.iconMd,
          height: TSizes.iconMd,
          image: AssetImage(TImages.googlelogo),
        ),
      ),
    );
  }
}
