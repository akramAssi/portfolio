import 'package:flutter/material.dart';
import 'package:portfolio/res/color.dart';

Widget portfolioAppBar(
    {BuildContext context, String title, bool withBackground = true}) {
  return AppBar(
    centerTitle: true,
    elevation: 0,
    // backgroundColor: ,
    backgroundColor:
        withBackground == true ? AppColor.background : Colors.transparent,
    iconTheme: IconThemeData(
      color: AppColor.fontColor, //change your color here
    ),
    leading: context == null
        ? null
        : IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Image.asset(
              "images/x.png",
            ),
          ),
    title: title != null
        ? Text(title,
            style: TextStyle(
              color: AppColor.fontColor,
              fontSize: 23,
            ))
        : null,
  );
}


// AppBar(

//         leading: IconButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           icon: Image.asset(
//             "images/x.png",
//           ),
//         ),

//         title: Text("SOUQY",
//             style: TextStyle(
//               color: AppColor.fontColor,
//               fontSize: 23,
//             )),

//       )

