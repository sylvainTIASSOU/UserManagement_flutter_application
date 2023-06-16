import 'package:crud/viewModels/databaseManager/databaseManager.dart';
import 'package:crud/viewModels/providers/providers.dart';
import 'package:crud/viewModels/userListViewModel.dart';
import 'package:crud/views/pages/UserProfil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/Users.dart';

class UserListwidget extends ConsumerStatefulWidget
{
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _UserListState();
  }
}

class _UserListState extends ConsumerState<UserListwidget>
{
/*List<UsersModel> user= [
  UsersModel(firstName: 'sylvain', lastName: 'tiassou', age: 20, id: 1),
  UsersModel(firstName: 'jermie', lastName: 'Nodzo', age: 20, id: 1),
  UsersModel(firstName: 'nahomi', lastName: 'Pandi', age: 20, id: 1),
  UsersModel(firstName: 'sarah', lastName: 'Agnave', age: 20, id: 1),
  UsersModel(firstName: 'fernande', lastName: 'Bogra', age: 20, id: 1),
];*/
@override
  void initState() {
    super.initState();
    //ref.read(Providers.usersListProvider);
  }
  @override
  Widget build(BuildContext context) {



    return


    /*Consumer(
        builder: (context, watch, _)
            {
              final userList = ref.watch(Providers.usersListProvider);
              return userList.when(
                data: (model){
                  return ListView.builder(
                      itemCount: model.length,
                      itemBuilder: (context, index){
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                          child: GestureDetector(
                            onTap: () => UserListViewModel.moveToUserProfil(context, model, index),
                            child: Row(
                              children: [

                                //profile
                                Container(
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromARGB(200, 200, 200, 200),
                                  ),
                                  child: Icon(Icons.perm_identity, size: 40.0,),
                                ),

                                SizedBox(width: 20,),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${model?[index].firstName} ${model?[index].lastName}'),
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
                },
                loading: () => Center(child: CircularProgressIndicator(),),
                error: (error, stackTrace) => Text('Erreur: $error'),
              );
            }
    );*/


   FutureBuilder<List<UsersModel>>(
      future: DatabaseManager.getAllUser(),
      builder: (BuildContext context, AsyncSnapshot<List<UsersModel>> snapshot )
      {
        if(snapshot.connectionState == ConnectionState.waiting)
          {
            return const Center(child: CircularProgressIndicator(),);
          }
        else if(snapshot.hasError)
          {
            return Center(child: Text(snapshot.error.toString()),);
          }
        else if(snapshot.hasData)
          {
            if(snapshot.data != null)
            {

              List<UsersModel>?model = snapshot.data;
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
                            Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(200, 200, 200, 200),
                              ),
                              child: Icon(Icons.perm_identity, size: 25.0,),
                            ),

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

          }

          return const Center(child: CircularProgressIndicator(),);


      }
    );
  }

}