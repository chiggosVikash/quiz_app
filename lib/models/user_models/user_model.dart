import 'package:isar/isar.dart';
part 'user_model.g.dart';
@collection
class UserModel{
  final id = Isar.autoIncrement;
  final String email;
  final String name;
  final String imageUrl;
  UserModel({required this.email,required this.name,required this.imageUrl});

  Map<String,dynamic> toJson()=>{
    "name":name,
    "email":email,
    "imageUrl":imageUrl
  };
}