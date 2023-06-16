import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Widgets
{
  //varible pour afficher le point de notification
  static bool isVisible = false;
  //toast message
static void toastMsg(String msg)
{
  Fluttertoast.showToast(msg: msg);
}

  static double width(BuildContext context)
  {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    Size screenSize = mediaQueryData.size;
    double screenWidth = screenSize.width;
    return screenWidth;
  }

  //button fonction
  static Widget button(BuildContext context, String name, dynamic? action , double width, double height)
  {
    return SizedBox(
    width: width,
    height: height,
    child: ElevatedButton(
    onPressed: () {
  //action de validation
  showDialog(
  context: context,
  builder:(context){
  return action;
  }
  );
  },
  style: ButtonStyle(
  backgroundColor: MaterialStateProperty.all(Colors.black),
  ),
  child: Text(name),

  ),
  );
  }

  //field methode
  static Widget formField( String hint)
  {
    return  Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        validator: (value){
          //validate field
        },
        decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))
            )
        ),
      ),
    );
  }

  static Widget formFieldEdit( String valueInit)
  {
    return  Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        initialValue: valueInit,
        onChanged: (val)
        {

        },
        validator: (value){
          //validate field
        },
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))
            )
        ),
      ),
    );
  }


  static Widget Dialog (BuildContext context,String title, String textContent, String button1, String button2, action)
  {
    return SimpleDialog(
      title: Text('$title', textAlign: TextAlign.center,),
      contentPadding: EdgeInsets.zero,
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),

          child: Column(
            children: [
              SizedBox(height: 15.0,),
              Text('$textContent', textAlign: TextAlign.center,),

              SizedBox(height: 15.0,),

              Align(
                  alignment: Alignment.center,
                  child: Wrap(
                      children: [
                        SizedBox(
                          width: 120.0,
                          child: ElevatedButton(
                            onPressed:  (){
                                Navigator.of(context).pop();
                            },
                            child: Text(button1, style: TextStyle(color: Color.fromARGB(200, 0, 0, 0)),),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Color.fromARGB(
                                  200, 196, 191, 191)),

                            ),
                          ),
                        ),
                        SizedBox(width: 10,),

                        SizedBox(
                          width: 120.0,
                          child: ElevatedButton(
                            onPressed:  (){
                              action;
                            },
                            child: Text(button2),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.black),

                            ),
                          ),
                        ),


                      ]
                  )
              ),
            ],
          ),
        ),

      ],
    );
  }
}