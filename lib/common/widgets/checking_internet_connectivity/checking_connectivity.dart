import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();

  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  // this will innitialize the network manager and stream and wil check the connection
  // status continuously

  @override
  void onInit() {
    super.onInit();

    _connectivitySubscription = _connectivity.onConnectivityChanged
        .listen((event) => _updateConnectionStatus);
  }

  // this will update the connectivity status
  // and show the revelant animation

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus.value = result;
    if (_connectionStatus.value == ConnectivityResult.none) {
      TLoaders.warningSnackbar(title: 'No Internet Connection');
    }
  }

  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      if (result == ConnectivityResult.none) {
        return false;
      } else {
        return false;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }

  // dispose or close the active stream connection

  @override
  void onClose() {
    super.onClose();

    _connectivitySubscription.cancel();
  }
}
