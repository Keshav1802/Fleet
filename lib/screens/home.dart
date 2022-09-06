import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fleetapp/drawer/home_drawer.dart';
import 'package:fleetapp/screens/notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedValue;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> items = [
    'Last 56 days',
    'Last 84 days',
    'Last 112 days',
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
        statusBarColor: Colors.white,),
      child: Scaffold(
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
          title: Text(
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
                  icon: Icon(
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
        body: Column(
          children: <Widget>[
            Divider(
              thickness: 2,
            ),
            SizedBox(
              height: 21,
            ),
            Container(
              // height: 0.24*MediaQuery.of(context).size.height,
              height: 126,
              // color: Colors.yellow,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  if (index == 0) {
                    var singleChildScrollView = SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                        child: Container(
                          height: 126,
                          child: Row(
                          children: <Widget>[
                            scrollview(context, 'assets/images/img_13.png'),
                            scrollview(context, 'assets/images/img_13.png'),
                            scrollview(context, 'assets/images/img_13.png'),
                          ],
                        ),),
                        scrollDirection: Axis.horizontal);
                    return singleChildScrollView;
                  } else {
                    return new Row(
                      children: <Widget>[
                        scrollview(context, 'assets/images/img_13.png'),
                        scrollview(context, 'assets/images/img_13.png'),
                      ],
                    );
                  }
                },
                itemCount: 1,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              width: 0.96*MediaQuery.of(context).size.width,
              height: 0.35*MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  boxShadow: const [
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
                      SizedBox(width: 14,),
                      Text('Fleet Overview',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),),
                      SizedBox(width: 140,),
                      Container(
                        width: 0.259*MediaQuery.of(context).size.width,
                        height: 0.05*MediaQuery.of(context).size.height,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            hint: Text(
                              'Last 28 days',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Color(0xff000000),
                              ),
                            ),
                            items: items
                                .map((item) =>
                                DropdownMenuItem<String>(
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
                            buttonHeight: 50,
                            buttonWidth: 160,
                            itemHeight: 50,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                          width: 0.5*MediaQuery.of(context).size.width,
                          height: 0.09*MediaQuery.of(context).size.height,
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: ListTile(
                              leading: Container(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
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
                              title: Text(
                                '# Trucks',
                                style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff000000)),
                                textAlign: TextAlign.left,
                              ),
                              subtitle: Text(
                                '15',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff000000)),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          )),
                      Expanded(
                        child: Container(
                            width: 0.55*MediaQuery.of(context).size.width,
                            height: 0.09*MediaQuery.of(context).size.height,
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: ListTile(
                                leading: Container(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
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
                                title: Text(
                                  'Active trips',
                                  style: TextStyle(
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff000000)),
                                  textAlign: TextAlign.left,
                                ),
                                subtitle: Text(
                                  '12',
                                  style: TextStyle(
                                      fontSize: 18.0,
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
                          width: 0.5*MediaQuery.of(context).size.width,
                          height: 0.09*MediaQuery.of(context).size.height,
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: ListTile(
                              leading: Container(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
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
                              title: Text(
                                'Avg Fleet Cost',
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff000000)),
                                textAlign: TextAlign.left,
                              ),
                              subtitle: Text(
                                '₹ 635 /km',
                                style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff000000)),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          )),
                      Expanded(
                        child: Container(
                            width: 0.7*MediaQuery.of(context).size.width,
                            height: 0.09*MediaQuery.of(context).size.height,
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: ListTile(
                                leading: Container(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
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
                                title: Text(
                                  'Avg Mileage',
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff000000)),
                                  textAlign: TextAlign.left,
                                ),
                                subtitle: Text(
                                  '2.35 ltr/km',
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
                          width: 0.5*MediaQuery.of(context).size.width,
                          height: 0.09*MediaQuery.of(context).size.height,
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: ListTile(
                              leading: Container(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
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
                              title: Text(
                                'Avg Idle Time',
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff000000)),
                                textAlign: TextAlign.left,
                              ),
                              subtitle: Text(
                                '7.5 days',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff000000)),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          )),
                      Expanded(
                        child: Container(
                            width: 0.5*MediaQuery.of(context).size.width,
                            height: 0.09*MediaQuery.of(context).size.height,
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: ListTile(
                                leading: Container(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
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
                                title: Text(
                                  'Lost Revenue',
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff000000)),
                                  textAlign: TextAlign.left,
                                ),
                                subtitle: Text(
                                  '₹2,49,538',
                                  style: TextStyle(
                                      fontSize: 18.0,
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
            SizedBox(
              height: 27,
            ),
            Container(
                width: 0.95* MediaQuery.of(context).size.width,
              height: 0.1* MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  boxShadow: const [
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
                        'assets/images/img_19.png',
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
                        'Finding value using this app? Invite your close friends who’ll benefit too.',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
                    ),
                  ),


                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 13, 12, 13),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Color(0xffF7C436)),
                        onPressed: () {},
                        child: const Text('Invite Now',
                          style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.w400),textAlign: TextAlign.left,),
                      ),
                    )

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

Widget scrollview(BuildContext context, String image) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      child: Image.asset(image),
      padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
      // width: 370.0,
      // height: 190.0,
    ),
  );
}

