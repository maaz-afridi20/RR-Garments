import 'package:coding_with_t_ecommerce2/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:coding_with_t_ecommerce2/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:coding_with_t_ecommerce2/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class ProductDetals extends StatelessWidget {
  const ProductDetals({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //! -----------------------product image slider-----------------------

            TProductImageSlider(dark: dark),

            //! -----------------------product details-----------------------

            const Padding(
              padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace,
                  left: TSizes.defaultSpace),
              child: Column(
                children: [
                  //! -----------------------Rating And Share-----------------------
                  TRatingAndShare(),

                  //! -----------------------Price,Title,stock and brand -----------------------

                  TProductMetaData(),

                  //! -----------------------Attributes-----------------------
                  //! -----------------------Checkout Button-----------------------
                  //! -----------------------Description-----------------------
                  //! -----------------------Reviews-----------------------
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
