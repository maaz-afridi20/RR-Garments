import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class TRatingAndShare extends StatelessWidget {
  const TRatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // rating

        Row(
          children: [
            const Icon(Iconsax.star5, color: Colors.amber, size: 24),
            const SizedBox(width: TSizes.spaceBwItems / 2),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: '5.0', style: Theme.of(context).textTheme.bodyLarge),
              const TextSpan(text: '(180)'),
            ])),
          ],
        ),
        //! -----------------------Share button -----------------------
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              size: TSizes.iconMd,
            )),
      ],
    );
  }
}
