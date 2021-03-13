import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
//                        image: DecorationImage(
//                          image: AssetImage("assets/images/im1.jpg"),
//                          fit: BoxFit.cover,
//                        ),
                    color: Colors.deepPurple,
                )
                ),
                Column(
                  children: [
                    SizedBox(height: 20,),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text("Profile",style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20,top: 190),
                      // ignore: deprecated_member_use
                      child: FlatButton(
                          height: 40,
                          minWidth: 120,
                          color: Colors.yellow,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return signIN();
                              },
                            );

                          }),
                    ),
                  ],
                )
              ],

            ),
          ],
        ),
      ),
    );
  }
  Widget signIN() {
    return BottomSheet(
      onClosing: () {},
      builder: (context) {
        return StatefulBuilder(
          builder: (context, myState) {
            return Container(
              height: 250,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text("Sin In",style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                  SizedBox(height: 25),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget> [
                      SizedBox(height: 15),
                      GoogleSignInButton(
                        centered: true,
                        borderRadius: 30,
                        darkMode: true,
                        onPressed: (){

                        },
                      ),
                      SizedBox(height: 15),
                      FacebookSignInButton(
                        centered: true,
                        splashColor: Colors.yellow,
                        borderRadius: 30,
                        onPressed: (){

                        },
                      )


                    ],
                  ),
                ],
              ),

            );
          },
        );
      },
    );
  }
}


