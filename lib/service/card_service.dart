import 'package:bluekango/model/cards_entity.dart';
import 'package:bluekango/service/base_service.dart';

class CardService extends BaseService{

  Future<List<Card>> getCards() async{
    return await findAll(Card(), Card.tableName);
  }
}