import 'package:crud/models/Users.dart';
import 'package:crud/models/notification.dart';
import 'package:crud/viewModels/services/services.dart';
import 'package:dio/dio.dart';

import 'notificationService.dart';
class ServiceMethodes
{
 static final  dio = Dio(BaseOptions(contentType: 'application/json'));

 //methode to get all notification
 //methode to gett all data
 static Future<List<Notifications>> getNotifications() async
 {
   final notificationApiService = NotificationApiService(dio);
   try
   {
     return await notificationApiService.getAll();
   }
   catch(e)
   {
     return [];//'votre erreur est la suivante:  $e';
   }
 }

  //methode de create
  static create(UsersModel model) async
  {
    final apiService = ApiService(dio);
    try {
      return await apiService.create(model);
    }
    catch (e) {
      return print(e);
    }
  }

  //function to get user Id
 static Future<Object> getId(String firstName) async
 {
   final apiService = ApiService(dio);
   try
   {
     return await apiService.getId(firstName);
   }
   catch(e)
   {
     return [];//'votre erreur est la suivante:  $e';
   }
 }

  //methode to gett all data
 static Future<List<UsersModel>> getAll() async
  {
    final apiService = ApiService(dio);
    try
    {
      return await apiService.getAll();
    }
    catch(e)
    {
      return [];//'votre erreur est la suivante:  $e';
    }
  }

  //methode to update
 static update(int id, UsersModel usersModel) async
  {
    final apiService = ApiService(dio);
    try
    {
      return await apiService.update(id, usersModel);
    }
    catch(e)
    {
      return print('votre erreur est la suivante:  $e');
    }
  }

  //methode to delete
 static delete(String id) async
  {
    final apiService = ApiService(dio);
    try
    {
      return await apiService.delete(id);
    }
    catch(e)
    {
      return print(e);
    }
  }
}