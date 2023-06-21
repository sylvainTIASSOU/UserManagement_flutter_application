import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../my_flutter_app_icons.dart';

class Widgets
{

  //profill of

  //back button on AppBar
  static Widget backButton(BuildContext context)
  {
    return Container(
      // height: 20,
      // width: 20,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        shape: BoxShape.circle,
        border: Border.all(
            color: Color.fromARGB(255, 217, 217, 217),
            width: 2.0
        ),
      ),
      child: IconButton(
        onPressed: (){
          Navigator.of(context).pop();
        },
        icon: Center(child: Icon(Icons.west_outlined, color: Colors.black,size: 18,),),
      ),
    );
  }
  
  
  //text of button
  static Widget textButton(String name)
  {
    return Text(name,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,

      ),);
  }

  //profil circle of addUser and editUser
  static Widget circleProfil()
  {
    return Container(
      height: 128.0,
      width: 128.0,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromARGB(255, 218, 220, 224),
      ),
      child: Image.asset('assets/profil.png', scale: 0.3,)
    );
  }

  //PROFIL circcle
  static Widget circle(Widget widget)
  {
    return Container(
        height: 40,
        width: 40,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(5),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromARGB(217, 217, 228, 236),
        ),
        child: widget
      //Icon(Icons.perm_identity, size: 25.0,),
    );
  }

  //app bar style
  static Widget appBarTitle(String title)
  {
    return Text(title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w800,
        //height: 26
      ),);
  }



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
 static formFieldDecorator(hint)
  {
    return InputDecoration(

        hintText: hint,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(250, 0, 0, 0),
            width: 2.0,
          ),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))
        )
    );
  }
  static Widget formField( String hint, String name, validator )
  {
    return  Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        validator: (val) {
         return validator;
        },

        onChanged: (val)
        {
          name  = val;
        },
        decoration:  InputDecoration(

            hintText: hint,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(250, 0, 0, 0),
                width: 2.0,
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))
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