import 'package:bluekango/model/users_entity.dart';

class UserService{

  Future<List<User>> getUsers(){
    return Future.value([
      User(id:1,name: 'Antonio',photo:'photo_oval.png'),
      User(id:2,name: 'Sarah',photo:'photo_1.png'),
      User(id:3,name: 'Harry',photo:'photo_2.png'),
      User(id:4,name: 'Ben',photo:'photo_3.png'),
    ]);
  }

  Future<User> getUserById(int id) async{
    List<User> users = await getUsers();
    for(User u in users){
      if(u.id == id)
        return u;
    }
    return null;
  }

}