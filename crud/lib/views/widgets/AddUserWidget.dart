import 'package:crud/models/Users.dart';
import 'package:crud/viewModels/AddUserViewModel.dart';
import 'package:crud/views/pages/Page.dart';
import 'package:crud/views/widgets/Widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/notification.dart';
import '../../viewModels/databaseManager/databaseManager.dart';

class AddUserWidget extends ConsumerStatefulWidget
{
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _AddUserState();
  }
}

class _AddUserState extends ConsumerState<AddUserWidget>
{
  //definition d'un regex
  RegExp regex = RegExp(r'^[0-9]+$');
 String fname = "";
  String lname = "";
 String age = "";
  final _formKey = GlobalKey<FormState>();//key of formulaire to validate it and get valure
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20.0,),
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
                  //formField( 'Prénom', fname),
                  //Widgets.formField('Prénom', fname, AddUserViewModel.validetor(fname)),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      validator: (val) {
                        if(val!.isEmpty)
                        {
                          return'first name required';
                        }
                        else
                          return null;
                      },

                      onChanged: (val)
                      {
                        fname  = val;
                      },
                      decoration:  Widgets.formFieldDecorator('Prénom')
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
                  //formField( 'Nom', lname),
                 // Widgets.formField('Nom', lname, AddUserViewModel.validetor( lname)),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                        validator: (val) {
                          if(val!.isEmpty)
                          {
                            return'last name required';
                          }
                          else
                            return null;
                        },

                        onChanged: (val)
                        {
                          lname  = val;
                        },
                        decoration:  Widgets.formFieldDecorator('Nom')
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
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),

                    child: TextFormField(
                        validator: (val) {
                          if (val!.isNotEmpty) {
                            if (RegExp(r'^[0-9]+$').hasMatch(val)) {
                              return null;
                            }
                            else {
                              return "The age must be a number";
                            }
                          }
                          else {
                            return "age required";
                          }
                        },

                        onChanged: (val)
                        {
                          age  = val;
                        },
                        decoration:  Widgets.formFieldDecorator('Age')
                    ),
                  ),

                  SizedBox(height: 47,),
//buton to save
                  Container(
                      padding: EdgeInsets.only(left: 20, right: 20.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: SizedBox(
                        width: Widgets.width(context),
                        height: 46,
                        child: ElevatedButton(
                          onPressed: () {
                            //action de validation
                            if(_formKey.currentState!.validate())
                            {
                              print('fname: $fname, lname: $lname');
                              Notifications notif = Notifications(idNotif:null, minute: '${DateTime.now().minute.toString()}' , hour: '${DateTime.now().hour.toString()}',   message: '$fname created');
                              UsersModel model = UsersModel(id: null ,firstName: fname, lastName: lname, age: int.parse(age)) ;
                              AddUserViewModel.actionSave(context, model, notif);

                              Widgets.isVisible = true;


                            }
                            else
                            {
                              print('nom validé');
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.black),
                            side: MaterialStateProperty.all(BorderSide())
                          ),
                          child: Widgets.textButton('Save'),

                        ),
                      )
                  ),

                  SizedBox(height: 186,),

                ],
              )
          )
        ],
      ),
    );
  }

  Widget formField( String hint, String value)
  {
    return  Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(


        onChanged: (val)
        {
          value  = val;
        },
        validator: (val) => val!.isEmpty ? "entrer l'email": null,
        decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))
            )
        ),
      ),
    );
  }
}