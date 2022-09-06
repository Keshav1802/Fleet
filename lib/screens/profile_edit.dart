import 'dart:io';

import 'package:fleetapp/screens/profile_view.dart';
import 'package:fleetapp/utils/EnsureVisible.dart';
import 'package:flutter/material.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:image_picker/image_picker.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key key}) : super(key: key);

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final _businessTextController = TextEditingController();
  final _nameTextController = TextEditingController();
  final _phoneTextController = TextEditingController();
  final _gstTextController = TextEditingController();
  final _panTextController = TextEditingController();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  FocusNode _focusNodeBusiness= new FocusNode();
  FocusNode _focusNodeName = new FocusNode();
  FocusNode _focusNodePhone = new FocusNode();
  FocusNode _focusNodeGst = new FocusNode();
  FocusNode _focusNodePan = new FocusNode();
  final color = Color(0xffF5E8FF);
  String _businessname;
  String _name;
  String _phone;
  String _gst;
  String _pan;
  String countryValue;
  String stateValue;
  String cityValue;

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
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      getFromCamera();
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
          "Edit Profile",
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w300, color: Colors.black),
        ),
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
                  children: <Widget>[
                    Divider(
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Stack(children: [
                            InkWell(
                              onTap: (){
                                _showPicker(context);
                              },
                              child: Container(
                                decoration: new BoxDecoration(
                                  color: Color(0xffF5E8FF),
                                  shape: BoxShape.circle,
                                ),
                                padding: EdgeInsets.all(10),
                                child: CircleAvatar(
                                  radius: 30, // Image radius
                                  backgroundImage: AssetImage('assets/images/img_31.png'),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: -5,
                              child: buildEditIcon(color),
                            ),
                          ]),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: new EnsureVisibleWhenFocused(
                        focusNode: _focusNodeBusiness,
                        child: TextFormField(
                          scrollPadding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          controller: _businessTextController,
                          focusNode: _focusNodeBusiness,
                          keyboardType: TextInputType.text,
                          cursorColor: Colors.black,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.black12),
                                borderRadius: BorderRadius.circular(5)),
                            filled: true,
                            fillColor: Colors.white,
                            //focusColor: Colors.red,
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            labelStyle: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                            labelText: 'Business Name',
                          ),
                          onSaved: (input) => _businessname = input,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: new EnsureVisibleWhenFocused(
                        focusNode: _focusNodeName,
                        child: TextFormField(
                          scrollPadding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          controller: _nameTextController,
                          focusNode: _focusNodeName,
                          keyboardType: TextInputType.text,
                          cursorColor: Colors.black,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.black12),
                                borderRadius: BorderRadius.circular(5)),
                            filled: true,
                            fillColor: Colors.white,
                            //focusColor: Colors.red,
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            labelStyle: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                            labelText: 'Your Name',
                          ),
                          onSaved: (input) => _name = input,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Column(
                        children: [
                        ///Adding CSC Picker Widget in app
                        CSCPicker(
                        ///Enable disable state dropdown [OPTIONAL PARAMETER]
                        showStates: true,

                        /// Enable disable city drop down [OPTIONAL PARAMETER]
                        showCities: true,

                        ///Enable (get flag with country name) / Disable (Disable flag) / ShowInDropdownOnly (display flag in dropdown only) [OPTIONAL PARAMETER]
                        flagState: CountryFlag.DISABLE,

                        ///Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER] (USE with disabledDropdownDecoration)
                        dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            border:
                            Border.all(color: Colors.grey.shade300, width: 1)),

                        ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
                        disabledDropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.grey.shade300,
                            border:
                            Border.all(color: Colors.grey.shade300, width: 1)),

                        ///placeholders for dropdown search field
                        countrySearchPlaceholder: "Country",
                        stateSearchPlaceholder: "State",
                        citySearchPlaceholder: "City",

                        ///labels for dropdown
                        countryDropdownLabel: "*Country",
                        stateDropdownLabel: "*State",
                        cityDropdownLabel: "*City",

                        ///Default Country
                        defaultCountry: DefaultCountry.India,

                        ///Disable country dropdown (Note: use it with default country)
                        disableCountry: true,

                        ///selected item style [OPTIONAL PARAMETER]
                        selectedItemStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),

                        ///DropdownDialog Heading style [OPTIONAL PARAMETER]
                        dropdownHeadingStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),

                        ///DropdownDialog Item style [OPTIONAL PARAMETER]
                        dropdownItemStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),

                        ///Dialog box radius [OPTIONAL PARAMETER]
                        dropdownDialogRadius: 10.0,

                        ///Search bar radius [OPTIONAL PARAMETER]
                        searchBarRadius: 10.0,

                        ///triggers once country selected in dropdown
                        onCountryChanged: (value) {
                          setState(() {
                            ///store value in country variable
                            countryValue = value;
                          });
                        },

                        ///triggers once state selected in dropdown
                        onStateChanged: (value) {
                          setState(() {
                            ///store value in state variable
                            stateValue = value;
                          });
                        },

                        ///triggers once city selected in dropdown
                        onCityChanged: (value) {
                          setState(() {
                            ///store value in city variable
                            cityValue = value;
                          });
                        },
                      ),
                      ]
                    ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: new EnsureVisibleWhenFocused(
                        focusNode: _focusNodePhone,
                        child: TextFormField(
                          scrollPadding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          controller: _phoneTextController,
                          focusNode: _focusNodePhone,
                          keyboardType: TextInputType.text,
                          cursorColor: Colors.black,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.black12),
                                borderRadius: BorderRadius.circular(5)),
                            filled: true,
                            fillColor: Colors.white,
                            //focusColor: Colors.red,
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            labelStyle: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                            labelText: 'Your Phone',
                          ),
                          onSaved: (input) => _phone = input,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: new EnsureVisibleWhenFocused(
                        focusNode: _focusNodeGst,
                        child: TextFormField(
                          scrollPadding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          controller: _gstTextController,
                          focusNode: _focusNodeGst,
                          keyboardType: TextInputType.text,
                          cursorColor: Colors.black,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.black12),
                                borderRadius: BorderRadius.circular(5)),
                            filled: true,
                            fillColor: Colors.white,
                            //focusColor: Colors.red,
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            labelStyle: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                            labelText: 'Your GST',
                          ),
                          onSaved: (input) => _gst = input,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: new EnsureVisibleWhenFocused(
                        focusNode: _focusNodePan,
                        child: TextFormField(
                          scrollPadding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          controller: _panTextController,
                          focusNode: _focusNodePan,
                          keyboardType: TextInputType.text,
                          cursorColor: Colors.black,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.black12),
                                borderRadius: BorderRadius.circular(5)),
                            filled: true,
                            fillColor: Colors.white,
                            //focusColor: Colors.red,
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            labelStyle: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                            labelText: 'Your PAN',
                          ),
                          onSaved: (input) => _pan = input,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: 60,
                      width: 380,
                      decoration: const BoxDecoration(
                        color: Color(0xffF7CC46),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: FlatButton(
                          onPressed: () async {
                            await Future.delayed(const Duration(milliseconds: 200));
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => ProfileView()),
                              (Route<dynamic> route) => false,
                            );
                          },
                          shape: const StadiumBorder(),
                          child: const Text('Save',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700))),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom)),
                  ],
                ),
          ),
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
        all: 1,
        child: buildCircle(
            color: color,
            all: 3,
            child: Image(
              image: AssetImage('assets/images/img_32.png'),
              width: 20,
              height: 20,
            )
            // Icon(
            //   Icons.edit,
            //   color: Colors.white,
            //   size: 20,
            // ),
            ),
      );

  Widget buildCircle({
    @required Widget child,
    @required double all,
    @required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
