import 'package:coding_with_t_ecommerce2/common/widgets/custom_shapes/circle_container.dart';
import 'package:coding_with_t_ecommerce2/common/widgets/custom_shapes/curved_edges_widget.dart';
import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgesWidget(
      child: Container(
        color: TColors.basicPprimaryColor,
        padding: EdgeInsets.zero,
        child: Stack(
          children: [
            Positioned(
                top: -150,
                right: -250,
                child: TCircleContainer(
                    backgroundColor: TColors.backgroundContainerLightColor
                        .withOpacity(0.1))),
            Positioned(
                top: -10,
                right: -280,
                child: TCircleContainer(
                    backgroundColor: TColors.backgroundContainerLightColor
                        .withOpacity(0.1))),
            child,
          ],
        ),
      ),
    );
  }
}
