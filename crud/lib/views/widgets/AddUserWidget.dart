import 'package:crud/models/Users.dart';
import 'package:crud/viewModels/AddUserViewModel.dart';
import 'package:crud/views/widgets/Widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
          Container(
            height: 150.0,
            decoration: BoxDecoration(
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
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text('First name',
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),),
                  ),
                  //formField( 'Prénom', fname),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(

                      validator: (val) => val!.isEmpty ? "first name required": null,
                      onChanged: (val)
                      {
                        fname  = val;
                      },

                      decoration: InputDecoration(
                          hintText: 'Prenom',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0))
                          )
                      ),
                    ),
                  ),

                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text('Last name',
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),),
                  ),
                  //formField( 'Nom', lname),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(

                      validator: (val) => val!.isEmpty ? "last name required": null,
                      onChanged: (val)
                      {
                        lname  = val;
                      },
                      decoration: InputDecoration(
                          hintText: 'Nom',
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
                  //formField('Age', age),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
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
                        age  = val;
                      },

                      decoration: const InputDecoration(
                          hintText: 'age',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0))
                          )
                      ),
                    ),
                  ),

                  SizedBox(height: 10,),
//buton to save
                  Padding(
                      padding: EdgeInsets.only(left: 20, right: 20.0),
                      child: SizedBox(
                        width: Widgets.width(context),
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            //action de validation
                            if(_formKey.currentState!.validate())
                            {
                              print('fname: $fname, lname: $lname');
                              UsersModel model = UsersModel(id: null ,firstName: fname, lastName: lname, age: int.parse(age)) ;
                             AddUserViewModel.actionSave(context, model);
                            }
                            else
                            {
                              print('nom validé');
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.black),
                          ),
                          child: Text('SAVE'),

                        ),
                      )
                  ),

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