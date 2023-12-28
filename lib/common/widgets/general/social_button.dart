import '../../../utils/constants/imported_statement.dart';

class TSocialButton extends StatelessWidget {
  const TSocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: TColors.softGrey),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        onPressed: () => controller.googleSignIn(),
        icon: const Image(
          width: TSizes.iconMd,
          height: TSizes.iconMd,
          image: AssetImage(TImages.googlelogo),
        ),
      ),
    );
  }
}
