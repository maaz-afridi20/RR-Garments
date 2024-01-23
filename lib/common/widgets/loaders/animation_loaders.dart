import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class TAnimationLoaderWidget extends StatelessWidget {
  const TAnimationLoaderWidget(
      {super.key,
      required this.text,
      required this.animation,
      this.showAction = false,
      this.actionText,
      this.onPressedAction});

  final String text;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onPressedAction;
  final String animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation,
              width: MediaQuery.of(context).size.width, height: 100),
          const SizedBox(height: TSizes.defaultSpace),
          Text(text,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center),
          const SizedBox(height: TSizes.defaultSpace),
          showAction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                      onPressed: onPressedAction,
                      style: OutlinedButton.styleFrom(
                          backgroundColor: TColors.black),
                      child: Text(
                        actionText!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .apply(color: TColors.light),
                      )),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
