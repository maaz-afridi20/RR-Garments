import 'package:coding_with_t_ecommerce2/features/shop/controllers/products/images_controller.dart';
import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  //! variables
  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation =
      ProductVariationModel.empty().obs;

  //!  select attributes and variation
  void onAttributeSelected(
      ProductModel product, attributeName, attributeValue) {
    // on attribute is selected we will first add the attribute to the new selected attribute
    final selectedAttributes =
        Map<String, dynamic>.from(this.selectedAttributes);
    selectedAttributes[attributeName] = attributeValue;

    final selectedVariation = product.productVariations!.firstWhere(
        (variation) => _isSameAttributeValues(
            variation.attributesValues, selectedAttributes),
        orElse: () => ProductVariationModel.empty());

    // show the selected variation
    if (selectedVariation.image.isNotEmpty) {
      ImagesController.instance.selectedProductImage.value =
          selectedVariation.image;
    }

    // assingn the selected variation
    this.selectedVariation.value = selectedVariation;
    getProductVariationStockStatus();
  }

  //! check if selected attributes matches any variations
  bool _isSameAttributeValues(Map<String, dynamic> variationAttributes,
      Map<String, dynamic> selectedAttributes) {
    //if the seelect attributes contains 3 attributes and current variation 2 then return
    if (variationAttributes.length != selectedAttributes.length) return false;

    // if any of the attributes is different then return . eg [green,large]X[green,small],

    for (final key in variationAttributes.keys) {
      // attribute[key] = value match could be green small etc.
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }
    return true;
  }

  //! check the attributes availability / stock in variation
  Set<String?> getAttributesAvailabilityInVariation(
      List<ProductVariationModel> variation, String attributeName) {
    // pass the vatiation to check which attributes are available in stock
    final availableVariationAttributesValues = variation
        .where((variation) =>
            // check empty or out of stock
            variation.attributesValues[attributeName] != null &&
            variation.attributesValues[attributeName]!.isNotEmpty &&
            variation.stock > 0)
        .map((variation) => variation.attributesValues[attributeName])
        .toSet();
    return availableVariationAttributesValues;
  }

//! check the product variation stock status
  void getProductVariationStockStatus() {
    variationStockStatus.value =
        selectedVariation.value.stock > 0 ? 'In Stock' : 'Out Of Stock';
  }

  //!

  String getVatiationPrice() {
    return (selectedVariation.value.salePrice > 0
            ? selectedVariation.value.salePrice
            : selectedVariation.value.price)
        .toString();
  }

//! reset the attributes when changes the product
  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }
}
