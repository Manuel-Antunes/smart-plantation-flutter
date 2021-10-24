import 'package:smart_plantation/common/user/user.dart';
import 'package:smart_plantation/data/connection.dart';

class UserDao {
  Future<User> getUser() async {
    var db = await Connection.getConnection();
    final result = await db.rawQuery("SELECT * FROM user");
    return User.fromJson(result[0]);
  }
}
