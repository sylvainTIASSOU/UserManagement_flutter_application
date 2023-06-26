import 'package:crud/models/notification.dart';
import 'package:crud/viewModels/editUserViewModel.dart';
import 'package:crud/viewModels/providers/providers.dart';
import 'package:crud/viewModels/services/serviceMethodes.dart';
import 'package:crud/views/widgets/Widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/Users.dart';
import '../../viewModels/databaseManager/databaseManager.dart';

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
          Widgets.circleProfil(),

          SizedBox(height: 73,),
          //formulaire d' ajout
          Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: [
                        Text('First name',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 15,),
                        Icon(Icons.circle_rounded, color: Colors.red, size: 5,)
                      ],
                    )
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

                      decoration: Widgets.formFieldDecorator('Prénom'),
                    ),
                  ),

                  SizedBox(height: 38,),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: [
                        Text('Last name',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 15,),
                        Icon(Icons.circle_rounded, color: Colors.red, size: 5,)
                      ],
                    )
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
                      decoration: Widgets.formFieldDecorator('Nom'),
                    ),
                  ),

                  SizedBox(height: 38,),
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
                      decoration: Widgets.formFieldDecorator('Age'),
                    ),
                  ),

                  SizedBox(height: 47,),
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
                             Object idAPI = await ServiceMethodes.getId(data['firstName']);
                             UsersModel model = UsersModel(id: id, firstName: fname, lastName: lname, age: int.parse(age)) ;
                             UsersModel model2 = UsersModel(id: idAPI, firstName: fname, lastName: lname, age: int.parse(age)) ;
                             Notifications notif = Notifications(idNotif:null, minute: '${DateTime.now().minute.toString()}' , hour: '${DateTime.now().hour.toString()}',   message: '${data?['lastName']} updated');
                             //DatabaseManager.updateDB(model);

                             EditUserViewModel.actionButtonSaveChanges(context, model, notif, id, int.parse(idAPI.toString()), model2);
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
                  SizedBox(height: 186,),
                  //Widgets.button(context, "SAVE", Widgets.Dialog(context, "Save changes ?", "the modificatons you made will  update the data", "Cancel", "Save"), 330.0, 50.0),
                ],
              )
          )
        ],
      ),
    );
  }
}