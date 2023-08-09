import 'package:hive_flutter/hive_flutter.dart';

enum MainBoxKeys {
  token,
  isLogin,
  userId,
}

mixin class MainBoxMixin {
  static late Box? mainBox;
  static const _boxName = 't2t!mainBox';

  static Future<void> initHive() async {
    // Initialize hive (persistent database)
    await Hive.initFlutter();
    mainBox = await Hive.openBox(_boxName);
  }

  Future<void> addData<T>(MainBoxKeys key, T value) async {
    await mainBox?.put(key.name, value);
  }

  Future<void> removeData(MainBoxKeys key) async {
    await mainBox?.delete(key.name);
  }

  T getData<T>(MainBoxKeys key) => mainBox?.get(key.name) as T;

  Future<void> logoutBox() async {
    /// Clear the box
    removeData(MainBoxKeys.isLogin);
    removeData(MainBoxKeys.token);
    removeData(MainBoxKeys.userId);
  }

  Future<void> closeBox({bool isUnitTest = false}) async {
    try {
      if (mainBox != null) {
        await mainBox?.close();
        await mainBox?.deleteFromDisk();
      }
    } catch (e) {
      if (!isUnitTest) {
        rethrow;
      }
    }
  }
}
