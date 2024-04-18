import 'package:movie_app_indvidual/features/bookmark/data/models/sql_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const String tableMovies = 'tableMovies';
const String columnGeneralId = 'generalId';
const String columnTitle = 'title';
const String columnImage = 'image';
const String columnBigImage = 'big_image';
const String columnRating = 'rating';
const String columnYear = 'year';
const String columnId = 'id';

class SQLProvider {
  Database? db;
  static final SQLProvider instance = SQLProvider._internal();

  factory SQLProvider() {
    return instance;
  }

  SQLProvider._internal();

  Future open() async {
    db = await openDatabase(join(await getDatabasesPath(), '5555s.db'),
        version: 1, onCreate: (Database db, int version) async {
      await db.execute('''
create table $tableMovies ( 
  $columnGeneralId integer primary key autoincrement, 
  $columnTitle text not null,
  $columnImage text not null,
  $columnBigImage text not null,
  $columnId text not null,
  $columnYear integer not null,
  $columnRating text not null)
''');
    });
  }

  Future<List<SQLModel>> getAllMovies() async {
    List<Map<String, dynamic>> movieMap = await db!.query(tableMovies);
    if (movieMap.isEmpty) {
      return [];
    } else {
      List<SQLModel> allMovies = [];
      for (var element in movieMap) {
        allMovies.add(SQLModel.fromMap(element));
      }
      return allMovies;
    }
  }

  Future<SQLModel> insert(SQLModel sqlModel) async {
    sqlModel.generalId = await db!.insert(tableMovies, sqlModel.toMap());
    return sqlModel;
  }

  Future<int> delete(String? id) async {
    return await db!.delete(tableMovies,
        where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> update(SQLModel sqlModel) async {
    return await db!.update(tableMovies, sqlModel.toMap(),
        where: '$columnGeneralId = ?', whereArgs: [sqlModel.id]);
  }

  Future close() async => db!.close();
}
