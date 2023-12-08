import '../../../utils/constants/imported_statement.dart';

class TFormDivider extends StatelessWidget {
  const TFormDivider({super.key, required this.dividerText});

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
              color: dark ? TColors.lightGrey : TColors.darkGrey,
              thickness: 0.5,
              indent: 60,
              endIndent: 5),
        ),
        Text(dividerText.capitalized,
            style: Theme.of(context).textTheme.labelMedium),
        Flexible(
          child: Divider(
              color: dark ? TColors.lightGrey : TColors.darkGrey,
              thickness: 0.5,
              indent: 5,
              endIndent: 60),
        ),
      ],
    );
  }
}
