import 'package:crud/models/notification.dart';
import 'package:crud/viewModels/databaseManager/noficationDatabase.dart';
import 'package:crud/viewModels/editUserViewModel.dart';
import 'package:crud/viewModels/providers/providers.dart';
import 'package:crud/views/widgets/Widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';

import '../../models/Users.dart';
import '../../viewModels/databaseManager/databaseManager.dart';
import '../pages/Page.dart';

class UpdateUserWidget extends ConsumerStatefulWidget
{
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _UpdateUserState();
  }
}

class _UpdateUserState extends ConsumerState
{

  RegExp regex = RegExp(r'^[0-9]+$');
  // String fname = "";
  // String lname = "";
  // String age = "";
  late TextEditingController fNameControler;
  late TextEditingController lNameControler;
  late TextEditingController ageControler;

  final _formKey = GlobalKey<FormState>();//key of formulaire to validate it and get valure
  //liberation des resource
@override
  void dispose() {
    fNameControler.dispose();
    lNameControler.dispose();
    ageControler.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    ref.read(Providers.isVisibleProvider);
  }
  @override
  Widget build(BuildContext context) {

    Map? data = EditUserViewModel.getData(context);
    fNameControler = TextEditingController(text: data?['firstName']);
    lNameControler    = TextEditingController(text: data?['lastName']);
    ageControler = TextEditingController(text: '${data?['age']}');


    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20.0,),
          //container of use profile
          Container(
            height: 150.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(200, 200, 200, 200),
            ),
          ),

          SizedBox(height: 10,),
          //formulaire d' ajout
          Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text('First name',
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),),
                  ),
                  //Widgets.formFieldEdit( '${data?['firstName']}'),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      controller: fNameControler,
                      //initialValue: '${data?['firstName']}',
                      validator: (val) => val!.isEmpty ? "entrer first name": null,
                      onChanged: (val)
                      {
                        //fname  = val;
                      },

                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0))
                          )
                      ),
                    ),
                  ),

                  SizedBox(height: 10,),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text('Last name',
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),),
                  ),
                  //Widgets.formFieldEdit('${data?['lastName']}'),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      controller: lNameControler,
                     //initialValue: '${data?['lastName']}',
                      validator: (val) => val!.isEmpty ? "entrer last name": null,
                      onChanged: (val)
                      {
                        //lname  = val;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(

                              borderRadius: BorderRadius.all(Radius.circular(10.0))
                          )
                      ),
                    ),
                  ),

                  SizedBox(height: 10,),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text('Age',
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),),
                  ),
                  //Widgets.formFieldEdit( '${data?['age']}'),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      controller: ageControler,
                     //initialValue: '${data?['age']}',
                      validator: (val) {
                        if(val!.isNotEmpty)
                        {
                          if(regex.hasMatch(val))
                          {
                            return null;
                          }
                          else
                          {
                            return "The age must be a number";
                          }
                        }
                        else
                        {
                          return "age required";
                        }
                      },
                      onChanged: (val)
                      {
                        //age  = val;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0))
                          )
                      ),
                    ),
                  ),

                  SizedBox(height: 10,),
//button de validation et de saving
                  Padding(
                      padding: EdgeInsets.only(left: 20, right: 20.0),
                      child: SizedBox(
                        width: Widgets.width(context),
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () async {
                            //action de validation
                            if(_formKey.currentState!.validate())
                            {
                             String fname = fNameControler.value.text;
                             String lname = lNameControler.value.text;
                             String age = ageControler.value.text;
                             //print('fname: $fn');
                              //
                              int id = await  DatabaseManager.getUserId(data!);
                             UsersModel model = UsersModel(id: id, firstName: fname, lastName: lname, age: int.parse(age)) ;
                             Notifications notif = Notifications(minute: '${DateTime.now().minute.toString()}' , hour: '${DateTime.now().hour.toString()}', name: model.lastName, mode: 'updated');
                             //DatabaseManager.updateDB(model);
                             EditUserViewModel.actionButtonSaveChanges(context, model, notif);
                             //context.read(Providers.isVisibleProvider).state = true;
                            Widgets.isVisible = true;
//add notification
                            }
                            else
                            {
                              print('nom validé');
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.black),
                          ),
                          child: Text('Save changes'),

                        ),
                      )
                  ),
                  //Widgets.button(context, "SAVE", Widgets.Dialog(context, "Save changes ?", "the modificatons you made will  update the data", "Cancel", "Save"), 330.0, 50.0),
                ],
              )
          )
        ],
      ),
    );
  }
}