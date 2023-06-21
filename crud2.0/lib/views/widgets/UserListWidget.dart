import 'package:crud/viewModels/databaseManager/databaseManager.dart';
import 'package:crud/viewModels/globalFonctions.dart';
import 'package:crud/viewModels/providers/providers.dart';
import 'package:crud/viewModels/userListViewModel.dart';
import 'package:crud/views/pages/UserProfil.dart';
import 'package:crud/views/widgets/Widgets.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../../models/Users.dart';
import '../../viewModels/services/serviceMethodes.dart';
import '../../viewModels/services/services.dart';

class UserListwidget extends ConsumerStatefulWidget
{
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _UserListState();
  }
}

class _UserListState extends ConsumerState<UserListwidget>
{

@override
  void initState() {
    super.initState();
    //ref.read(Providers.usersListProvider);
  }
  @override
  
  FutureBuilder<List<UsersModel>> build(BuildContext context) {
    final apiService = ServiceMethodes.getAll();
    print('etat de la connection vaut: ${GlobalFonction.connectionChecked}');
  if(GlobalFonction.connectionChecked == 1)
    {
      print('connection  done');
      return showList(context, apiService);
    }
  else
    {
      print('connection not done');
      return showList(context, DatabaseManager.getAllUser());
    }

  }

  //fonction to show list
  showList(BuildContext context, Future<List<UsersModel>> future)
  {
    return FutureBuilder<List<UsersModel>>(
        future:  future,
        builder: (context,  snapshot )
        {
          if(snapshot.connectionState == ConnectionState.waiting)
          {
            return CircularProgressIndicator();
          }
          else if(snapshot.hasError)
          {
            return Center(child: Text(snapshot.error.toString()),);
          }
          else if(snapshot.connectionState == ConnectionState.done)
          {
              List<UsersModel>? model = snapshot.data;
              return ListView.builder(
                  itemCount: model?.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 10, top: 15),
                      child: GestureDetector(
                        onTap: () =>
                            UserListViewModel.moveToUserProfil(
                                context, model!, index),
                        child: Row(
                          children: [

                            //profile
                            Widgets.circle(Image.asset('assets/profil.png',
                                width: 18,
                                height: 17)),
                            SizedBox(width: 20,),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${model?[index].firstName} ${model?[index]
                                    .lastName}'),
                                SizedBox(height: 5.0),
                                Text('${model?[index].age }  ans'),
                              ],
                            ),

                          ],
                        ),
                      ),
                    );
                  }
              );
          }
          return CircularProgressIndicator();
        }
    );
  }
}