import 'package:json_annotation/json_annotation.dart';

part 'Users.g.dart';
@JsonSerializable()
class UsersModel
{
  var id;
  String firstName;
  String lastName;
  int age;

  UsersModel({required this.id, required this.firstName, required this.lastName, required this.age});

  //convert to Map
Map<String, dynamic> toMap()
{
  return{
   'id': id,
    'firstName': firstName,
    'lastName': lastName,
    'age': age
  };
}

//convert to string
String toString()
{
   return 'id: , firstName: $firstName, lastname: $lastName, age: $age';
}


factory UsersModel.fromJson(Map<String, dynamic> json) => _$UsersModelFromJson(json);

Map<String, dynamic> toJson() => _$UsersModelToJson(this);
}