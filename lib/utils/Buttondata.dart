import 'package:flutter/material.dart';
// class ButtonData {
//   final String text;
//   final Function() onPressed;
//   final bool isFavorite;
//
//   ButtonData({@required this.text, this.onPressed, this.isFavorite = false});
// }
//
// class MyWidget extends StatelessWidget {
//   const MyWidget(
//       {Key key,
//         @required this.text,
//         @required this.onPressed,
//         this.isFavourte = false})
//       : super(key: key);
//
//   final String text;
//   final Function() onPressed;
//   final bool isFavourte;
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       style: ButtonStyle(
//         shape:MaterialStateProperty.all<StadiumBorder>(StadiumBorder()),
//         backgroundColor: isFavourte
//             ? MaterialStateProperty.all(Color(0xffF7C436))
//             : MaterialStateProperty.all(Color(0xff9F9F9F)),
//       ),
//         // style: ElevatedButton.styleFrom(
//         //   primary: isFavourte ? Colors.red : Colors.green,
//         // ),
//         onPressed: onPressed,
//         child: isFavourte?Text(
//           text,
//           style: TextStyle(
//               color: Colors
//                   .black,
//               fontWeight:
//               FontWeight
//                   .w400,
//               fontSize: 7),
//         ):Text(
//           'Enable Tracking',
//           style: TextStyle(
//               color: Colors
//                   .white,
//               fontWeight:
//               FontWeight
//                   .w400,
//               fontSize: 7),
//         ),
//     );
//   }
// }