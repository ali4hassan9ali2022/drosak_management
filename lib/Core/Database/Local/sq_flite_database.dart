import 'package:drosak_management/Core/Database/Local/crud.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqFliteDatabase extends Crud {
  // static const _user = "users";
  // static const _userId = "user_id";
  // static const _username = "username";
  // static const _product = "product";
  // static const _productId = "product_id";
  // static const _productName = "product_name";
  // static const _productPrice = "product_price";
  // static const _productCount = "product_count";
  // static const _sales = "sales";
  // static const _salesId = "sales_id";
  // static const _salesProductId = "sales_product_id";
  // static const _salesUserId = "sales_user_id";
  Database? _database;
  Future<Database> _initDatabse() async {
    String databasePath = await getDatabasesPath();
    String managementDatabaseName = "management.db";

    String dbPath = join(databasePath, managementDatabaseName);
    int versionDatabase = 1;
    _database ??= await openDatabase(
      dbPath,
      version: versionDatabase,
      onCreate: _onCreate,
    );
    return _database!;
  }

  _onCreate(Database db, int version) async {
    // await db.execute(
    //   "CREATE TABLE $_user "
    //   "($_userId INTEGER PRIMARY KEY AUTOINCREMENT,"
    //   "$_username  TEXT)",
    // );
    // await db.execute(
    //   "CREATE TABLE  $_product "
    //   "($_productId INTEGER PRIMARY KEY AUTOINCREMENT,"
    //   "$_productName  TEXT"
    //   ",$_productPrice  REAL,"
    //   " $_productCount INTEGER)",
    // );
    // await db.execute(
    //   "CREATE TABLE  $_sales "
    //   "($_salesId INTEGER PRIMARY KEY AUTOINCREMENT,"
    //   "$_salesProductId  INTEGER,"
    //   "$_salesUserId  INTEGER)",
    // );
    // await db.execute(
    //   "CREATE TABLE  $_sales "
    //   "($_salesId INTEGER PRIMARY KEY,"
    //   "$__salesProductName  TEXT"
    //   ",$_salesUsername  TEXT",
    // );
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
}
