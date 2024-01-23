import '../../../utils/constants/imported_statement.dart';

class TListTileShimmer extends StatelessWidget {
  const TListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            TShimmerEffect(width: 50, height: 50, radius: 50),
            SizedBox(height: TSizes.spaceBwItems),
            Column(
              children: [
                TShimmerEffect(width: 100, height: 15),
                SizedBox(height: TSizes.spaceBwItems / 2),
                TShimmerEffect(width: 80, height: 12),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
