import 'package:hive_flutter/hive_flutter.dart';
import 'package:koombea_pictures/features/posts/domain/entities/user.dart';
import 'package:logger/logger.dart';

abstract class AbstractLocalDataSource {
  Future<List<User>> getAll();
  Future<void> saveAll(List<User> users);
  Future<void> deleteAll();
}

class LocalDataSource extends AbstractLocalDataSource {
  @override
  Future<List<User>> getAll() async {
    final box = await Hive.openBox<User>('userBox');
    return box.values.toList();
  }

  @override
  Future<void> saveAll(List<User> users) async {
    var box = await Hive.openBox<User>('userBox');
    for (var user in users) {
      await box.put(user.uid, user);
    }
    await box.close();
  }

  @override
  Future<void> deleteAll() async {
    Logger().d('deleteAll');
    var box = await Hive.openBox<User>('userBox');
    await box.clear();
    await box.close();
  }
}
