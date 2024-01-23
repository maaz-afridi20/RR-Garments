import 'dart:convert';

import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class FavoritesContoller extends GetxController {
  static FavoritesContoller get instance => Get.find();

//variables

  final favourites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavorites();
  }

  void initFavorites() {
    final json = TLocalStorage.instance().readData('favourites');

    if (json != null) {
      final storedFavourites = jsonDecode(json) as Map<String, dynamic>;
      favourites.assignAll(
        storedFavourites.map(
          (key, value) => MapEntry(key, value as bool),
        ),
      );
    }
  }

  //! check the product that is it in favourites or not.
  bool isFavourite(String productId) {
    return favourites[productId] ?? false;
  }

  //! add or remove the product to the favorites

  void toggleFavouriteProduct(String productId) {
    if (!favourites.containsKey(productId)) {
      favourites[productId] = true;
      saveFavouritesToStorage();
      TLoaders.customToast(message: 'Product has been added to favorites');
    } else {
      TLocalStorage.instance().removeData(productId);
      favourites.remove(productId);
      saveFavouritesToStorage();
      favourites.refresh();
      TLoaders.customToast(message: 'Product has been remove to favorites');
    }
  }

  void saveFavouritesToStorage() {
    final encodedFavourites = json.encode(favourites);
    TLocalStorage.instance().saveData('favourites', encodedFavourites);
  }

  Future<List<ProductModel>> favoritesProducts() async {
    return await ProductRepository.instance
        .getFavouriteProducts(favourites.keys.toList());
  }
}
