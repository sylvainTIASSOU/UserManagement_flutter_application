import 'package:crud/models/Users.dart';
import 'package:crud/viewModels/services/services.dart';
import 'package:dio/dio.dart';
class ServiceMethodes
{
 static final  dio = Dio(BaseOptions(contentType: 'application/json'));

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
 static update(String id, UsersModel usersModel) async
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