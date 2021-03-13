import 'package:com/seatArrangment/seatarrangment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'SelectAirport.dart';
import 'selectAirport2.dart';
import 'dart:async';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String airport = ' ', departure = 'select departure', add = 'ADD';
  String airport2 = ' ', departure2 = 'select Distination ', add2 = 'ADD';

  int adultPassengers = 1;
  int childrenPassengers = 0;
  int infantPassengers = 0;
  String cabinn="Economy";
  bool twoWay = true;

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(Duration(days: 7));
  DateFormat get formatter => DateFormat('dd');
  DateFormat get formatter2 => DateFormat('MMM');
  DateFormat get formatter3 => DateFormat('EEEE');
  String get formatted => formatter.format(startDate);
  String get formatted11 => formatter2.format(startDate);
  String get formatted12 => formatter3.format(startDate);
  String get formatted2 => formatter.format(endDate);
  String get formatted3 => formatter2.format(endDate);
  String get formatted4 => formatter3.format(endDate);

  Future displayDateRangePicker(BuildContext context) async {
    DateTimeRange picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: new DateTime(DateTime.now().year + 2),

    );
    // ignore: unrelated_type_equality_checks
    if(picked!=null&&picked!=startDate){
      setState(() {
        startDate=picked.start;
        endDate=picked.end;
      });
    }
  }
  Future displayDatePicker(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: startDate,
      firstDate: DateTime.now(),
      lastDate: new DateTime(DateTime.now().year + 2),

    );
    if(picked!=null&&picked!=startDate){
      setState(() {
        startDate=picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 350,
                      decoration: BoxDecoration(
//                        image: DecorationImage(
//                          image: AssetImage("assets/images/im1.jpg"),
//                          fit: BoxFit.cover,
//                        ),
                        color: Color(0xff21254A),
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Center(
                          child: Text(
                            "Guzo",
                            style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow),
                          ),
                        ),
                        Text(
                          "guzo",
                          style: TextStyle(
                            color: Colors.redAccent,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 40,
                          width: 320,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                // ignore: deprecated_member_use
                                child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                    color: twoWay ? Colors.white : null,
                                    child: Text(
                                      "Return",
                                      style: TextStyle(
                                          color: twoWay ? Colors.deepPurple: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        twoWay = true;
                                      });
                                    }),
                              ),
                              Expanded(
                                // ignore: deprecated_member_use
                                child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                    color: !twoWay ? Colors.white : null,
                                    child: Text(
                                      "one-Way",
                                      style: TextStyle(
                                        color: twoWay ? Colors.white: Colors.deepPurple,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        twoWay = false;
                                      });
                                    }),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 25,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return SelectAirPort();
                                  },
                                )).then((value) {
                                  if( value!=null)
                                    setState(() {
                                      airport = value.toString().split(',').last;
                                      departure = value.toString().split(',').first+'';
                                      add = airport.substring(airport.length - 4, airport.length - 1);
                                    });
                                });
                              },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'From',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      add,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                      ),
                                    ),
                                    Text(
                                      departure,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      airport,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontStyle: FontStyle.italic,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),

                            ),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 15,
                              child: Center(
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.arrow_forward,
                                        color: Colors.black,
                                        size: 15,
                                      ),
                                      Icon(
                                        Icons.arrow_back,
                                        color: Colors.black,
                                        size: 15,
                                      ),
                                    ],
                                  )),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return SelectAirPort2();
                                  },
                                )).then((value) {
                                  if(value!=null)
                                    setState(() {
                                      airport2 = value.toString().split(',').last;
                                      departure2 = value.toString().split(',').first;
                                      add2 = airport2.substring(airport2.length - 4, airport2.length - 1);
                                    });
                                });
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'To',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    add2,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                  Text(departure2,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                      ),
                                  Text(
                                    airport2,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                  height: 80,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black26,
                                    ),
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text("Departure Date"),
                                      InkWell(
                                        onTap: () {
                                          twoWay? displayDateRangePicker(context)
                                              :displayDatePicker(context);
                                        },
                                        child: Row(
                                          children: [
                                            Text('  '+
                                                formatted.toString(),
                                              style: TextStyle(
                                                  fontSize: 35,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Column(
                                              children: [
                                                Text('  '+formatted11.toString(),style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold),),
                                                Text('  '+formatted12.toString()),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                            Expanded(
                                flex: 1,
                                child: Container(
                                  height: 80,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black26,
                                    ),
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  child: Visibility(
                                    visible: twoWay,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text("Return Date"),
                                        InkWell(
                                          onTap: () {
                                            displayDateRangePicker(context);
                                          },
                                          child: Row(
                                            children: [
                                              Text('  '+
                                                  formatted2.toString(),
                                                style: TextStyle(
                                                    fontSize: 35,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              Column(
                                                children: [
                                                  Text('  '+formatted3.toString(),style: TextStyle(
                                                      fontSize: 25,
                                                      fontWeight: FontWeight.bold),),
                                                  Text('  '+formatted4.toString()),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ))
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return cabin();
                                      },
                                    );
                                  },
                                  child: Container(
                                    height: 80,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black26,
                                      ),
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    child: Column(
                                      children: [
                                        Text("Cabin Class"),
                                        SizedBox(height: 15,),
                                        Text(cabinn,style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),),
                                      ],
                                    ),
                                  ),
                                )),
                            Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return passengers();
                                      },
                                    );
                                  },
                                  child: Container(
                                    height: 80,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black26,
                                      ),
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    child: Column(
                                      children: [
                                        Text("Passengers"),
                                        SizedBox(height: 30,),
                                        Row(
                                          children: [
                                            Icon(Icons.person),
                                            SizedBox(width: 5,),
                                            Text(adultPassengers.toString()),
                                            SizedBox(width: 25,),
                                            Icon(Icons.person,size: 15,),
                                            SizedBox(width: 5,),
                                            Text(childrenPassengers.toString()),
                                            SizedBox(width: 25,),
                                            Icon(Icons.person,size: 10,),
                                            SizedBox(width: 5,),
                                            Text(infantPassengers.toString())
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Center(
                    child: Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      // ignore: deprecated_member_use
                      child: FlatButton(
                          child: Text(
                            "Search Flights",
                            style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return SeatArrangment();
                          },));
                          }
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget passengers() {
    int adult = 1;
    int children = 0;
    int infant = 0;
    return BottomSheet(
      onClosing: () {},
      builder: (context) {
        return StatefulBuilder(
          builder: (context, myState) {
            return Container(
              height: 250,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Passengers',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // ignore: deprecated_member_use
                          FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'cancel',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.indigo),
                              )),
                          // ignore: deprecated_member_use
                          FlatButton(
                              onPressed: () {
                                setState(() {
                                  adultPassengers = adult;
                                  childrenPassengers = children;
                                  infantPassengers = infant;
                                });
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Done',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.indigo),
                              )),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 25,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Adults   ", style: TextStyle(
                              fontSize: 20,
                              color: Colors.indigo
                          ),),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: [
                              Text("Children  ", style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.indigo
                              ),),
                              Text("2-21 years"),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: [
                              Text("Infant  ", style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.indigo
                              ),),
                              Text("<2 Years")
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  icon: Icon(Icons.remove_circle_outline),
                                  onPressed: () {
                                    myState(() {
                                      adult > 1 ? --adult : adult = adult;
                                    });
                                  }),
                              Text(adult.toString()),
                              IconButton(
                                  icon: Icon(Icons.add_circle_outline),
                                  onPressed: () {
                                    myState(() {
                                      adult < 7 ? ++adult : adult = adult;
                                    });
                                  }),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                  icon: Icon(Icons.remove_circle_outline),
                                  onPressed: () {
                                    myState(() {
                                      children > 0
                                          ? --children
                                          : children = children;
                                    });
                                  }),
                              Text(children.toString()),
                              IconButton(
                                  icon: Icon(Icons.add_circle_outline),
                                  onPressed: () {
                                    myState(() {
                                      children < 6
                                          ? ++children
                                          : children = children;
                                    });
                                  }),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                  icon: Icon(Icons.remove_circle_outline),
                                  onPressed: () {
                                    myState(() {
                                      infant > 1 ? --infant : infant = infant;
                                    });
                                  }),
                              Text(infant.toString()),
                              IconButton(
                                  icon: Icon(Icons.add_circle_outline),
                                  onPressed: () {
                                    myState(() {
                                      infant < 6 ? ++infant : infant = infant;
                                    });
                                  }),
                            ],
                          ),
                        ],
                      ),
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

  Widget cabin() {
    return BottomSheet(
      onClosing: () {},
      builder: (context) {
        return StatefulBuilder(
          builder: (context, myState) {
            return Container(
              height: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Cabin Class",style:TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      )),
                      // ignore: deprecated_member_use
                      FlatButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          child: Text("Cancel"))
                    ],
                  ),
                  SizedBox(height: 20,),
                  InkWell(
                    onTap: (){
                      setState(() {
                        cabinn="Economy";
                        Navigator.pop(context);
                      });
                    },
                    child: SizedBox(
                        width: double.infinity,
                        child: Text("  Economy",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),)),
                  ),
                  Divider(
                    thickness: 1,color: Colors.black38,
                  ),
                  SizedBox(height: 25,),
                  InkWell(
                    onTap: (){
                      setState(() {
                        cabinn="Business";
                        Navigator.pop(context);
                      });
                    },
                    child: SizedBox(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Text("  Business",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                            ),),
                          ],
                        )),
                  ),
                  Divider(
                    thickness: 1,color: Colors.black38,
                  ),
                  SizedBox(height: 25,),
                  InkWell(
                    onTap: (){
                      setState(() {
                        cabinn="First";
                        Navigator.pop(context);
                      });
                    },
                    child: SizedBox(
                        width: double.infinity,
                        child: Text("  First",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),)),
                  ),
                  Divider(
                    thickness: 1,color: Colors.black38,
                  )
                ],
              ),

            );
          },
        );
      },
    );
  }
}