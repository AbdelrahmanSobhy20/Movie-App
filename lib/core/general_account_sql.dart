import 'package:movie_app_indvidual/core/sql_model_register.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const String tableRegister = 'RegisterTable';
const String columnId = '_id';
const String columnUserName = 'username';
const String columnEmail = 'email';
const String columnPassword = 'password';

class AccountProvider {
  late Database db;
  static final AccountProvider instance = AccountProvider._internal();
  factory AccountProvider() {
    return instance;
  }
  AccountProvider._internal();

  Future open() async {
    db = await openDatabase(join(await getDatabasesPath(), 'firstDataOfAccount.db'), version: 1,
        onCreate: (Database db, int version) async {
          await db.execute('''
create table $tableRegister ( 
  $columnId integer primary key autoincrement, 
  $columnUserName text not null,
  $columnEmail text not null,
  $columnPassword text not null)
''');
        });
  }

  Future<AccountModel> insert(AccountModel register) async {
    register.id = await db.insert(tableRegister, register.toMap());
    return register;
  }

  Future<List<AccountModel>> getAllUsers() async {
    List<Map<String , dynamic >> usersMaps = await db.query(tableRegister);
    if (usersMaps.isEmpty) {
      return [];
    }else {
      List<AccountModel> accounts = [];
      for ( var element in usersMaps){
        accounts.add(AccountModel.fromMap(element));
      }
      return accounts;
    }
  }

  Future<int> delete(int id) async {
    return await db.delete(tableRegister, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> update(AccountModel register) async {
    return await db.update(tableRegister, register.toMap(),
        where: '$columnId = ?', whereArgs: [register.id]);
  }

  Future close() async => db.close();
}