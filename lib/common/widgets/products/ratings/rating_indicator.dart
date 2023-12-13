import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TRatingBarIndicator extends StatelessWidget {
  const TRatingBarIndicator({super.key, required this.ratings});

  final double ratings;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: ratings,
      itemSize: 20,
      unratedColor: TColors.grey,
      itemBuilder: (_, __) =>
          const Icon(Iconsax.star1, color: TColors.basicPprimaryColor),
    );
  }
}
