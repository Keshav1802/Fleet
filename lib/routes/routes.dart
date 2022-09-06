

import 'package:fleetapp/screens/fleet.dart';
import 'package:fleetapp/utils/base.dart';
import 'package:flutter/cupertino.dart';


class Routes {
  Routes._();

  // static const splashScreen = '/splash-screen';
  static const fleet = '/fleet';
  // static const intro = '/intro';
  // static const signup = '/signup';
  // static const forgotpassword = "/forgotpassword";
  // static const home = "/home";
  // static const profile = "/profile";
  // static const mytrips = "/mytrips";
  // static const payment = "/payment";
  // static const promocode = "/promo";
  // static const notification="/notification";

  static Map<String, WidgetBuilder> get buildRoutes {
    return {
    //   splashScreen: (BuildContext context) =>
    // const BaseLayout(page: SplashScreen(), isAppBar: false,),
      fleet: (BuildContext context) =>
       BaseLayout(page: FleetPage(), isAppBar:false,),
      // signup: (BuildContext context) =>
      // const BaseLayout(page: SignupScreen(), isAppBar: false,),
      // forgotpassword: (BuildContext context) =>
      // const BaseLayout(page: ForgotPasswordScreen(), isAppBar: false,),
      // home: (BuildContext context) =>
      // const BaseLayout(page: HomeScreen(), isAppBar: false,),
      // profile: (BuildContext context) =>
      // const BaseLayout(page: HomeScreen(), isAppBar: false,),
      // mytrips: (BuildContext context) =>
      // const BaseLayout(page: HomeScreen(), isAppBar: false,),
      // payment: (BuildContext context) =>
      // const BaseLayout(page: HomeScreen(), isAppBar: false,),
      // promocode: (BuildContext context) =>
      // const BaseLayout(page: HomeScreen(), isAppBar: false,),
      // notification: (BuildContext context) =>
      // const BaseLayout(page: NotificationScreen(), isAppBar: false,)
    };
  }
}