import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class TCircleContainer extends StatelessWidget {
  const TCircleContainer({
    super.key,
    this.child,
    this.backgroundColor = TColors.textWhiteColor,
    this.height = 400,
    this.padding = 0,
    this.margin,
    this.radius = 400,
    this.width = 400,
  });

  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
