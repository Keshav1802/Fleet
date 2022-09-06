import 'dart:convert';

import 'package:fleetapp/Api/ApiUrl.dart';
import 'package:fleetapp/models/basic_response.dart';
import 'package:fleetapp/registration/registration1.dart';
import 'package:fleetapp/utils/hide_keyboard.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart';

import '../Api/api_service.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  BasicResponse resp;

  String _mobile;
  bool value = false;
  Future<void> _launched;
  final _phoneTextController1 = TextEditingController();

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> generateOtp(String phone) async {
    resp = (await ApiService().generateOtp(phone));
    if(resp.code == 200) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) =>
           RegistrationScreen1(number: phone,)),
            (Route<dynamic> route) => false,
      );
    }
  }

  static String validateMobile(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(patttern);
    if (value.isEmpty) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: Stack(children: <Widget>[
        HideKeyboard(
          child: Column(children: <Widget>[

            Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                color: const Color(0xff010101),
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
                  child: ListTile(
                    leading: Container(
                      padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: 44,
                          minHeight: 44,
                          maxWidth: 54,
                          maxHeight: 54,
                        ),
                        child: Image.asset(
                          'assets/images/img.png',
                          fit: BoxFit.cover,
                          alignment: Alignment.centerRight,
                        ),
                      ),
                    ),
                    title: Text(
                      'EGAL CLUB',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w900,
                          color: Color(0xffF7CC46)),
                      textAlign: TextAlign.left,
                    ),
                    subtitle: Text(
                      'India’s No 1 Truckers Community',
                      style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                      textAlign: TextAlign.left,
                    ),
                  ),
                )),
            const SizedBox(
              height: 25,
            ),
            // E-mail TextField
            Expanded(child: Container(
              // color: Colors.redAccent,
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    Container(
                      height: 30,
                      width: 350,
                      child: const Text(
                        "What’s Your Phone Number?",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: TextFormField(
                        controller: _phoneTextController1,
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.black,
                        style: const TextStyle(color: Colors.black),
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "Enter Phone Number";
                          } else if (value.toString().characters.length != 10) {
                            return "Enter 10 Digit Phone Number";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 20),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(30)),
                          prefixIcon: Image.asset('assets/images/img_1.png'),
                          prefixText: "+91-",
                          filled: true,
                          fillColor: Colors.white,
                          //focusColor: Colors.red,
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10)),
                          labelStyle: const TextStyle(color: Colors.black),
                        ),
                        onSaved: (input) => _mobile = input,
                      ),
                    ),
                    // const Padding(
                    //   padding: EdgeInsets.only(top: 300),
                    // ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          activeColor: Color(0xffF7CC46),
                          value: value,
                          onChanged: (value) {
                            setState(() {
                              this.value = value;
                            });
                          },
                        ),
                        Expanded(
                          child: Wrap(
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text:
                                        "I want to receive updates on WhatsApp/Telegram\nBy signing up, you accept our ",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        )),
                                    TextSpan(
                                        text: "Terms of Use",
                                        style: TextStyle(
                                          color: Colors.blue[600],
                                          decoration: TextDecoration.underline,
                                          fontSize: 15,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            setState(() {
                                              _launched = _launchInBrowser(Uri(
                                                  scheme: 'https',
                                                  host: '',
                                                  path: 'headers/'));
                                            });
                                          }),
                                    TextSpan(
                                        text: " and ",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        )),
                                    TextSpan(
                                        text: "Privacy Policy",
                                        style: TextStyle(
                                          color: Colors.blue[600],
                                          decoration: TextDecoration.underline,
                                          fontSize: 15,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            setState(() {
                                              _launched = _launchInBrowser(Uri(
                                                  scheme: 'https',
                                                  host: '',
                                                  path: 'headers/'));
                                            });
                                          })
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),


                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                    ),

                    //  Sign In button
                    Container(
                      height: 60,
                      width: 380,
                      decoration: const BoxDecoration(
                        color: Color(0xffF7CC46),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: FlatButton(
                          onPressed: () async {
                            if (_phoneTextController1.text.toString() != null &&
                                _phoneTextController1.text.toString().isEmpty) {
                              return _scaffoldKey.currentState.showSnackBar(
                                  new SnackBar(
                                    content: new Text("Enter Phone Number",style: TextStyle(color: Colors.black),),backgroundColor: Color(0xffF7C436),));
                            } else if (_phoneTextController1.text
                                .toString()
                                .characters
                                .length !=
                                10) {
                              return _scaffoldKey.currentState.showSnackBar(
                                  new SnackBar(
                                      content: new Text(
                                          "Enter 10 Digit Phone Number",style: TextStyle(color: Colors.black)),backgroundColor: Color(0xffF7C436)));
                            }
                            if (_formkey.currentState.validate()) {
                              FocusManager.instance.primaryFocus.unfocus();
                            }
                            await Future.delayed(
                                const Duration(milliseconds: 200));
                            generateOtp(_phoneTextController1.text.toString());

                          },
                          shape: const StadiumBorder(),
                          child: const Text('GET STARTED',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700))),
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10))
                  ],
                ),
              ),
            ),
            ),
          ]),
        ),
      ]),
    );
  }
}