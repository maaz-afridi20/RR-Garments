import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class TBoxesShimmer extends StatelessWidget {
  const TBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: TShimmerEffect(width: 150, height: 110)),
            SizedBox(height: TSizes.spaceBwItems),
            Expanded(child: TShimmerEffect(width: 150, height: 110)),
            SizedBox(height: TSizes.spaceBwItems),
            Expanded(child: TShimmerEffect(width: 150, height: 110)),
          ],
        ),
      ],
    );
  }
}
