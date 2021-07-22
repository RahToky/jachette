import 'package:bluekango/model/addresses_entity.dart';

class AddressService{

  Future<List<Address>> getAddresses(){
    return Future.value([
      Address(id: 1,street: '8 rue des Pamlmiers',address:'76890 Là bas'),
      Address(id: 2,street: '143 allée des Mimosas',address:'83000 Hyères'),
      Address(id: 3,street: '78 rue des chemins',address:'14000 Caen'),
      Address(id: 4,street: '1065 avenue du rêve',address:'69000 Lyon'),
    ]);
  }

}