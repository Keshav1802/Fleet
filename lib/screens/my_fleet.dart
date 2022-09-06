import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fleetapp/screens/addtruck.dart';
import 'package:fleetapp/screens/fleet.dart';
import 'package:fleetapp/utils/Buttondata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class MyFleet extends StatefulWidget {
  const MyFleet({Key key}) : super(key: key);

  @override
  State<MyFleet> createState() => _MyFleetState();
}

class _MyFleetState extends State<MyFleet> {
  TextEditingController _searchTextController = TextEditingController();
  String selectedValue;
  List<Map> buttonList = [
    {
      'label': 'Raipur CG, 24 hrs ago',
      'active': true,
    },
    {
      'label': 'Mumbai MH, 30 mins ago',
      'active': true,
    },
    {
      'label': 'Raipur CG, 24 hrs ago',
      'active': true,
    },
    {
      'label': 'Raipur CG, 24 hrs ago',
      'active': true,
    },
    {
      'label': 'Raipur CG, 24 hrs ago',
      'active': true,
    },
    {
      'label': 'Mumbai MH, 30 mins ago',
      'active': true,
    },
    {
      'label': 'Mumbai MH, 30 mins ago',
      'active': true,
    },
    {
      'label': 'Mumbai MH, 30 mins ago',
      'active': true,
    },
    {
      'label': 'Mumbai MH, 30 mins ago',
      'active': true,
    },
    {
      'label': 'Raipur CG, 24 hrs ago',
      'active': true,
    },
  ];
  List<String> items = [
    'Filter : All Trucks',
    'Filter : 10 Trucks',
    'Filter : 20 Trucks',
  ];
  List<String> truckNumber = [
    'CG04MC8513',
    'CG04MC8513',
    'CG04MN4013',
    'KL07LP6713',
    'KL07LP6713',
    'KL07LP6713',
    'KL07LP6713',
    'KL07LP6713',
    'KL07LP6713',
    'KL07LP6713',
  ];
  List<String> truckStatus = [
    'On Trip  • ',
    'Idle  • ',
    'Scheduled  • ',
    'Loading  • ',
    'Loading  • ',
    'Loading  • ',
    'Loading  • ',
    'Loading  • ',
    'Loading  • ',
    'Loading  • ',
  ];
  List<String> truckFuel = [
    'Diesel: 60/350 ltr  • ',
    'Diesel: Unknown  • ',
    ' Diesel: 40/360 ltr  •',
    ' Diesel: 323/360 ltr  •',
    ' Diesel: 323/360 ltr  •',
    ' Diesel: 323/360 ltr  •',
    ' Diesel: 323/360 ltr  •',
    ' Diesel: 323/360 ltr  •',
    ' Diesel: 323/360 ltr  •',
    ' Diesel: 323/360 ltr  •',
  ];
  List<String> truckOwner = [
    'Ramprasad',
    'Shiva',
    '  Naresh',
    '  Tiju',
    '  Tiju',
    '  Tiju',
    '  Tiju',
    '  Tiju',
    '  Tiju',
    '  Tiju',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        actions: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xffF7C436)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.elliptical(60, 40)),
                  side: BorderSide(
                    color: Color(0xffF7C436),
                    width: 5.0,
                  ),
                ),
              ),
            ),
            child: Image.asset(
              'assets/images/img_41.png',
              color: Colors.black,
              height: 25,
            ),
            onPressed: () {
              pushNewScreen(
                context,
                screen: AddTruck(),
                withNavBar: false, // OPTIONAL VALUE. True by default.
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            },
          ),
          SizedBox(
            width: 10,
          ),
        ],
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
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Showing" + " 25" + " of" + " 25" + " trucks",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: 15,
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    buttonPadding: EdgeInsets.fromLTRB(7, 0, 0, 0),
                    dropdownWidth: 130,
                    buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Color(0xffF7C436)),
                    dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Color(0xffF7C436)),
                    hint: Text(
                      'Filter : All Trucks',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xff000000),
                      ),
                    ),
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value as String;
                      });
                    },
                    buttonHeight: 20,
                    buttonWidth: 120,
                    itemHeight: 30,
                  ),
                ),
                // ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: (){

                  },
                  child: Container(
                    width: 0.32 * MediaQuery.of(context).size.width,
                    height: 0.03 * MediaQuery.of(context).size.height,
                    child: TextField(
                      controller: _searchTextController,
                      keyboardType: TextInputType.text,
                      showCursor: true,
                      cursorColor: Colors.black,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
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
                            fontSize: 8.5),
                        labelText: 'Search Truck #',
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 0.8 * MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
              child: Column(
                children: [
                  Expanded(
                      child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 0,
                            );
                          },
                          itemCount: truckNumber.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Container(
                                    alignment: Alignment.center,
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/img_42.png',
                                            height: 60.0,
                                            width: 60.0,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: 120,
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                        child: Text(
                                                      truckNumber[index],
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      textAlign: TextAlign.left,
                                                    )),
                                                    SizedBox(
                                                      width: 7,
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        truckStatus[index],
                                                        style: TextStyle(
                                                            fontSize: 9,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 1,
                                                    ),
                                                    Container(
                                                        child: Text(
                                                      truckFuel[index],
                                                      style: TextStyle(
                                                          fontSize: 9,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      textAlign: TextAlign.left,
                                                    )),
                                                    SizedBox(
                                                      width: 1,
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        truckOwner[index],
                                                        style: TextStyle(
                                                            fontSize: 9,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      width: 0.25 *
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      height: 0.03 *
                                                          MediaQuery.of(context)
                                                              .size
                                                              .height,
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          20)),
                                                          color: buttonList[
                                                                      index]
                                                                  ['active']
                                                              ? Color(
                                                                  0xffF7C436)
                                                              : Color(
                                                                  0xff9F9F9F)),
                                                      child: buttonList[index]
                                                              ['active']
                                                          ? Text(
                                                              buttonList[index]
                                                                  ['label'],
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 8),
                                                            )
                                                          : Text(
                                                              'Enable Tracking',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 8),
                                                            ),
                                                      // child: ElevatedButton(
                                                      //   onPressed: () => onPressed(buttonList[index]),
                                                      //   style: ButtonStyle(
                                                      //     shape:MaterialStateProperty.all<StadiumBorder>(StadiumBorder()),
                                                      //     backgroundColor: buttonList[index]['active']
                                                      //         ? MaterialStateProperty.all(Color(0xffF7C436))
                                                      //         : MaterialStateProperty.all(Color(0xff9F9F9F)),
                                                      //   ),
                                                      //   child: buttonList[index]
                                                      //           ['active']
                                                      //       ? Text(
                                                      //           buttonList[index]
                                                      //               ['label'],
                                                      //           style: TextStyle(
                                                      //               color: Colors
                                                      //                   .black,
                                                      //               fontWeight:
                                                      //                   FontWeight
                                                      //                       .w400,
                                                      //               fontSize: 7),
                                                      //         )
                                                      //       : Text(
                                                      //           'Enable Tracking',
                                                      //           style: TextStyle(
                                                      //               color: Colors
                                                      //                   .white,
                                                      //               fontWeight:
                                                      //                   FontWeight
                                                      //                       .w400,
                                                      //               fontSize: 7),
                                                      //         ),
                                                      // ),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Container(
                                                      width: 0.20 *
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      height: 0.03 *
                                                          MediaQuery.of(context)
                                                              .size
                                                              .height,
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          20)),
                                                          color: buttonList[
                                                                      index]
                                                                  ['active']
                                                              ? Color(
                                                                  0xffF7C436)
                                                              : Color(
                                                                  0xff9F9F9F)),
                                                      child: buttonList[index]
                                                              ['active']
                                                          ? Text(
                                                              'Recharge FASTag',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 8),
                                                            )
                                                          : Text(
                                                              'Buy FASTag',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 8),
                                                            ),
                                                      // ElevatedButton(
                                                      //   onPressed: ()  => onPressed(buttonList[index]),
                                                      //   style: ButtonStyle(
                                                      //     shape:MaterialStateProperty.all<StadiumBorder>(StadiumBorder()),
                                                      //     backgroundColor: buttonList[index]['active']
                                                      //         ? MaterialStateProperty.all(Color(0xffF7C436))
                                                      //         : MaterialStateProperty.all(Color(0xff9F9F9F)),
                                                      //   ),
                                                      //   child: buttonList[index]
                                                      //   ['active']
                                                      //       ? Text(
                                                      //     'Recharge FASTag',
                                                      //     style: TextStyle(
                                                      //         color: Colors
                                                      //             .black,
                                                      //         fontWeight:
                                                      //         FontWeight
                                                      //             .w400,
                                                      //         fontSize: 7),
                                                      //   )
                                                      //       : Text(
                                                      //     'Buy FASTag',
                                                      //     style: TextStyle(
                                                      //         color: Colors
                                                      //             .white,
                                                      //         fontWeight:
                                                      //         FontWeight
                                                      //             .w400,
                                                      //         fontSize: 7),
                                                      //   ),
                                                      // ),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        onPressed(
                                                            buttonList[index]);
                                                      },
                                                      child: Container(
                                                        width: 0.17 *
                                                            MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width,
                                                        height: 0.03 *
                                                            MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height,
                                                        alignment:
                                                            Alignment.center,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20)),
                                                            color: buttonList[
                                                                        index]
                                                                    ['active']
                                                                ? Color(
                                                                    0xffF7C436)
                                                                : Color(
                                                                    0xff9F9F9F)),
                                                        child: buttonList[index]
                                                                ['active']
                                                            ? Text(
                                                                'Refuel',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        8),
                                                              )
                                                            : Text(
                                                                'Install Fuel Sensor',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        7),
                                                              ),
                                                        // ElevatedButton(
                                                        //   onPressed: () => onPressed(buttonList[index]),
                                                        //   style: ButtonStyle(
                                                        //     shape:MaterialStateProperty.all<StadiumBorder>(StadiumBorder()),
                                                        //     backgroundColor: buttonList[index]['active']
                                                        //         ? MaterialStateProperty.all(Color(0xffF7C436))
                                                        //         : MaterialStateProperty.all(Color(0xff9F9F9F)),
                                                        //   ),
                                                        //   child: buttonList[index]
                                                        //   ['active']
                                                        //       ? Text(
                                                        //     'Refuel',
                                                        //     style: TextStyle(
                                                        //         color: Colors
                                                        //             .black,
                                                        //         fontWeight:
                                                        //         FontWeight
                                                        //             .w400,
                                                        //         fontSize: 7),
                                                        //   )
                                                        //       : Text(
                                                        //     'Install Fuel Sensor',
                                                        //     style: TextStyle(
                                                        //         color: Colors
                                                        //             .white,
                                                        //         fontWeight:
                                                        //         FontWeight
                                                        //             .w400,
                                                        //         fontSize: 7),
                                                        //   ),
                                                        // ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                          ),
                                          onTap: () {},
                                        )
                                      ],
                                    )),
                                Divider(
                                  thickness: 2,
                                ),
                              ],
                            );
                          }))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void onPressed(Map button) {
    setState(() {
      for (var element in buttonList) {
        element['active'] = false;
      }
      button['active'] = true;
    });
  }
}

class ButtonData {
  final String text;
  final Function() onPressed;
  final bool isFavorite;

  ButtonData({@required this.text, this.onPressed, this.isFavorite = false});
}

class MyWidget extends StatelessWidget {
  const MyWidget(
      {Key key,
      @required this.text,
      @required this.onPressed,
      this.isFavourte = false})
      : super(key: key);

  final String text;
  final Function() onPressed;
  final bool isFavourte;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<StadiumBorder>(StadiumBorder()),
        backgroundColor: isFavourte
            ? MaterialStateProperty.all(Color(0xffF7C436))
            : MaterialStateProperty.all(Color(0xff9F9F9F)),
      ),
      // style: ElevatedButton.styleFrom(
      //   primary: isFavourte ? Colors.red : Colors.green,
      // ),
      onPressed: onPressed,
      child: isFavourte
          ? Text(
              text,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 7),
            )
          : Text(
              'Enable Tracking',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 7),
            ),
    );
  }
}
