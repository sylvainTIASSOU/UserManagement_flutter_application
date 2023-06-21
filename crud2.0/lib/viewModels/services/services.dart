import 'package:crud/models/Users.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'services.g.dart';
@RestApi(baseUrl: 'http://192.168.43.173:3000/')
abstract class ApiService
{
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  @POST("/user")
  Future<UsersModel> create(@Body() UsersModel users);

  @GET('/user') //path a changer
  Future<List<UsersModel>> getAll(); //getPost a remplacr par la fonction qui corespond

  //api delete
  @DELETE("/user/{id}")
  Future<UsersModel> delete(@Path("id") String id);

  //api to update
  @PUT("/user/{id}")
  Future<UsersModel> update(@Path('id') String id, UsersModel users);
}