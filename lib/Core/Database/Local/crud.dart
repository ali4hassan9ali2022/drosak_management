abstract class Crud {
  Future<bool> inseretData({required String tableName, required Map<String, Object> values});
  Future<bool> ubdateData({required String tableName, required Map<String, Object> values, required String? where});
  Future<bool> deleteData({required String tableName, required String? where});
  Future<List<Map<String, Object?>>> getData({required String tableName});
}