import 'package:crud/models/Users.dart';
import 'package:crud/viewModels/services/serviceMethodes.dart';
import 'package:crud/viewModels/userListViewModel.dart';
import 'package:crud/views/pages/Notification.dart';
import 'package:crud/views/widgets/UserListWidget.dart';
import 'package:crud/views/widgets/Widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserList extends ConsumerStatefulWidget
{
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _UserListState();
  }

}

class _UserListState extends ConsumerState<UserList>
{

  @override
  void initState() {
    //on recupert l'etate du provider ici
    // TODO: implement initState
    super.initState();
  }
  Widget build (BuildContext context)
  {
    final apiService = ServiceMethodes.getAll();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(250, 0, 0, 0),
        title: Widgets.appBarTitle('Users'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(250, 2, 0, 0),
        onPressed: (){
          //action
          UserListViewModel.moveToCreatePage(context);
        },
        child: Image.asset('assets/Icon.png',
            height: 19.33,
            width: 19.33,)

      ),
      body: UserListwidget()
      // FutureBuilder(
      //   future: apiService,
      //   builder: (context, snapshot) {
      //     if(snapshot.connectionState == ConnectionState.done)
      //       {
      //         final List<UsersModel> model = snapshot.data!;
      //         return ListView.builder(
      //             itemCount: model.length,
      //             itemBuilder: (context, index){
      //               return Padding(
      //                 padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
      //                 child: GestureDetector(
      //                   onTap: () => UserListViewModel.moveToUserProfil(context, model, index),
      //                   child: Row(
      //                     children: [
      //
      //                       //profile
      //                       Container(
      //                         padding: EdgeInsets.all(10),
      //                         margin: EdgeInsets.all(5),
      //                         decoration: const BoxDecoration(
      //                           shape: BoxShape.circle,
      //                           color: Color.fromARGB(200, 200, 200, 200),
      //                         ),
      //                         child: Icon(Icons.perm_identity, size: 40.0,),
      //                       ),
      //
      //                       SizedBox(width: 20,),
      //
      //                       Column(
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         children: [
      //                           Text('${model?[index].firstName} ${model?[index].lastName}'),
      //                           SizedBox(height: 5.0),
      //                           Text('${model?[index].age }  ans'),
      //                         ],
      //                       ),
      //
      //                     ],
      //                   ),
      //                 ),
      //               );
      //             }
      //         );
      //       }
      //     return CircularProgressIndicator();
      //   },
      //
      // )


    );
  }
}