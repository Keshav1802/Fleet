import 'package:fleetapp/drawer/home_drawer.dart';
import 'package:fleetapp/screens/community.dart';
import 'package:fleetapp/screens/fleet.dart';
import 'package:fleetapp/screens/home.dart';
import 'package:fleetapp/screens/khata.dart';
import 'package:fleetapp/screens/notification.dart';
import 'package:fleetapp/screens/trips.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedPage = 0;
  String selectedKey = 'Upto 28 days';
  List<Widget> _children;
  PersistentTabController _controller;


  List<Widget> _buildScreens() {
    return [
      Home(),
      KhataPage(),
      TripsPage(),
      FleetPage(),
      CommunityPage()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Image.asset('assets/images/img_14.png'),
        title: ("Home"),
        activeColorPrimary: Color(0xffF7CC46),
        textStyle: TextStyle(color: Colors.black, fontSize: 12)
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset('assets/images/img_15.png'),
        title: ("Khata"),
          activeColorPrimary: Color(0xffF7CC46),
          textStyle: TextStyle(color: Colors.black, fontSize: 12)
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset('assets/images/img_16.png'),
        title: ("Trips"),
          activeColorPrimary: Color(0xffF7CC46),
          textStyle: TextStyle(color: Colors.black, fontSize: 12)
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset('assets/images/img_17.png'),
        title: ("Fleet"),
          activeColorPrimary: Color(0xffF7CC46),
          textStyle: TextStyle(color: Colors.black, fontSize: 12)
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset('assets/images/img_18.png'),
        title: ("Community"),
          activeColorPrimary: Color(0xffF7CC46),
          textStyle: TextStyle(color: Colors.black, fontSize: 12)
      ),
    ];
  }

  final _pageOptions = [
    Home(),
    KhataPage(),
    TripsPage(),
    FleetPage(),
    CommunityPage()
  ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      // backgroundColor: Colors.green,

      margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
      // Default is Colors.white.
      handleAndroidBackButtonPress: true,
      // Default is true.
      resizeToAvoidBottomInset: true,
      // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true,
      // Default is true.
      hideNavigationBarWhenKeyboardShows: true,
      // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        // borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle
          .style3, // Choose the nav bar style with this property.
    );
    //   return AnnotatedRegion<SystemUiOverlayStyle>(
    //     value: SystemUiOverlayStyle(
    //       statusBarColor: Colors.white,
    //     ),
    //     child: Scaffold(
    //       // key: scaffoldKey,
    //       // drawer: Drawer(
    //       //   child: HomeDrawer(),
    //       // ),
    //       // appBar: AppBar(
    //       //   elevation: 0,
    //       //   backgroundColor: Colors.white10,
    //       //   leading: IconButton(
    //       //     icon: Image.asset('assets/images/img.png'),
    //       //     onPressed: () {
    //       //       scaffoldKey.currentState?.openDrawer();
    //       //     },
    //       //     tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
    //       //   ),
    //       //   title: Text(
    //       //     "Mehra Logistics",
    //       //     style: TextStyle(
    //       //         fontSize: 20, fontWeight: FontWeight.w300, color: Colors.black),
    //       //   ),
    //       //   actions: [
    //       //     Row(
    //       //       children: [
    //       //         IconButton(
    //       //           icon: Image.asset(
    //       //             'assets/images/img_12.png',
    //       //             color: Colors.black,
    //       //             height: 25,
    //       //           ),
    //       //           onPressed: () {},
    //       //         ),
    //       //         IconButton(
    //       //           icon: Icon(
    //       //             Icons.notifications,
    //       //             color: Colors.black,
    //       //             size: 30,
    //       //           ),
    //       //           onPressed: () {
    //       //             Navigator.push(
    //       //               context,
    //       //               MaterialPageRoute(
    //       //                   builder: (context) => NotificationScreen()),
    //       //             );
    //       //           },
    //       //         ),
    //       //       ],
    //       //     ),
    //       //   ],
    //       // ),
    //       // bottomNavigationBar: BottomNavigationBar(
    //       //   type: BottomNavigationBarType.fixed,
    //       //   items: [
    //       //     BottomNavigationBarItem(
    //       //         icon: Image.asset(
    //       //           'assets/images/img_14.png',
    //       //           scale: 1.5,
    //       //         ),
    //       //         label: 'Home'),
    //       //     BottomNavigationBarItem(
    //       //         icon: Image.asset(
    //       //           'assets/images/img_15.png',
    //       //           scale: 1.5,
    //       //         ),
    //       //         label: 'Khata'),
    //       //     BottomNavigationBarItem(
    //       //         icon: Image.asset(
    //       //           'assets/images/img_16.png',
    //       //           scale: 1.5,
    //       //         ),
    //       //         label: 'Trips'),
    //       //     BottomNavigationBarItem(
    //       //         icon: Image.asset(
    //       //           'assets/images/img_17.png',
    //       //           scale: 1.5,
    //       //         ),
    //       //         label: 'Fleet'),
    //       //     BottomNavigationBarItem(
    //       //         icon: Image.asset(
    //       //           'assets/images/img_18.png',
    //       //           scale: 1.5,
    //       //         ),
    //       //         label: 'Community'),
    //       //   ],
    //       //   selectedItemColor: Colors.black,
    //       //   elevation: 5.0,
    //       //   unselectedItemColor: Color(0xffF9F9F9),
    //       //   currentIndex: selectedPage,
    //       //   onTap: (index) {
    //       //     setState(() {
    //       //       selectedPage = index;
    //       //     });
    //       //   },
    //       // ),
    //       body: SafeArea(
    //         top: false,
    //         child: IndexedStack(
    //           index: selectedPage,
    //           children: _pageOptions,
    //         ),
    //       )
    //       // _pageOptions[selectedPage],
    //     ),
    //   );
    // }
  }

}
