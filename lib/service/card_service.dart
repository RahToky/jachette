import 'package:bluekango/model/cards_entity.dart';
import 'package:bluekango/service/base_service.dart';

class CardService extends BaseService{

  Future<List<Card>> getCards() async{
    List<Map<String,dynamic>> mapList = await databaseHelper.findAll(Card.tableName);
    return List.generate(mapList.length, (index){
      return Card.fromMap(mapList[index]);
    });
  }
}