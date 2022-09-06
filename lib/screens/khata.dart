import 'package:fleetapp/drawer/home_drawer.dart';
import 'package:fleetapp/screens/home_screen.dart';
import 'package:fleetapp/screens/notification.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class KhataPage extends StatefulWidget {
  const KhataPage({Key key}) : super(key: key);

  @override
  State<KhataPage> createState() => _KhataPageState();
}

class _KhataPageState extends State<KhataPage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
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
      body: WillPopScope(
        onWillPop: (){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen()), (route) => false);
          return Future.value(false);
        },
        child: Column(
          children: <Widget>[],
        ),
      ),
    );
  }
}
