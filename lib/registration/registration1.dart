import 'package:fleetapp/models/auth_response.dart';
import 'package:fleetapp/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../Api/api_service.dart';

class RegistrationScreen1 extends StatefulWidget {
  String number;
  RegistrationScreen1({Key key, this.number}) : super(key: key);

  @override
  State<RegistrationScreen1> createState() => _RegistrationScreen1State();
}

class _RegistrationScreen1State extends State<RegistrationScreen1> {
  final TextEditingController _phonenumber = TextEditingController();
  final  TextEditingController _otpController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _validate = false;
  AuthResponse resp;

  Future<void> authenticate(String otp) async {
    resp = (await ApiService().authenticate(widget.number, otp));
    if(resp.code == 200) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) =>  HomeScreen()));
    }
  }



  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return WillPopScope(
      child: Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        body: Center(
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

            const Padding(
              padding: EdgeInsets.all(20),
            ),
            Container(
                height: 30,
                width: 350,
                child:  Text(
                  'Enter the OTP you’ve received via SMS',
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                )),

            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child:  PinCodeTextField(
                keyboardType: TextInputType.numberWithOptions(),
                appContext: context,
                controller: _otpController,
                length: 6,
                animationType: AnimationType.slide,
                onChanged: (String value) {},
                cursorColor: Color(0xffF3F3F3),
                textStyle: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderWidth: 0,
                  disabledColor: Theme.of(context).iconTheme.color,
                  activeColor:Theme.of(context).iconTheme.color,
                  inactiveColor: Theme.of(context).iconTheme.color,
                  selectedColor:Theme.of(context).iconTheme.color,
                ),
              ),
            ),
            Container(
              width: 450,
              padding: EdgeInsets.fromLTRB(0, 0, 120, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  const Text(
                    'Didn’t recieve OTP? ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16.0, color: Colors.black),
                  ),
                  const SizedBox(width:10),
                  GestureDetector(
                    onTap: (){

                    },
                    child: const Text(
                      'Resend Now',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 16.0, color: Color(0xffa37edc)),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              height: 60,
              width: 380,
              decoration: const BoxDecoration(
                color: Color(0xffF7CC46),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: FlatButton(
                shape: const StadiumBorder(),
                onPressed: () async{
                  if (_otpController.text.toString() != null &&
                      _otpController.text.toString().isEmpty) {
                    return _scaffoldKey.currentState.showSnackBar(
                        new SnackBar(
                          content: new Text("Enter the OTP received",style: TextStyle(color: Colors.black),),backgroundColor: Color(0xffF7C436),));
                  } else if (_otpController.text
                      .toString()
                      .characters
                      .length !=
                      6) {
                    return _scaffoldKey.currentState.showSnackBar(
                        new SnackBar(
                            content: new Text(
                                "Enter the 6 digit OTP",style: TextStyle(color: Colors.black)),backgroundColor: Color(0xffF7C436)));
                  }
                  await Future.delayed(Duration(milliseconds: 200));
                  authenticate(_otpController.text.toString());
                },
                child: const Text('GET STARTED',
                    style: TextStyle(color: Colors.black, fontSize: 30)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
            ),

          ]),
        ),
      ),
    );
  }
}