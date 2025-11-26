import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'user.dart';

class SocialAppDatabase {
  static late Isar isar;

  //INITIALISE DATABASE
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([UserSchema], directory: dir.path);
  }

  final List<User> currentUser = [];

  //CREATE

  Future<void> createUser(String email, String password) async {
    final newUser = User()
      ..email = email
      ..password = password;

    await isar.writeTxn(() async {
      await isar.users.put(newUser);
    });
  }

  //READ
  // READ: Get all users
  Future<List<User>> getAllUsers() async {
    final users = await isar.users.where().findAll();
    return users;
  }

  // READ: Get user by email
  Future<User?> getUserByEmail(String email) async {
    final user = await isar.users.filter().emailEqualTo(email).findFirst();
    return user;
  }

  // UPDATE: Update user password by email
  Future<void> updatePassword(String email, String newPassword) async {
    final user = await getUserByEmail(email);
    if (user != null) {
      user.password = newPassword;
      await isar.writeTxn(() async {
        await isar.users.put(user);
      });
    }
  }

  // DELETE: Delete user by email
  Future<void> deleteUser(String email) async {
    final user = await getUserByEmail(email);
    if (user != null) {
      await isar.writeTxn(() async {
        await isar.users.delete(user.id);
      });
    }
  }
}
