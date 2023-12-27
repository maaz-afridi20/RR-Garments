import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}
