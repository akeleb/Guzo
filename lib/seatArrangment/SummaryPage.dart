import 'package:com/seatArrangment/seatarrangment.dart';
import 'package:flutter/material.dart';

class SummaryPage extends StatefulWidget {
  final String sitNumber;

  const SummaryPage({@required this.sitNumber}) ;

  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              child: Text("You selected seat Number "+widget.sitNumber
                  ,style: TextStyle(
                  fontSize: 20
                ),),
            )
          ],
        ),
      ),

    );
  }
}
