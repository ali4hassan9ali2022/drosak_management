import 'package:drosak_management/Core/Database/Local/crud.dart';
import 'package:drosak_management/Core/Helper/app_helper.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqFliteDatabase extends Crud {
  Database? _database;
  Future<Database> _initDatabse() async {
    String databasePath = await getDatabasesPath();
    String drosakDatabaseName = "drosak.db";

    String dbPath = join(databasePath, drosakDatabaseName);
    int versionDatabase = 2;
    _database ??= await openDatabase(
      dbPath,
      version: versionDatabase,
      onCreate: _onCreate,
      onUpgrade: (db, oldVersion, newVersion) async {
        await db.execute(
          "DROP TABLE IF EXISTS ${AppHelper.educationalStagesTableName}",
        );
        await db.execute(
          "CREATE TABLE ${AppHelper.educationalStagesTableName} "
          "(${AppHelper.educationalStagesId} INTEGER PRIMARY KEY AUTOINCREMENT,"
          "${AppHelper.educationalStagesName}  TEXT,"
          "${AppHelper.educationalStagesDes} TEXT, "
          "${AppHelper.educationalStagesCreateAt} TIMESTAMP DEFAULT CURRENT_TIMESTAMP,"
          "${AppHelper.educationalStagesImage} TEXT)",
        );
      },
      onOpen: (db) async {
        await db.execute("PRAGMA foreign_keys = on");
      },
    );
    return _database!;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE ${AppHelper.educationalStagesTableName} "
      "(${AppHelper.educationalStagesId} INTEGER PRIMARY KEY AUTOINCREMENT,"
      "${AppHelper.educationalStagesName}  TEXT,"
      "${AppHelper.educationalStagesDes} TEXT, "
      "${AppHelper.educationalStagesCreateAt} TIMESTAMP DEFAULT CURRENT_TIMESTAMP,"
      "${AppHelper.educationalStagesImage} TEXT)",
    );
  }

  //! Delete Data
  @override
  Future<bool> deleteData({
    required String tableName,
    required String? where,
  }) async {
    await _initDatabse();
    int delete = await _database!.delete(tableName, where: where);

    return delete > 0 ? true : false;
  }

  //! Get Data
  @override
  Future<List<Map<String, Object?>>> getData({
    required String tableName,
  }) async {
    await _initDatabse();
    List<Map<String, Object?>> data = await _database!.query(tableName);
    return data;
  }

  //! Insert Data
  @override
  Future<bool> inseretData({
    required String tableName,
    required Map<String, Object> values,
  }) async {
    await _initDatabse();
    int inseret = await _database!.insert(tableName, values);
    return inseret > 0 ? true : false;
  }

  //! Update Data
  @override
  Future<bool> ubdateData({
    required String tableName,
    required Map<String, Object> values,
    required String? where,
  }) async {
    await _initDatabse();
    int update = await _database!.update(tableName, values, where: where);
    return update > 0 ? true : false;
  }

  //! Search Data
  @override
  Future<List<Map<String, Object?>>> searchData({
    required String tableName,
    required String where,
    required List<Object?>? whereArgs,
  }) async {
    await _initDatabse();
    List<Map<String, Object?>> data = await _database!.query(
      tableName,
      where: where,
      whereArgs: whereArgs,
    );
    return data;
  }
}