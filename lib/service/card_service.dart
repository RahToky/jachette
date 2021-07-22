import 'package:bluekango/model/cards_entity.dart';

class CardService{
  Future<List<Card>> getCards(){
    return Future.value([
      Card(id:1,type:'Mastercard',number:'1234567890'),
      Card(id:1,type:'VISA',number:'0987654321'),
      Card(id:1,type:'American Express',number:'56473829102'),
    ]);
  }
}