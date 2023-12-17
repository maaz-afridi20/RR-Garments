import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

void main() async {
  final WidgetsBinding widgetBinding =
      WidgetsFlutterBinding.ensureInitialized();
//! ----------------------initialize the local storage(Getx Local storage)-----------------

  await GetStorage.init();

//! ----------------------it will wait until the items load-----------------
  FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);

//! ----------------------initialize the firebase-----------------
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );
  runApp(const MyApp());
}
