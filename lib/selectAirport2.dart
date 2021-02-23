import 'package:flutter/material.dart';

class SelectAirPort2 extends StatefulWidget {
  @override
  _SelectAirPort2State createState() => _SelectAirPort2State();
}

class _SelectAirPort2State extends State<SelectAirPort2> {
  TextEditingController _textController=TextEditingController();

  List <String> newAirPortList2= List<String>.from(airPort2);
  List <String> newOtherAirPortList2= List<String>.from(otherAirport2);
  onItemChanged(String value){
    setState(() {
      newAirPortList2=airPort2.where((string) =>
          string.toLowerCase().contains(value.toLowerCase())).toList();
      newOtherAirPortList2=otherAirport2.where((string) =>
          string.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }

static List<String> airPort2 = [
  'Addis Ababa, Bole International Airport(BIA)',
  'Bahir Dar, Bahir Dar International Airport(BIA)',
  'Mekelle, Allula AbaNega International Airport(AIA)',
  'Lalibela, Lalibela International Airport(LIA)',
  'Jimma, Jimma International Airport(JIA)',
  'Gondar, TheodrosII International Airport(TIA)',
  'Dire Dawa, Diredawa International Airport(DIA)',
  'Axum, YohanesVI International Airport(AIA)'
  ];
  static List<String> otherAirport2 = [
    'Washington, Washington International AirPort(WIA)',
    'NewYork, NewYork International AirPort(NIA)',
    'London, London International AirPort(LIA)',
    'Paris, Paris International AirPort(PIA)',
    'Dubai, Dubai International AirPort(DIA)',
    'Berline,Berlin International AirPort(BIA)',
    'Rome, Rome International AirPort(RIA)',
    'Sanfranssico, Sanfranssico International AirPort(SIA)',
    'LosAngeles, LosAngeles International AirPort(LIA)',
    'Toronto, Toronto  International AirPort(TIA)',
    'Tokyo, Tokyo International AirPort(TIA)',
    'Beging, Beging International AirPort(BIA)'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(child: Text('  Select AirPort',style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),)),
                  FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),))
                ],
              ),
              TextFormField(
                onChanged: onItemChanged,
                controller: _textController,
                cursorColor: Colors.red,
                keyboardType: TextInputType.text,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'OpenSans',
                ),
                decoration: InputDecoration(
                  fillColor: Colors.black12,
                  filled: true,
                  border: UnderlineInputBorder(),
                  prefixIcon: Icon(Icons.search, color: Colors.blue),
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    color: Colors.blueGrey,
                    fontFamily: 'OpenSans',
                  ),
                ),

              ),
              
              Text('Direct AirPort'),
              Divider(
                color: Colors.black,
              ),
              Container(
                height: 300,
                child: ListView.builder(
                  itemCount: newAirPortList2.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: (){
                        Navigator.pop(context, newAirPortList2[index]);
                      },
                      leading: Icon(Icons.airplanemode_active),
                      title: Text(newAirPortList2[index], maxLines: 2, overflow: TextOverflow.ellipsis,),
                    );
                  },
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              Text('Other AirPort'),
              Divider(
                color: Colors.black,
              ),
              Container(
                height: 300,
                child: ListView.builder(
                  itemCount: newOtherAirPortList2.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: (){
                        Navigator.pop(context, newOtherAirPortList2[index]);
                      },
                      leading: Icon(Icons.airplanemode_active),
                      title: Text(newOtherAirPortList2[index], maxLines: 2, overflow: TextOverflow.ellipsis,),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
