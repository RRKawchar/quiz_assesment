import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class LocalStorageService{
  static final LocalStorageService instance=LocalStorageService._private();
  LocalStorageService._private();
  late Box _box;

  Future<void> initBox()async{
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    _box=await Hive.openBox('quizAppBox');
  }

  Future<void> saveData(String key, dynamic value) async {
    await _box.put(key, value);
  }

  T? getData<T>(String key) {
    return _box.get(key) as T?;
  }

  Future<void> deleteData(String key) async {
    await _box.delete(key);
  }

  Future<void> updateData(String key, dynamic value) async {
    await _box.put(key, value);
  }


  Future<void> clearAll() async {
    await _box.clear();
  }

}