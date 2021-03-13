import 'package:flutter/material.dart';
import 'package:com/seatArrangment/SummaryPage.dart';
import 'package:com/seatArrangment/firstClassSits.dart';

class SeatArrangment extends StatefulWidget {
  @override
  _SeatArrangmentState createState() => _SeatArrangmentState();
}

class _SeatArrangmentState extends State<SeatArrangment> {
  int firstClassLength = 20;
  int economyEnds = 40;
  int businessEnds = 60;

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height / 100;
    var _width = MediaQuery.of(context).size.width / 100;
    var _fullHeight = MediaQuery.of(context).size.height;
    var _fullWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(),
        body: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: GridView.builder(
                itemCount: FirstClassSits.leftSits.length ,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5.0,
                    crossAxisSpacing: 20.0),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        FirstClassSits.leftSits[index].isReserved =
                            !FirstClassSits.leftSits
                                [index].isReserved;
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return SummaryPage(sitNumber: (index+1).toString()+" Left");
                      },));
                    },

                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Colors.blue[200],
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40))),
                      child: FirstClassSits.leftSits[index].isReserved
                          ? Center(child: Text("Reserved"))
                          : Center(child: Text((index+1).toString() + " L")),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: ListView.builder(
                itemCount: FirstClassSits.leftSits.length ~/ 2,
                itemBuilder: (context, index) {
                  return Container(
                      height: _height * 11,
                      child: Center(child: Text((index + 1).toString())));
                },
              ),
            ),
            Expanded(
              flex: 4,
              child: GridView.builder(
                itemCount: FirstClassSits.rightSits.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5.0,
                    crossAxisSpacing: 20.0),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        FirstClassSits.rightSits[index].isReserved =
                        !FirstClassSits.rightSits
                        [index].isReserved;
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return SummaryPage(sitNumber: (index+1).toString()+" Right");
                      },));
                    },
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Colors.blue[200],
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40))),
                      child: FirstClassSits.rightSits[index].isReserved
                          ? Center(child: Text("Reserved"))
                          : Center(child: Text((index+1).toString() + " R")),
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
