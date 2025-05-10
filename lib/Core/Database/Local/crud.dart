abstract class Crud {
  Future<bool> inseretData({
    required String tableName,
    required Map<String, Object> values,
  });
  Future<bool> ubdateData({
    required String tableName,
    required Map<String, Object> values,
    required String? where,
    required List<Object?>? whereArgs,
  });
  Future<bool> deleteData({
    required String tableName,
    required String? where,
    required List<Object?>? whereArgs,
  });
  Future<List<Map<String, Object?>>> getData({required String tableName});
  Future<List<Map<String, Object?>>> searchData({
    required String tableName,
    required String where,
    required List<Object?>? whereArgs,
  });
}
