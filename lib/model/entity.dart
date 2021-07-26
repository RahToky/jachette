abstract class Entity<T>{
  Map<String,dynamic> toMap();
  T fromMap(Map<String,dynamic> map);
}