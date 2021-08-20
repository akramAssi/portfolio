import 'package:flutter/material.dart';
import 'package:portfolio/res/color.dart';
import 'package:portfolio/widget/app_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: portfolioAppBar(context: context, withBackground: false),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Image.asset("images/actor@X2.png"),
              SizedBox(
                height: 55,
              ),
              Text(
                "My name is Akram Assi",
                style: TextStyle(
                  color: AppColor.fontColor,
                  fontSize: 18,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Text(
                  "I graduated from Najah University with a bachelor’s degree in computer science and currently reside in Nablus, Palestine. This application was made to show off the skills I learned during my studies.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.fontColor,
                    fontSize: 16,
                  ),
                ),
              ),
              Wrap(
                spacing: 25,
                runSpacing: 30,
                alignment: WrapAlignment.center,
                children: [
                  buildTypeCard(
                    name: "Web",
                    backgroundColor: AppColor.melonBackground,
                    foregroundColor: AppColor.melonFontcolor,
                  ),
                  buildTypeCard(
                    name: "Android",
                    backgroundColor: AppColor.opalBackground,
                    foregroundColor: AppColor.opalFontcolor,
                  ),
                  buildTypeCard(
                    name: "Flutter",
                    backgroundColor: AppColor.brightNavyBlueBackground,
                    foregroundColor: AppColor.brightNavyBlueFontcolor,
                  ),
                  buildTypeCard(
                    name: "Python",
                    backgroundColor: AppColor.lavenderBlueBackground,
                    foregroundColor: AppColor.lavenderBlueFontcolor,
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "contact",
                style: TextStyle(color: AppColor.fontColor, fontSize: 17),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Email: akram-20002010@gmail.com",
                style: TextStyle(color: AppColor.fontColor, fontSize: 15),
              ),
              SizedBox(
                height: 20,
              ),
              Wrap(
                // spacing: 20,
                runSpacing: 25,
                alignment: WrapAlignment.center,
                children: [
                  buildContectCard("AkramAssi", "facebook", Colors.blue[400]),
                  buildContectCard(
                      "AkramAssi", "linkedin", Colors.blueGrey[700]),
                  buildContectCard("AkramAssi", "github", Colors.black),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  TextButton buildContectCard(String name, String Platform, Color primary) {
    return TextButton.icon(
        style: TextButton.styleFrom(primary: primary),
        onPressed: () {},
        icon: Image.asset(
          "images/$Platform.png",
          width: 25,
        ),
        // icon: Icon(Icons.android),
        label: Text(
          name,
          style: TextStyle(fontSize: 15, color: AppColor.fontColor),
        ));
  }

  Container buildTypeCard(
      {String name, Color backgroundColor, Color foregroundColor}) {
    return Container(
      width: 170,
      height: 90,
      constraints: BoxConstraints(maxWidth: 183),
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(25))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              name,
              style: TextStyle(color: foregroundColor, fontSize: 20),
            ),
            SizedBox(
              width: 2,
            ),
            Image.asset(
              "images/$name@X2.png",
              height: 50,
              // width: name == "Web"
              //     ? 50
              //     : name == "Desktop"
              //         ? 38
              //         : 45,
            ),
          ],
        ),
      ),
    );
  }
}
