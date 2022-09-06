import 'package:fleetapp/screens/home_screen.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<String> title = [
    "Possible fuel wastage detected",
    "Document renewal reminder",
    "New loads available",
    "Share location with customer",
    "Your driver has requested road support",
    "New loads available",
    "FASTag recharge needed",
    "Your monthly khata report is ready",
    "Share location with customer",
    "New loads available",
  ];
  List<String> subtitle = [
    "Check these reasons for fuel wastage detected for truck number CG04LU8513 at around 3:20 PM. ",
    "Your insurance policy for truck number CG04MN4013 is up for renewal on or before 15th Februray 2022. Renew now.",
    "52 new loads available in Raipur for your 5 idle trucks in the next 7 days. Check and bid now.",
    "Your truck number CG04MC8513 was loaded from Krishna Cement. Share current location with customer.",
    "Your truck number CG04MN8513 i broken down near Vizag, AP. Your driver Raghuram is requesting assistance to get the truck fixed.",
    "43 new loads available in Vizag for your 3 idle trucks in the next 15 days. Check and bid now.",
    "Your truck number CG04MN8513 has low FASTag balance. Please recharge now.",
    "Check how did your fleet business operate in December 2021. Detailed report has been emailed to your registered email id.",
    "Your truck number CG04MC8513 was loaded from Krishna Cement. Share current location with customer",
    "43 new loads available in Vizag for your 3 idle trucks in the next 15 days. Check and bid now."
  ];
  List<String> date = [
    "24 Jan 2022  •",
    "22 Jan 2022  •",
    "19 Jan 2022  •",
    "17 Jan 2022  •",
    "09 Jan 2022  •",
    "05 Jan 2022  •",
    "03 Jan 2022  •",
    "01 Jan 2022  •",
    "24 Jan 2022  •",
    "17 Jan 2022  •"
  ];
  List<String> time = [
    " 4:33 PM",
    " 9:00 AM",
    " 10:00 AM",
    " 1:20 PM",
    " 5:40 PM",
    " 9:00 AM",
    " 11:20 AM",
    " 8:00 AM",
    " 10:00 AM",
    " 8:00 AM",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Notifications",
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w300, color: Colors.black),
        ),
      ),
      body: WillPopScope(
        onWillPop: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
              (route) => false);
          return Future.value(false);
        },
        child: Column(
          children: <Widget>[
            const Divider(
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(child: Container(
              // height: 0.865*MediaQuery.of(context).size.height,
              // height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(20, 0, 5, 0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Expanded(
                        child:
                        ListView.separated(
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 0,
                            );
                          },
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Container(
                                    alignment: Alignment.center,
                                    child: Row(
                                      children: <Widget>[
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/img_30.png',
                                            height: 70.0,
                                            width: 60.0,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: 100,
                                            child: Column(
                                              children: <Widget>[
                                                Container(
                                                    width: 300,
                                                    child: Text(
                                                      title[index],
                                                      style: const TextStyle(
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w400),
                                                      textAlign: TextAlign.left,
                                                    )),
                                                const SizedBox(
                                                  height: 2,
                                                ),
                                                Container(
                                                  width: 300,
                                                  child: Text(
                                                    subtitle[index],
                                                    style: const TextStyle(
                                                        fontSize: 10,
                                                        fontWeight: FontWeight.w400),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 2,
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Text(
                                                      date[index],
                                                      style: const TextStyle(
                                                          fontSize: 10,
                                                          fontWeight: FontWeight.w400),
                                                    ),
                                                    Text(
                                                      time[index],
                                                      style: const TextStyle(
                                                          fontSize: 10,
                                                          fontWeight: FontWeight.w400),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          child: const Icon(Icons.more_vert),
                                          onTap: () {},
                                        )
                                      ],
                                    )),
                                const Divider(
                                  thickness: 2,
                                ),
                              ],
                            );
                          },
                        )
                    )
                  ],
                ),
              ),
            )
      )
          ],
        ),
      ),
    );
  }
}
