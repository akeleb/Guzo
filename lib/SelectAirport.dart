import 'package:flutter/material.dart';

class SelectAirPort extends StatefulWidget {
  @override
  _SelectAirPortState createState() => _SelectAirPortState();
}

class _SelectAirPortState extends State<SelectAirPort> {
  TextEditingController _textController=TextEditingController();

 List <dynamic> newAirPortList= List<dynamic>.from(airPort);
  List <dynamic> newOtherAirPortList= List<dynamic>.from(otherAirport);
  onItemChanged(String value){
    setState(() {
      newAirPortList=airPort.where((string) =>
          string.toLowerCase().contains(value.toLowerCase())).toList();
      newOtherAirPortList=otherAirport.where((string) =>
          string.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }

 static List <dynamic> airPort = [
    'Addis Ababa, Bole International Airport(BIA)',
    'Bahir Dar, Bahir Dar International Airport(BIA)',
    'Mekelle, Allula AbaNega International Airport(AIA)',
    'Lalibela, Lalibela International Airport(LIA)',
    'Jimma, Jimma International Airport(JIA)',
    'Gondar, TheodrosII International Airport(TIA)',
    'Dire Dawa, Diredawa International Airport(DIA)',
    'Axum, YohanesVI International Airport(YIA)'
  ];

 static List <dynamic> otherAirport = [
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
                  // ignore: deprecated_member_use
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
                onChanged: onItemChanged,

              ),
              Text('Direct AirPort',style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold
              ),),
              Divider(thickness: 3,color: Colors.black,),
              Container(
                height: 300,
                child: ListView.builder(
                  itemCount: newAirPortList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          onTap: (){
                            Navigator.pop(context, newAirPortList[index]);
                          },
                          leading: Icon(Icons.airplanemode_active),
                          title: Text(newAirPortList[index], maxLines: 2, overflow: TextOverflow.ellipsis,),
                        ),
                        Divider(thickness: 1,color: Colors.black,),
                      ],
                    );
                  },
                ),
              ),
              Text('Other AirPort',style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
              ),),
              Divider(thickness: 3,
                color: Colors.black,
              ),
              Container(
                height: 300,
                child: ListView.builder(
                  itemCount: newOtherAirPortList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          onTap: (){
                            Navigator.pop(context, newOtherAirPortList[index]);
                          },
                          leading: Icon(Icons.airplanemode_active),
                         title: Text(newOtherAirPortList[index], maxLines: 2, overflow: TextOverflow.ellipsis,),
                        ),
                        Divider(thickness: 1,color: Colors.black,),
                      ],
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
