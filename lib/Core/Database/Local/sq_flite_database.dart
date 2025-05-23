import 'package:drosak_management/Core/Database/Local/crud.dart';
import 'package:drosak_management/Core/Helper/app_helper.dart';
import 'package:drosak_management/Core/Helper/app_helper_groub.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqFliteDatabase extends Crud {
  Database? _database;
  Future<Database> _initDatabse() async {
    String databasePath = await getDatabasesPath();
    String drosakDatabaseName = "drosak.db";

    String dbPath = join(databasePath, drosakDatabaseName);
    int versionDatabase = 1;
    _database ??= await openDatabase(
      dbPath,
      version: versionDatabase,
      onCreate: _onCreate,
      onUpgrade: (db, oldVersion, newVersion) async {
        // await db.execute(
        //   "DROP TABLE IF EXISTS ${AppHelper.educationalStagesTableName}",
        // );
        await db.execute(
          "DROP TABLE IF EXISTS ${AppHelper.educationalStagesTableName}"
          "(${AppHelper.educationalStagesId} INTEGER PRIMARY KEY AUTOINCREMENT,"
          "${AppHelper.educationalStagesName}  TEXT,"
          "${AppHelper.educationalStagesDes} TEXT, "
          "${AppHelper.educationalStagesCreateAt} TIMESTAMP DEFAULT CURRENT_TIMESTAMP,"
          "${AppHelper.educationalStagesImage} TEXT)",
        );
        await db.execute(
          "DROP TABLE IF EXISTS ${AppHelperGroub.groudTableName} "
          "(${AppHelperGroub.groudId} INTEGER PRIMARY KEY AUTOINCREMENT,"
          "${AppHelperGroub.groudName}  TEXT,"
          "${AppHelperGroub.groudNote} TIMESTAMP DEFAULT CURRENT_TIMESTAMP,"
          "${AppHelperGroub.groudIdToEducational} INTEGER)",
        );
        await db.execute(
          "DROP TABLE IF EXISTS${AppHelperGroub.appointmentTableName} "
      "(${AppHelperGroub.appointmentId} INTEGER PRIMARY KEY AUTOINCREMENT,"
      "${AppHelperGroub.appointmentDay}  TEXT,"
      "${AppHelperGroub.appointmentHour} TEXT, "
      "${AppHelperGroub.appointmentTime} TIMESTAMP DEFAULT CURRENT_TIMESTAMP,"
      "${AppHelperGroub.appointmentIdToGroub} INTEGER)",
    );
      },
      onOpen: (db) async {
        await db.execute("PRAGMA foreign_keys = on");
      },
    );
    return _database!;
  }

  _onCreate(Database db, int version) async {
    //! Create Educational Stages Table
    await db.execute(
      "CREATE TABLE ${AppHelper.educationalStagesTableName} "
      "(${AppHelper.educationalStagesId} INTEGER PRIMARY KEY AUTOINCREMENT,"
      "${AppHelper.educationalStagesName}  TEXT,"
      "${AppHelper.educationalStagesDes} TEXT, "
      "${AppHelper.educationalStagesCreateAt} TIMESTAMP DEFAULT CURRENT_TIMESTAMP,"
      "${AppHelper.educationalStagesImage} TEXT)",
    );
    //! Create Groub Table
    await db.execute(
      "CREATE TABLE ${AppHelperGroub.groudTableName} "
      "(${AppHelperGroub.groudId} INTEGER PRIMARY KEY AUTOINCREMENT,"
      "${AppHelperGroub.groudName}  TEXT,"
      "${AppHelperGroub.groudNote} TIMESTAMP DEFAULT CURRENT_TIMESTAMP,"
      "${AppHelperGroub.groudIdToEducational} INTEGER)",
    );
    //! Create Appointment Table
    await db.execute(
      "CREATE TABLE ${AppHelperGroub.appointmentTableName} "
      "(${AppHelperGroub.appointmentId} INTEGER PRIMARY KEY AUTOINCREMENT,"
      "${AppHelperGroub.appointmentDay}  TEXT,"
      "${AppHelperGroub.appointmentHour} TEXT, "
      "${AppHelperGroub.appointmentTime} TIMESTAMP DEFAULT CURRENT_TIMESTAMP,"
      "${AppHelperGroub.appointmentIdToGroub} INTEGER)",
    );
  }

  //! Delete Data
  @override
  Future<bool> deleteData({
    required String tableName,
    required String? where,
    required List<Object?>? whereArgs,
  }) async {
    await _initDatabse();
    int delete = await _database!.delete(
      tableName,
      where: where,
      whereArgs: whereArgs,
    );

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
  Future<int> inseretReturnedId({
    required String tableName,
    required Map<String, Object> values,
  }) async {
    await _initDatabse();
    int inseret = await _database!.insert(tableName, values);
    return inseret;
  }

  //! Update Data
  @override
  Future<bool> ubdateData({
    required String tableName,
    required Map<String, Object> values,
    required String? where,
    required List<Object?>? whereArgs,
  }) async {
    await _initDatabse();
    int update = await _database!.update(
      tableName,
      values,
      where: where,
      whereArgs: whereArgs,
    );
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
