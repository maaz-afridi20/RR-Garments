import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return TVerticalImageText(
            image: TImages.shoeIcon,
            title: 'Shoe Wonderful',
            onTap: () {},
          );
        },
      ),
    );
  }
}
