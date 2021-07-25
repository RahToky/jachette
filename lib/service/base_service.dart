import 'package:bluekango/dao/db_helper.dart';
import 'package:bluekango/model/listable_entity.dart';

class BaseService<T extends ListableEntity>{

  DatabaseHelper databaseHelper =DatabaseHelper.instance;

  List<T> findAll(ListableEntity entity){
    entity.getTitle() as T;
  }

}