import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fleetapp/screens/fleet.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class AddTruck extends StatefulWidget {
  const AddTruck({Key key}) : super(key: key);

  @override
  State<AddTruck> createState() => _AddTruckState();
}

class _AddTruckState extends State<AddTruck> {
  TextEditingController _truckregistration = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String _truckNumber;
  String _trucktype;
  String _documenttype;
  TextEditingController _trucktypecontroller = TextEditingController();
  TextEditingController _documenttypecontroller = TextEditingController();
  List<String> trucktypeitems = [
    '14 Wheeler Open Body 32 MT Truck',
    '14 Wheeler Open Body 30 MT Truck',
    '14 Wheeler Open Body 28 MT Truck',
  ];
  List<String> documenttypeitems = [
    'Aadhar Card',
    'Pan Card',
    'Driving License',
    'Voter ID',
  ];
  File _image;
  final picker = ImagePicker();
  bool picked = false;

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery,);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        picked = true;
      } else {
        print('No image selected.');
      }
    });
  }

  Future getFromCamera() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.camera,);

    //final pickedFile = await ImagePicker.platform.pickImage(
    //    source: ImageSource.camera, preferredCameraDevice: CameraDevice.rear);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        picked = true;
      } else {
        print('No image selected.');
      }
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Gallery'),
                      onTap: () {
                        getImage();
                        print(_image);
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      getFromCamera();
                      print(_image);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "My Fleet",
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w300, color: Colors.black),
        ),
      ),
      body: WillPopScope(
        onWillPop: () {
          Navigator.pop(context);
        },
        child: Column(
          children: [
            Divider(
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            Form(
              key: _formkey,
              child: Column(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
                      child: Text(
                        'Enter Truck Registration Number*',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 12),
                      )),
                  Container(
                    padding: EdgeInsets.fromLTRB(18, 0, 18, 10),
                    child: TextFormField(
                      controller: _truckregistration,
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.black,
                      style: const TextStyle(color: Colors.black),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "Enter Truck Registration Number";
                        } else if (value.toString().characters.length != 10) {
                          return "Enter Truck Number in proper format";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 20),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10)),
                        filled: true,
                        fillColor: Colors.white,
                        //focusColor: Colors.red,
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        labelStyle: const TextStyle(color: Colors.black),
                        hintText: "   CG 04 MN 4013",
                      ),
                      onSaved: (input) => _truckNumber = input,
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
                      child: Text(
                        'Select Truck Type',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 12),
                      )),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      buttonPadding: EdgeInsets.fromLTRB(13, 2, 0, 2),
                      dropdownWidth: 360,
                      buttonDecoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                            color: Colors.black12,
                          )
                         ),
                      searchController: _trucktypecontroller,
                      dropdownPadding: EdgeInsets.symmetric(vertical:10,horizontal: 10),
                      dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                            color: Colors.black12,
                          )
                          ),
                      hint: Text(
                        'Select your truck type',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xff000000),
                        ),
                      ),
                      items: trucktypeitems
                          .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                          .toList(),
                      value: _trucktype,
                      onChanged: (value) {
                        setState(() {
                          _trucktype = value as String;
                        });
                      },
                      buttonHeight:60,
                      buttonWidth: 360,
                      itemHeight: 30,
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20, 25, 0, 10),
                      child: Text(
                        'Add Truck Documents',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 12),
                      )),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      buttonPadding: EdgeInsets.fromLTRB(13, 2, 0, 2),
                      dropdownWidth: 360,
                      buttonDecoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                            color: Colors.black12,
                          )
                      ),
                      searchController: _documenttypecontroller,
                      dropdownPadding: EdgeInsets.symmetric(vertical:10,horizontal: 10),
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                            color: Colors.black12,
                          )
                      ),
                      hint: Text(
                        'Select Document Type',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xff000000),
                        ),
                      ),
                      items: documenttypeitems
                          .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                          .toList(),
                      value: _documenttype,
                      onChanged: (value) {
                        setState(() {
                          _documenttype = value as String;
                        });
                      },
                      buttonHeight:60,
                      buttonWidth: 360,
                      itemHeight: 30,
                    ),
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
                  GestureDetector(
                    onTap: (){
                      _showPicker(context);
                    },
                    child: Container(
                      height: 0.08*MediaQuery.of(context).size.height,
                      width: 0.9*MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20, 15, 20, 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xffF5E8FF),
                      ),
                      child: Row(
                        children: [
                          Image(image: AssetImage('assets/images/img_43.png')),
                          SizedBox(width: 20,),
                          Text('Upload Document  *',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),)
                        ],
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(0, 200, 0, 0)),
                  Container(
                    height: 60,
                    width: 380,
                    decoration: const BoxDecoration(
                      color: Color(0xffF7CC46),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: FlatButton(
                        onPressed: () async {
                          if (_truckregistration.text.toString() != null &&
                              _truckregistration.text.toString().isEmpty && _trucktypecontroller.text.toString() != null &&
                              _trucktypecontroller.text.toString().isEmpty&& _documenttypecontroller.text.toString() != null &&
                              _documenttypecontroller.text.toString().isEmpty) {
                            return _scaffoldKey.currentState.showSnackBar(
                                new SnackBar(
                                    content: new Text("PLease fill all the fields",style: TextStyle(color: Colors.black),),backgroundColor: Color(0xffF7C436),));
                          } else if (_truckregistration.text
                                  .toString()
                                  .characters
                                  .length !=
                              10) {
                            return _scaffoldKey.currentState.showSnackBar(
                                new SnackBar(
                                    content: new Text(
                                        "Enter Truck Number in proper format",style: TextStyle(color: Colors.black)),backgroundColor: Color(0xffF7C436)));
                          }
                          if (_formkey.currentState.validate()) {
                            FocusManager.instance.primaryFocus.unfocus();
                          }
                          await Future.delayed(
                              const Duration(milliseconds: 200));
                          Navigator.pop(context);
                          // pushNewScreen(
                          //   context,
                          //   screen: FleetPage(),// OPTIONAL VALUE. True by default.
                          //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
                          // );
                        },
                        shape: const StadiumBorder(),
                        child: const Text('Add Truck',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w700))),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
