import 'package:flutter/material.dart';

class Booking extends StatefulWidget {
  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
              ),
              child:  Center(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text("MY BOOKINGS",style:TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                    )),
                  ),
                ),
              ),
            ),
            SizedBox(height: 25,),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Padding(
                  padding: EdgeInsets.only(left: 200),
                  child: FlatButton(
                    height: 50,
                    minWidth: 120,
                    color: Colors.yellow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Text(
                        "Refresh",
                        style: TextStyle(
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        setState(() {}
                        );
                      }),
                ),
              ],
            ),
            SizedBox(height: 100,),
            Center(
              child: Text("You don't have any bookings yet",style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),
            )

          ],
        )
      ),
    );
  }
}



