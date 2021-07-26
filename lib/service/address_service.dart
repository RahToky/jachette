import 'package:bluekango/model/addresses_entity.dart';
import 'package:bluekango/service/base_service.dart';

class AddressService extends BaseService{

  Future<List<Address>> getAddresses(){
    return findAll(Address(), Address.tableName);
  }

}