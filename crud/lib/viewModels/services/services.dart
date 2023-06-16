import 'package:crud/models/Users.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'services.g.dart';
@RestApi(baseUrl: 'http://127.0.0.1/')
abstract class ApiService
{
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  @POST("path")
  Future<UsersModel> create(@Body() UsersModel users);

  @GET('users') //path a changer
  Future<List<UsersModel>> getAll(); //getPost a remplacr par la fonction qui corespond

  //api delete
  @DELETE("path/{id}")
  Future<UsersModel> delete(@Path("id") String id);

  //api to update
  @PUT("path/{id}")
  Future<UsersModel> update(@Path('id') String id, UsersModel users);
}