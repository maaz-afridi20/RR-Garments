import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip({
    super.key,
    required this.titleText,
    required this.isSelected,
    this.onSelected,
  });

  final String titleText;
  final bool isSelected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = THelperFunction.getColor(titleText) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(titleText),
        selected: isSelected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: isSelected ? TColors.white : null),
        avatar: isColor
            ? TCircleContainer(
                width: 50,
                height: 50,
                backgroundColor: THelperFunction.getColor(titleText)!)
            : null,
        labelPadding: isColor ? EdgeInsets.zero : null,
        padding: isColor ? EdgeInsets.zero : null,
        shape: isColor ? const CircleBorder() : null,
        backgroundColor: isColor ? THelperFunction.getColor(titleText)! : null,
      ),
    );
  }
}
