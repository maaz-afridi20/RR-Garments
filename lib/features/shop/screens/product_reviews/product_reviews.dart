
import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppbar(
        title: Text('Reviews & Ratings'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
                'Rating and reviews are available for all users and users with the following permissions and permissions for all users and users with the following permissions and permissions for'),
            const SizedBox(height: TSizes.spaceBwItems),

            //---------------------------Over all rating -------------------------------------

            const TOverallProductRating(),
            //---------------------------Rating Stars -------------------------------------

            const TRatingBarIndicator(ratings: 3.5),
            //---------------------------Number of reviews -------------------------------------
            Text('12,243', style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: TSizes.spaceBwSections),
            //---------------------------users reviews List -------------------------------------
            const UserReviewCard(),
            const UserReviewCard(),
            const UserReviewCard(),
          ]),
        ),
      ),
    );
  }
}
