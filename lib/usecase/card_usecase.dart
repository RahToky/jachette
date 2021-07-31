import 'package:bluekango/model/cards_entity.dart';
import 'package:bluekango/usecase/base_usecase.dart';

class CardUseCase extends BaseUseCase{

  Future<List<Card>> getCards() async{
    return await findAll(Card(), Card.tableName);
  }
}