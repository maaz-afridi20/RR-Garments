import 'package:get_storage/get_storage.dart';

class TLocalStorage {
  TLocalStorage._internal();
  final _storage = GetStorage();

  static final TLocalStorage _instance = TLocalStorage._internal();

  factory TLocalStorage() {
    return _instance;
  }

  // for saving the data
  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  // for reading data
  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  // remove the data from the storage
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

// clear all the data in the storage
  Future<void> clearAll() async {
    await _storage.erase();
  }
}
