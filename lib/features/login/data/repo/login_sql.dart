
import 'package:movie_app_indvidual/features/login/data/repo/sql_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const String tableLogin = 'LoginTable';
const String columnId = '_id';
const String columnUserName = 'username';
const String columnPassword = 'password';

class LoginProvider {
  late Database db;
  static final LoginProvider instance = LoginProvider._internal();
  factory LoginProvider() {
    return instance;
  }
  LoginProvider._internal();

  Future open() async {
    db = await openDatabase(join(await getDatabasesPath(), 'loginData.db'), version: 1,
        onCreate: (Database db, int version) async {
          await db.execute('''
create table $tableLogin ( 
  $columnId integer primary key autoincrement, 
  $columnUserName text not null,
  $columnPassword text not null)
''');
        });
  }

  Future<LoginModel> insert(LoginModel login) async {
    login.id = await db.insert(tableLogin, login.toMap());
    return login;
  }

  Future<List<LoginModel>> getAllUsers({required String userName, required String password}) async {
    List<Map<String , dynamic >> usersMaps = await db.query(tableLogin);
    if (usersMaps.isEmpty) {
      return [];
    }else {
      List<LoginModel> users = [];
      for ( var element in usersMaps){
        users.add(LoginModel.fromMap(element));
      }
      return users;
    }
  }

  Future<int> delete(int id) async {
    return await db.delete(tableLogin, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> update(LoginModel login) async {
    return await db.update(tableLogin, login.toMap(),
        where: '$columnId = ?', whereArgs: [login.id]);
  }

  Future close() async => db.close();
}