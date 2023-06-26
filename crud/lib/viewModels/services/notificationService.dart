
import 'package:flutter/cupertino.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../../models/notification.dart';

part 'notificationService.g.dart';
@RestApi(baseUrl: 'http://192.168.43.173:3000/')
abstract class NotificationApiService
{
  factory NotificationApiService(Dio dio, {String baseUrl}) = _NotificationApiService;
  @POST("/notification")
  Future<Notifications> create(@Body() Notifications notification);

  @GET('/notification') //path a changer
  Future<List<Notifications>> getAll(); //getPost a remplacr par la fonction qui corespond

  // //api delete
  // @DELETE("/notification/{id}")
  // Future<Notifications> delete(@Path("id") String id);
  //
  // //api to update
  // @PUT("/notification/{id}")
  // Future<Notifications> update(@Path('id') String id, Notifications notification);
}