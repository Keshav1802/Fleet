import 'package:fleetapp/drawer/home_drawer.dart';
import 'package:fleetapp/screens/home_screen.dart';
import 'package:fleetapp/screens/profile_edit.dart';
import 'package:fleetapp/utils/image_button.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';


class ProfileView extends StatefulWidget {
  const ProfileView({Key key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
                (route) => false);
            return Future.value(false);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
        title: const Text(
          "My Profile",
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w300, color: Colors.black),
        ),
      ),
      body: Column(
        children: <Widget>[
          const Divider(
            thickness: 2,
          ),

          Expanded(
            child:
          SingleChildScrollView(

              child: Column(
                children: [


                  const SizedBox(
                    height: 20,
                  ),



                  Row(
                    children: <Widget>[
                      const SizedBox(
                        width: 20,
                      ),
                      const CircleAvatar(
                        radius: 30, // Image radius
                        backgroundImage: AssetImage('assets/images/img_31.png'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                  width: 400,
                                  child: const Text(
                                    "Mehra Logistics",
                                    style: TextStyle(
                                        fontSize: 18, fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.left,
                                  )),
                              const SizedBox(
                                height: 2,
                              ),
                              Row(
                                children: [
                                  Container(
                                    child: const Text(
                                      "Lakhbir Singh •",
                                      style: TextStyle(
                                          fontSize: 12, fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Container(
                                    child: const Text(
                                      " 7999116499",
                                      style: TextStyle(
                                          fontSize: 12, fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Future.delayed(Duration.zero, () {
                            pushNewScreen(
                              context,
                              screen: ProfileEdit(),
                              withNavBar: false, // OPTIONAL VALUE. True by default.
                              pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                            );
                          });
                        },
                        child: const Image(
                          image: AssetImage('assets/images/img_32.png'),
                          width: 20,
                          height: 20,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const InkWell(
                        child: Image(
                          image: AssetImage('assets/images/img_33.png'),
                          width: 25,
                          height: 20,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  const SizedBox(
                    height: 14,
                  ),


                  Container(
                    padding: const EdgeInsets.fromLTRB(17, 7, 0, 9),
                    width: 0.92 * MediaQuery.of(context).size.width,
                    // height: 0.2 * MediaQuery.of(context).size.height,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              // color: Colors.cyan,

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const Text(
                                      "Your Egal Club Badge",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 14, fontWeight: FontWeight.w400),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      // width: 0.5*MediaQuery.of(context).size.width,
                                      // color: Colors.red,
                                      child: const Text(
                                        "GLOBETROTTER",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontSize: 22, fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: 0.5 * MediaQuery.of(context).size.width,
                                      child: const Text(
                                        "Improve your fleet quality to get \nbetter ratings from customers.",
                                        style: TextStyle(
                                            fontSize: 10, fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        GestureDetector(
                                          child: const Text(
                                            "view details",
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                                decoration: TextDecoration.underline,
                                                color: Colors.black),
                                          ),
                                          onTap: () {},
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        GestureDetector(
                                          child: const Text(
                                            "share",
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                                decoration: TextDecoration.underline,
                                                color: Colors.black),
                                          ),
                                          onTap: () {},
                                        ),
                                      ],
                                    ),

                                    )
                                  ],
                                )
                            )
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(28, 19, 29, 16),
                              // color: Colors.blueAccent,
                              child: const Image(
                                image: AssetImage('assets/images/img_34.png'),
                                // width: 75,
                                height: 95,
                              ),
                            )

                        )
                      ],
                    ),

                  ),

                  const SizedBox(
                    height: 14,
                  ),


                  Container(
                    width: 0.92 * MediaQuery.of(context).size.width,
                    // height: 0.12 * MediaQuery.of(context).size.height,
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
                    child: Row(
                      children: <Widget>[
                        const SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {

                          },
                          child: Container(
                            width: 71, //0.27 * MediaQuery.of(context).size.width,
                            // height: 36, //0.08 * MediaQuery.of(context).size.height,
                            decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0.0, 0.5),
                                    blurRadius: 6.0,
                                  ),
                                ]),
                            child: Expanded(child: Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text(
                                  "ELITE",
                                  style: TextStyle(
                                      fontSize: 9,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                                Container(
                                  padding: const EdgeInsets.fromLTRB(10, 1, 10, 1),
                                  child: const Divider(
                                    thickness: 2,
                                    color: Colors.white,
                                  ),
                                ),
                                const Text(
                                  "₹ 599/year",
                                  style: TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),),
                          ),
                        ),
                        Container(
                          // color: Colors.yellow,
                          padding: const EdgeInsets.fromLTRB(16, 0, 0, 8),
                          // width: 0.54 * MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                // width: 0.6 * MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: const Text(
                                  "Subscription Plan",
                                  style: TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.w500),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                // width: 0.6 * MediaQuery.of(context).size.width,
                                child: Row(
                                  children: <Widget>[
                                    GestureDetector(
                                      child: const Text(
                                        "change plan",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            decoration: TextDecoration.underline,
                                            color: Colors.black),
                                      ),
                                      onTap: () {},
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    GestureDetector(
                                      child: const Text(
                                        "manage payment method",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            decoration: TextDecoration.underline,
                                            color: Colors.black),
                                      ),
                                      onTap: () {},
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),



                  const SizedBox(
                    height: 14,
                  ),
                  Container(
                      width: 0.92 * MediaQuery.of(context).size.width,
                      // height: 0.18 * MediaQuery.of(context).size.height,
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
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                                width: 95,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 65,
                                      child: ElevatedButton(
                                          style:
                                          ElevatedButton.styleFrom(primary: Color(0xfffff3d0)),
                                          onPressed: () {
                                          },
                                          child: Image(image: AssetImage('assets/images/img_35.png'),fit: BoxFit.cover,width: 65,height: 65,)
                                      )
                                    ),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
                                      child: const Text('Business Card', style: TextStyle(
                                          fontWeight: FontWeight.w400,fontSize: 10,color: Colors.black
                                      ),),
                                    ),
                                  ],
                                )
                            ),
                            Container(
                                width: 95,
                                child: Column(
                                  children: [
                                    Container(
                                        width: 65,
                                        child: ElevatedButton(
                                            style:
                                            ElevatedButton.styleFrom(primary: Color(0xfffff3d0)),
                                            onPressed: () {},
                                            child: Image(image: AssetImage('assets/images/img_36.png'),fit: BoxFit.cover,width: 65,height: 65,)
                                        )
                                    ),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
                                      child: const Text('My Routes/Lanes',style: TextStyle(
                                          fontWeight: FontWeight.w400,fontSize: 10,color: Colors.black
                                      ),),
                                    ),
                                  ],
                                )
                            ),
                            Container(
                                width: 95,
                                // height: 65,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 65,
                                      child: ElevatedButton(
                                          style:
                                          ElevatedButton.styleFrom(primary: Color(0xfffff3d0)),
                                          onPressed: () {},
                                          child: Image(image: AssetImage('assets/images/img_37.png'),fit: BoxFit.cover,width: 65,height: 65,)
                                      )
                                    ),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
                                      child: const Text('Manage Team',style: TextStyle(
                                          fontWeight: FontWeight.w400,fontSize: 10,color: Colors.black
                                      ),),
                                    ),
                                  ],
                                )
                            ),
                          ],
                        ),
                      )
                  ),




                  const SizedBox(
                    height: 14,
                  ),
                  Container(
                    width: 0.92 * MediaQuery.of(context).size.width,
                    // height: 0.1 * MediaQuery.of(context).size.height,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(20, 16, 0, 14),
                              child: const Text(
                                'Finding value using this app? Invite your \nclose friends who’ll benefit too.',
                                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                              ),
                            )
                        ),

                        Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              // width: 100,
                              height: 25,
                              padding: EdgeInsets.fromLTRB(15, 0, 18, 0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(primary: Color(0xffF7C436)),
                                onPressed: () {},
                                child: const Text(
                                  'Invite Now',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 11.5,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            )
                        )
                      ],
                    ),
                  ),


                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 0.92 * MediaQuery.of(context).size.width,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        // ImageTextButton(
                        //   onPressed: () {},
                        //   image: const AssetImage('assets/images/img_38.png'),
                        //   text: const Text('Reset Account'),
                        // ),
                        // const SizedBox(
                        //   width: 40,
                        // ),

                        Container(
                          width: 150, //0.38 * MediaQuery.of(context).size.width,
                          height: 42, //0.3 * MediaQuery.of(context).size.height,
                          child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            clipBehavior: Clip.hardEdge,
                            child: InkWell(
                              onTap: () {},
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Ink.image(
                                    image: AssetImage('assets/images/img_38.png'),
                                    height: 22,
                                    width: 22,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(width: 6),
                                  const Text(
                                    'Reset Account',
                                    style: TextStyle(
                                        fontSize: 14, fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(width: 6),
                                ],
                              ),
                            ),
                          ),
                        ),


                        Container(
                          width: 150, //0.38 * MediaQuery.of(context).size.width,
                          height: 42, //0.3 * MediaQuery.of(context).size.height,
                          child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            clipBehavior: Clip.hardEdge,
                            child: InkWell(
                              onTap: () {},
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Ink.image(
                                    image: AssetImage('assets/images/img_39.png'),
                                    height: 22,
                                    width: 22,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(width: 6),
                                  const Text(
                                    'Logout',
                                    style: TextStyle(
                                        fontSize: 14, fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(width: 6),
                                ],
                              ),
                            ),
                          ),
                        ),


                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),






                ],
              )
            )
          )


        ],
      ),
    );
  }
}
