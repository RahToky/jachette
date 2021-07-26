import 'package:bluekango/dao/base_dao.dart';
import 'package:bluekango/model/entity.dart';

class BaseService{

  BaseDao baseDao = BaseDao();

  Future<List<T>> findAll<T extends Entity>(T entity, String tableName) async {
    return await baseDao.findAll(entity, tableName);
  }

}