import 'package:get_storage/get_storage.dart';

// everything store in the local storage in json format
// so inorder to save data to lcoal storage you have to
// convert the data to json then you can use the local storage

class TLocalStorage {
  //
  late final GetStorage _storage;
  //
  //! singleton instance
  static TLocalStorage? _instance;

  //
  TLocalStorage._internal();

//! this will create new instance everytime user is logged in
  factory TLocalStorage.instance() {
    _instance ?? TLocalStorage._internal();
    return _instance!;
  }

// this init is only name it can be anything
  static Future<void> init(String bucketName) async {
    await GetStorage.init(bucketName);
    _instance = TLocalStorage._internal();
    _instance!._storage = GetStorage(bucketName);
  }

  //! this is getx local storage
  // agar hm iss ko aisay use karein tu humein bar bar modify krna parega tu hmm
  // iss ko dynamic banatay hain k har user k liye save hota rasay jo b user
  // logged in ho.
  // final _storage = GetStorage();
  //
  // static final TLocalStorage _instance = TLocalStorage._internal();

  //! for saving the data
  // this T Mean that the data can be generic mean anything.
  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  //! for reading data
  // data can be read through the key.
  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  //! remove the data from the storage
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

// clear all the data in the storage
  Future<void> clearAll() async {
    await _storage.erase();
  }
}

// localStorage localstorge = LocalStorage();

// saveData
// localStorage.saveData('userName':'john');
