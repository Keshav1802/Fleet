import 'package:fleetapp/screens/community.dart';
import 'package:fleetapp/screens/fleet.dart';
import 'package:fleetapp/screens/home_screen.dart';
import 'package:fleetapp/screens/khata.dart';
import 'package:fleetapp/screens/profile_view.dart';
import 'package:fleetapp/routes/routes.dart';
import 'package:fleetapp/screens/trips.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class HomeDrawer extends StatefulWidget {
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        children: <Widget>[
          Column(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                  height: 150,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: GestureDetector(
                      onTap: (){ pushNewScreen(
                        context,
                        screen: ProfileView(),
                        withNavBar: false, // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation: PageTransitionAnimation.cupertino,
                      );},
                      child: Row(
                        children: [
                          Container(
                            width: 250,
                            // color: Colors.cyan,
                            child: ListTile(
                              leading: Container(
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    minWidth: 33,
                                    minHeight: 33,
                                    maxWidth: 44,
                                    maxHeight: 44,
                                  ),
                                  child: Image.asset(
                                    'assets/images/img_2.png',
                                    fit: BoxFit.cover,
                                    alignment: Alignment.centerRight,
                                  ),
                                ),
                              ),
                              title: Text(
                                'Mehra Logistics',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                                textAlign: TextAlign.left,
                              ),
                              subtitle: Row(
                                children: [
                                  Text(
                                    'Lakhbir Singh •  ',
                                    style: TextStyle(
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    '7999116499',
                                    style: TextStyle(
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                    textAlign: TextAlign.left,
                                  )
                                ],
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                pushNewScreen(
                                  context,
                                  screen: ProfileView(),
                                  withNavBar: false, // OPTIONAL VALUE. True by default.
                                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                );
                                // Navigator.push(context,  MaterialPageRoute(builder: (context) => ProfileView()));

                                // Navigator.of(context, rootNavigator: true).pushReplacement(MaterialPageRoute(builder: (context) => new ProfileView()));
                              }, icon: Icon(Icons.arrow_forward_ios))
                        ],
                      ),
                    ),
                  )),
              Divider(
                thickness: 2,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
            linkMenuDrawer(context, "My Fleet", "assets/images/img_3.png"),
            SizedBox(
              height: 10,
            ),
            linkMenuDrawer(context, 'Khata', "assets/images/img_4.png"),
            SizedBox(
              height: 10,
            ),
            linkMenuDrawer(context, 'Trips', "assets/images/img_5.png"),
            SizedBox(
              height: 10,
            ),
            linkMenuDrawer(context, 'Ustaads', "assets/images/img_6.png"),
            SizedBox(
              height: 10,
            ),
            linkMenuDrawer(context, 'Partners', "assets/images/img_7.png"),
            SizedBox(
              height: 10,
            ),
            linkMenuDrawer(context, 'Market', "assets/images/img_8.png"),
            SizedBox(
              height: 10,
            ),
            linkMenuDrawer(context, 'Community', "assets/images/img_9.png"),
            SizedBox(
              height: 10,
            ),
            linkMenuDrawer(context, 'Support & Help', "assets/images/img_10.png"),
            SizedBox(
              height: 10,
            ),
            linkMenuDrawer(context, 'Settings', "assets/images/img_11.png"),
          ]),
          SizedBox(
            height: 95,
          ),
          Divider(
            thickness: 2,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              child: Row(
            children: <Widget>[
              SizedBox(
                width: 10,
              ),
              Text(
                '© EgalClub Solutions Pvt Ltd',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 50,
              ),
              Text(
                'v Alpha.',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          )),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

Widget linkMenuDrawer(BuildContext context, String title, String image) {
  return InkWell(
    onTap: () {
      Future.delayed(Duration.zero, () {
        openDrawerItems(context, title);
      });
    },
  // return ElevatedButton(
  //   onPressed: () {
  //     Future.delayed(Duration.zero, () {
  //       openDrawerItems(context, title);
  //     });
  //   },
    child: Container(
      width: 300,
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 1,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 22,
                minHeight: 22,
                maxWidth: 33,
                maxHeight: 33,
              ),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                alignment: Alignment.centerRight,
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    ),
  );
}

void openDrawerItems(BuildContext context, String DrawerItemName) {
  final List<String> arr_drawer_items = [
    'My Fleet',
    'Khata',
    'Trips',
    'Ustaads',
    'Partners',
    'Market',
    'Community',
    'Support & Help',
    'Settings'
  ];
  if ("My Fleet".toLowerCase() == DrawerItemName.toLowerCase()) {
    Future.delayed(Duration.zero, () {
      pushNewScreen(
        context,
        screen: FleetPage(),
        withNavBar: true, // OPTIONAL VALUE. True by default.
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
      // Navigator.of(context,rootNavigator: false).pushNamed('/fleet');
      print('Tapped');
    });
  } else if ("Khata".toLowerCase() == DrawerItemName.toLowerCase()) {
    Future.delayed(Duration.zero, () {
      pushNewScreen(
        context,
        screen: KhataPage(),
        withNavBar: true, // OPTIONAL VALUE. True by default.
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
      print('Tapped');
    });
  } else if ("Trips".toLowerCase() == DrawerItemName.toLowerCase()) {
    Future.delayed(Duration.zero, () {
      pushNewScreen(
        context,
        screen: TripsPage(),
        withNavBar: true, // OPTIONAL VALUE. True by default.
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
      print('Tapped');
    });
  } else if ("Ustaads".toLowerCase() == DrawerItemName.toLowerCase()) {
    Future.delayed(Duration.zero, () {
      // Navigator.of(context).push(MaterialPageRoute(
      //     builder: (BuildContext context) => ProfileWidget()));
      print('Tapped');
    });
  } else if ("Partners".toLowerCase() == DrawerItemName.toLowerCase()) {
    Future.delayed(Duration.zero, () {
      // Navigator.of(context).push(MaterialPageRoute(
      //     builder: (BuildContext context) => ProfileWidget()));
      print('Tapped');
    });
  } else if ("Market".toLowerCase() == DrawerItemName.toLowerCase()) {
    Future.delayed(Duration.zero, () {
      // Navigator.of(context).push(MaterialPageRoute(
      //     builder: (BuildContext context) => ProfileWidget()));
      print('Tapped');
    });
  } else if ("Community".toLowerCase() == DrawerItemName.toLowerCase()) {
    Future.delayed(Duration.zero, () {
      pushNewScreen(
        context,
        screen: CommunityPage(),
        withNavBar: true, // OPTIONAL VALUE. True by default.
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
      print('Tapped');
    });
  } else if ("Support & Help".toLowerCase() == DrawerItemName.toLowerCase()) {
    Future.delayed(Duration.zero, () {
      // Navigator.of(context).push(MaterialPageRoute(
      //     builder: (BuildContext context) => ProfileWidget()));
      print('Tapped');
    });
  } else if ("Settings".toLowerCase() == DrawerItemName.toLowerCase()) {
    Future.delayed(Duration.zero, () {
      // Navigator.of(context).push(MaterialPageRoute(
      //     builder: (BuildContext context) => ProfileWidget()));
      print('Tapped');
    });
  }
}
