import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                  ],
                )
              ],

            ),
          ],
        ),
      ),
    );
  }
}



