import 'package:flutter/material.dart';
import 'package:portfolio/res/color.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Image.asset(
            "images/x.png",
            width: 30,
          ),
        ),
        title: Text("SOUQY",
            style: TextStyle(
              color: AppColor.fontColor,
              fontFamily: "ComicSansMS",
              fontSize: 23,
            )),
        backgroundColor: AppColor.background,
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.amber,
        child: Text("sdsd"),
      ),
    );
  }
}
