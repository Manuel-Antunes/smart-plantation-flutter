import 'dart:async';

import 'package:smart_plantation/common/user/user.dart';
import 'package:smart_plantation/data/connection.dart';

class UserDao {
  Future<User> getUser() async {
    var db = await Connection.getConnection();
    final result = await db.rawQuery("SELECT * FROM user");
    return User.fromJson(result[0]);
  }

  FutureOr<void> storeUser(User user) async {
    var db = await Connection.getConnection();
    try {
      await db.rawQuery(
          "INSERT INTO user  (id, name, email, photoUrl) VALUES (?, ?, ?, ?)",
          [user.id, user.name, user.email, user.photoUrl]);
    } catch (error) {
      throw Exception('error while creating user');
    }
  }
}
