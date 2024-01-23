import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class TFavouriteIcon extends StatelessWidget {
  const TFavouriteIcon({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    final controller = Get.put(FavoritesContoller());
    return Obx(() {
      return TCirculorIcon(
        backgroundColor: dark ? TColors.softGrey : TColors.white,
        icon:
            controller.isFavourite(productId) ? Iconsax.heart5 : Iconsax.heart,
        color: controller.isFavourite(productId) ? TColors.errorColor : null,
        onPressed: () => controller.toggleFavouriteProduct(productId),
      );
    });
  }
}
