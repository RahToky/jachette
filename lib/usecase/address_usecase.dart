import 'package:bluekango/model/addresses_entity.dart';
import 'package:bluekango/usecase/base_usecase.dart';

class AddressUseCase extends BaseUseCase{

  Future<List<Address>> getAddresses(){
    return findAll(Address(), Address.tableName);
  }

}