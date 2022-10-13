import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class NewPostDropdown extends StatefulWidget {
  const NewPostDropdown({Key? key}) : super(key: key);

  @override
  State<NewPostDropdown> createState() => _NewPostDropdownState();
}

class _NewPostDropdownState extends State<NewPostDropdown> {



  //FIRST LINK TO FETCH DATA DEPENDING ON THE NETWORK SELECTED
  var firstLink = 'https://duniyardata.com/app/auth/network.php';
  fetchNetworkProps() async {
    var token = '\$2y\$10\$9shJubTWa3ClBvahZ0n1Mu.5mnG4E5ymxRgY2t63B5ERHf4oihW.G';
    var response = await http.post(Uri.parse(firstLink), body: {
      "network": _networkSelectedVal.toString(),
      "token": token,
    });
    if (response.statusCode == 200) {
      var res = await json.decode(response.body);
      print(res);
      secondDropdownList = res['message'];
      print(secondDropdownList);
      setState(() {});
    }
  }



  //SECOND LINK TO FETCH DATA FROM ONLY MTN IF SELECTED
  var secondLink = 'https://duniyardata.com/app/auth/planner.php';
  fetchMtnTypePlans() async {
    var token = '\$2y\$10\$9shJubTWa3ClBvahZ0n1Mu.5mnG4E5ymxRgY2t63B5ERHf4oihW.G';
    var response = await http.post(Uri.parse(secondLink), body: {
      "network": _networkSelectedVal.toString(),
      "token": token,
      "type": _typeSelectedVal.toString() //this will be gotten if MTN is selected but other network doesn't matter
    });
    if (response.statusCode == 200) {
      var res = await json.decode(response.body);
      print(res);
      secondDropdownList = res['message'];
      print(secondDropdownList);
      setState(() {});
    }
  }

  _NewPostDropdownState() {
    _networkSelectedVal = networkList[0];
    _typeSelectedVal = typeList[0];
  }

  final networkList = ["MTN", "AIRTEL", "GLO", "9MOBILE"];
  final typeList = ["SME", "CORPORATE GIFTING", ];
  String? _networkSelectedVal = "";
  String? _typeSelectedVal = "";

  //second dropdownlist
  var secondDropdownList = [];
  String? secondDropDownValue;


  //third
  var thirdDropdownList=[];
  String? thirdDropdownValue;


  bool isMtn = false;
bool isLoading =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Method Dependent dropdown'),
      ),
      body: isLoading ? Center(child: CircularProgressIndicator(),): Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonFormField(
             
              value: _networkSelectedVal,
              items: networkList
                  .map((e) => DropdownMenuItem(
                value: e,
                child: Text(e),
              ))
                  .toList(),
              onChanged: (val) {
                setState(() {
                  secondDropDownValue = null;
                  _networkSelectedVal = "$val";
                  if (_networkSelectedVal != "MTN") {
                    fetchNetworkProps();
                    setState((){
                      isLoading=true;
                    });

                    Future.delayed(Duration(seconds: 5),(){
                      setState((){
                        isLoading=false;
                      });
                    });
                    isMtn==false;
                  }
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Selected $val')));
                });

                if(_networkSelectedVal == "MTN"){

                  setState((){
                    isMtn==true;
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          height: 300,
                          width: 100,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
                          child: ListView(
                            shrinkWrap: true,
                            primary: false,
                            padding: EdgeInsets.all(16),
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(100),
                                      topLeft: Radius.circular(100),
                                    )),
                                child: Center(
                                  child: Column(
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: StadiumBorder(),
                                          padding: EdgeInsets.symmetric(horizontal: 40),
                                        ),
                                        child: Text('Close'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: DropdownButtonFormField(
                                          value: _typeSelectedVal,
                                          items: typeList
                                              .map((e) => DropdownMenuItem(
                                            value: e,
                                            child: Text(e),
                                          ))
                                              .toList(),
                                          onChanged: (val) {
                                            setState(() {
                                              secondDropDownValue = null;
                                              _typeSelectedVal = "$val";
                                              fetchMtnTypePlans();
                                              setState((){
                                                isLoading=true;
                                              });

                                              Future.delayed(Duration(seconds: 5),(){
                                                setState((){
                                                  isLoading=false;
                                                });
                                                Navigator.pop(context);
                                              });

                                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Selected $val')));
                                            });
                                          },
                                          dropdownColor: Colors.white,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              labelText: 'Select Type',
                                              labelStyle: const TextStyle(fontSize: 20, color: Color.fromRGBO(36, 11, 54, 1.0))),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ));

                   // thirdDropdownValue = thirdDropdownValue;
                  });
                }
              },
              dropdownColor: Colors.white,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'SELECT NETWORK PROVIDER',
                  labelStyle: const TextStyle(fontSize: 20, color: Color.fromRGBO(36, 11, 54, 1.0))),
            ),
          ),








          //second dropdown
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonFormField(
              value: secondDropDownValue,
              items: secondDropdownList
                  .map((e) => DropdownMenuItem(
                value: e["size"],
                child: Row(
                  children: [
                    Text(e["size"]),
                    const SizedBox(width: 15,),
                    const Text("₦"),
                    Text(e["amount"]),
                  ],
                ),
              ))
                  .toList(),
              onChanged: (val) {
                setState(() {
                  secondDropDownValue = "$val";
                   fetchNetworkProps();

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Selected $val')));
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(secondDropDownValue.toString())));
                });
              },
              dropdownColor: Colors.white,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Select Package',
                  labelStyle: const TextStyle(fontSize: 20, color: Color.fromRGBO(36, 11, 54, 1.0))),
            ),
          ),



        ],
      ),
    );
  }
}




