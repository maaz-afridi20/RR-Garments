import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class TCloudHelperFunctions {
  // this is the helper function that will check single data base records
  //
  // return a widget based on the state of the snapshot.
  // if the data is loading it will return the progress indicator
  // if no data found it will return the error message
  // if error occurs it will return the error message
  // otherwise it will return null;

//! this T mean that it can get any type of value or list etc.
// this T can be any thing.
  static Widget? checkSingleRecordState<T>(AsyncSnapshot<T> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const CircularProgressIndicator();
    }

    if (!snapshot.hasData || snapshot.data == null) {
      return const Center(
        child: Text('No Data Found'),
      );
    }

    if (snapshot.hasError) {
      return const Center(child: Text('Something went wrong'));
    }
    return null;
  }

// helper function to check the state of the multiple objects from firebase
//
// returns a widget basd on state of snapshot.
  // if the data is loading it will return the progress indicator
  // if no data found it will return the error message
  // if error occurs it will return the error message
  // otherwise it will return null;

  static Widget? checkMultipleRecordState<T>({
    required AsyncSnapshot<List<T>> snapshot,
    Widget? loader,
    Widget? error,
    Widget? nothingFound,
  }) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      if (loader != null) return loader;
      return const CircularProgressIndicator();
    }
    if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
      if (nothingFound != null) return nothingFound;
      return const Center(child: Text('No Data Found'));
    }
    if (snapshot.hasError) {
      if (error != null) return error;
      return const Center(child: Text('Something went wrong'));
    }
    return null;
  }

  static Future<String> getUrlFromFilePathAndName(String path) async {
    try {
      if (path.isEmpty) return '';
      final ref = FirebaseStorage.instance.ref().child(path);
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw e.message!;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw 'something went wrong $e';
    }
  }
}
