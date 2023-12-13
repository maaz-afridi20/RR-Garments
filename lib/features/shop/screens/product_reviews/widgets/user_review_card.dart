import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(TImages.userImage),
                ),
                const SizedBox(
                  width: TSizes.spaceBwItems,
                ),
                Text('John Doe', style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        // -------------------------Reviews---------------------------------------
        const SizedBox(
          height: TSizes.spaceBwItems,
        ),
        Row(
          children: [
            const TRatingBarIndicator(ratings: 4),
            const SizedBox(
              width: TSizes.spaceBwItems,
            ),
            Text('01 Nov, 2023', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBwItems,
        ),
        const ReadMoreText(
          'this is read more text and we can change the content of the page and the content of the page will be automatically updated to reflect the changes',
          trimLines: 1,
          trimMode: TrimMode.Line,
          trimExpandedText: ' show less',
          trimCollapsedText: ' show more',
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.basicPprimaryColor),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.basicPprimaryColor),
        ),
        const SizedBox(
          height: TSizes.spaceBwItems,
        ),
        // ------------------------------company reviews----------------------------------

        TRoundedContainer(
          backgroundColor: dark ? TColors.darkGrey : TColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('T Store ',
                        style: Theme.of(context).textTheme.titleMedium),
                    Text('30 Dec, 2024',
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(
                  height: TSizes.spaceBwItems,
                ),
                const ReadMoreText(
                  'this is read more text and we can change the content of the page and the content of the page will be automatically updated to reflect the changes',
                  trimLines: 1,
                  trimMode: TrimMode.Line,
                  trimExpandedText: ' show less',
                  trimCollapsedText: ' show more',
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColors.basicPprimaryColor),
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColors.basicPprimaryColor),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBwSections)
      ],
    );
  }
}
