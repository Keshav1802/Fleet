import 'package:fleetapp/drawer/home_drawer.dart';
import 'package:fleetapp/screens/community.dart';
import 'package:fleetapp/screens/home.dart';
import 'package:fleetapp/screens/home_screen.dart';
import 'package:fleetapp/screens/khata.dart';
import 'package:fleetapp/screens/my_fleet.dart';
import 'package:fleetapp/screens/notification.dart';
import 'package:fleetapp/screens/trips.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class FleetPage extends StatefulWidget {
  const FleetPage({Key key}) : super(key: key);

  @override
  State<FleetPage> createState() => _FleetPageState();
}

class _FleetPageState extends State<FleetPage> {
  String selectedValue;
  int selectedPage= 0;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> items = [
    'Last 56 days',
    'Last 84 days',
    'Last 112 days',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        child: HomeDrawer(),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        leading: IconButton(
          icon: Image.asset('assets/images/img.png'),
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        ),
        title: const Text(
          "Mehra Logistics",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w300, color: Colors.black),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                icon: Image.asset(
                  'assets/images/img_12.png',
                  color: Colors.black,
                  height: 25,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.black,
                  size: 30,
                ),
                onPressed: () {
                  pushNewScreen(
                    context,
                    screen: NotificationScreen(),
                    withNavBar: false, // OPTIONAL VALUE. True by default.
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                },
              ),
            ],
          ),
        ],
      ),
      body: WillPopScope(
        onWillPop: (){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen()), (route) => false);
          return Future.value(false);
        },
        child: Column(
          children: <Widget>[
            const Divider(
              thickness: 2,
            ),

            Expanded(
              child:
            SingleChildScrollView(
              // reverse: true,
              // child: Container(
              //   height: 30,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 0.95*MediaQuery.of(context).size.width,
                      height: 0.35*MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 0.5),
                              blurRadius: 1.0,
                            ),
                          ]),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              const SizedBox(
                                width: 15,
                              ),
                              const Text(
                                'Fleet Overview',
                                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                              ),
                              const SizedBox(
                                width: 130,
                              ),
                              Container(
                                width: 0.27*MediaQuery.of(context).size.width,
                                height: 0.06*MediaQuery.of(context).size.height,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2(
                                    hint: const Text(
                                      'Last 28 days',
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
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                  width: 0.5 * MediaQuery.of(context).size.width,
                                  height: 0.09*MediaQuery.of(context).size.height,
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: ListTile(
                                      leading: Container(
                                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: ConstrainedBox(
                                          constraints: const BoxConstraints(
                                            minWidth: 33,
                                            minHeight: 33,
                                            maxWidth: 52,
                                            maxHeight: 50,
                                          ),
                                          child: Image.asset(
                                            'assets/images/img_20.png',
                                            fit: BoxFit.cover,
                                            alignment: Alignment.centerRight,
                                          ),
                                        ),
                                      ),
                                      title: const Text(
                                        '# Trucks',
                                        style: TextStyle(
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff000000)),
                                        textAlign: TextAlign.left,
                                      ),
                                      subtitle: const Text(
                                        '15',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff000000)),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  )),
                              Expanded(
                                child: Container(
                                    width: 0.55 * MediaQuery.of(context).size.width,
                                    height: 0.09*MediaQuery.of(context).size.height,
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: ListTile(
                                        leading: Container(
                                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                          child: ConstrainedBox(
                                            constraints: const BoxConstraints(
                                              minWidth: 33,
                                              minHeight: 33,
                                              maxWidth: 52,
                                              maxHeight: 50,
                                            ),
                                            child: Image.asset(
                                              'assets/images/img_21.png',
                                              fit: BoxFit.cover,
                                              alignment: Alignment.centerRight,
                                            ),
                                          ),
                                        ),
                                        title: const Text(
                                          'Active trips',
                                          style: TextStyle(
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff000000)),
                                          textAlign: TextAlign.left,
                                        ),
                                        subtitle: const Text(
                                          '12',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff000000)),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                  width: 0.5 * MediaQuery.of(context).size.width,
                                  height: 0.09*MediaQuery.of(context).size.height,
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: ListTile(
                                      leading: Container(
                                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: ConstrainedBox(
                                          constraints: const BoxConstraints(
                                            minWidth: 33,
                                            minHeight: 33,
                                            maxWidth: 52,
                                            maxHeight: 50,
                                          ),
                                          child: Image.asset(
                                            'assets/images/img_22.png',
                                            fit: BoxFit.cover,
                                            alignment: Alignment.centerRight,
                                          ),
                                        ),
                                      ),
                                      title: const Text(
                                        'Avg Fleet Cost',
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff000000)),
                                        textAlign: TextAlign.left,
                                      ),
                                      subtitle: const Text(
                                        '₹ 635 /km',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff000000)),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  )),
                              Expanded(
                                child: Container(
                                    width: 0.7 * MediaQuery.of(context).size.width,
                                    height: 0.09*MediaQuery.of(context).size.height,
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: ListTile(
                                        leading: Container(
                                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                          child: ConstrainedBox(
                                            constraints: const BoxConstraints(
                                              minWidth: 33,
                                              minHeight: 33,
                                              maxWidth: 52,
                                              maxHeight: 50,
                                            ),
                                            child: Image.asset(
                                              'assets/images/img_23.png',
                                              fit: BoxFit.cover,
                                              alignment: Alignment.centerRight,
                                            ),
                                          ),
                                        ),
                                        title: const Text(
                                          'Avg Mileage',
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff000000)),
                                          textAlign: TextAlign.left,
                                        ),
                                        subtitle: const Text(
                                          '2.35 ltr/km',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff000000)),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                  width: 0.5 * MediaQuery.of(context).size.width,
                                  height: 0.09*MediaQuery.of(context).size.height,
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: ListTile(
                                      leading: Container(
                                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: ConstrainedBox(
                                          constraints: const BoxConstraints(
                                            minWidth: 33,
                                            minHeight: 33,
                                            maxWidth: 52,
                                            maxHeight: 50,
                                          ),
                                          child: Image.asset(
                                            'assets/images/img_24.png',
                                            fit: BoxFit.cover,
                                            alignment: Alignment.centerRight,
                                          ),
                                        ),
                                      ),
                                      title: const Text(
                                        'Avg Idle Time',
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff000000)),
                                        textAlign: TextAlign.left,
                                      ),
                                      subtitle: const Text(
                                        '7.5 days',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff000000)),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  )),
                              Expanded(
                                child: Container(
                                    width: 0.5 * MediaQuery.of(context).size.width,
                                    height: 0.09*MediaQuery.of(context).size.height,
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: ListTile(
                                        leading: Container(
                                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                          child: ConstrainedBox(
                                            constraints: const BoxConstraints(
                                              minWidth: 33,
                                              minHeight: 33,
                                              maxWidth: 52,
                                              maxHeight: 50,
                                            ),
                                            child: Image.asset(
                                              'assets/images/img_25.png',
                                              fit: BoxFit.cover,
                                              alignment: Alignment.centerRight,
                                            ),
                                          ),
                                        ),
                                        title: const Text(
                                          'Lost Revenue',
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff000000)),
                                          textAlign: TextAlign.left,
                                        ),
                                        subtitle: const Text(
                                          '₹2,49,538',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff000000)),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    )),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),



                    Container(
                      width: 0.95*MediaQuery.of(context).size.width,
                      height: 0.26*MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 0.5),
                              blurRadius: 1.0,
                            ),
                          ]),
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                  padding: const EdgeInsets.fromLTRB(9, 16, 0, 24),
                                  child: const Text(
                                    'Manage Fleet',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                                  )
                              )
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                  width: 100,
                                  child: Column(
                                    children: [
                                      Container(
                                        // width: 90,
                                        child: ElevatedButton(
                                            style:
                                            ElevatedButton.styleFrom(primary: Color(0xffF5E8FF)),
                                            onPressed: () {
                                              pushNewScreen(
                                                context,
                                                screen: MyFleet(),
                                                withNavBar: false, // OPTIONAL VALUE. True by default.
                                                pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                              );
                                            },
                                            child: Image(image: AssetImage('assets/images/img_26.png'),fit: BoxFit.cover,width: 90,height: 90,)
                                        )
                                      ),
                                      Container(
                                        padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
                                        child: const Text('My Fleet',style: TextStyle(
                                            fontWeight: FontWeight.w400,fontSize: 14,color: Colors.black
                                        ),),
                                      ),
                                    ],
                                  )
                              ),
                              Container(
                                  width: 100,
                                  child: Column(
                                    children: [
                                      Container(
                                        // width: 100,
                                        child: ElevatedButton(
                                            style:
                                            ElevatedButton.styleFrom(primary: Color(0xffF5E8FF)),
                                            onPressed: () {},
                                            child: Image(image: AssetImage('assets/images/img_27.png'),fit: BoxFit.cover,width: 90,height: 90,)
                                        )
                                      ),
                                      Container(
                                        padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
                                        child: const Text('Add a Truck',style: TextStyle(
                                            fontWeight: FontWeight.w400,fontSize: 14,color: Colors.black
                                        ),),
                                      ),
                                    ],
                                  )
                              ),
                              Container(
                                  width: 100,
                                  child: Column(
                                    children: [
                                      Container(
                                        // width: 90,
                                        child: ElevatedButton(
                                            style:
                                            ElevatedButton.styleFrom(primary: Color(0xffF5E8FF)),
                                            onPressed: () {},
                                            child: Image(image: AssetImage('assets/images/img_28.png'),fit: BoxFit.cover,width: 90,height: 90,)
                                        )
                                      ),
                                      Container(
                                        padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
                                        child: const Text('Fleet Insights',style: TextStyle(
                                            fontWeight: FontWeight.w400,fontSize: 14,color: Colors.black
                                        ),),
                                      ),
                                    ],
                                  )
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),


                    const SizedBox(height: 15,),
                    Container(
                      width: 0.95*MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 0.5),
                              blurRadius: 1.0,
                            ),
                          ]),
                      child:

                      Row(
                        children: <Widget>[
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(12, 13, 0, 13),
                                child: Image.asset(
                                  'assets/images/img_29.png',
                                  fit: BoxFit.cover,
                                  alignment: Alignment.centerRight,
                                ),
                              )
                          ),

                          Expanded(
                            child: Container(
                              padding: EdgeInsets.fromLTRB(9, 16, 14, 16),
                              // width: 0.55* MediaQuery.of(context).size.width,
                              // height: 0.1*MediaQuery.of(context).size.height,
                              alignment: Alignment.center,
                              child: const Text(
                                '5 trucks need an inspection and 2 trucks need preventive maintenance',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),),
                            ),
                          ),


                          Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(0, 13, 12, 13),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(primary: Color(0xffF7C436)),
                                  onPressed: () {},
                                  child: const Text('Visit Workshop',
                                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.w400),textAlign: TextAlign.left,),
                                ),
                              )

                          ),

                        ],
                      ),

                    ),

                    const SizedBox(height: 15,),
                  ],
                )
              // )


            )
            )
          ],
        ),
      ),
    );
  }
}
