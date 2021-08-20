import 'package:flutter/material.dart';
import 'package:portfolio/res/color.dart';
import 'package:portfolio/widget/app_bar.dart';
import 'package:portfolio/widget/image_slider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var inputDecoration = InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 19),
      // contentPadding: EdgeInsets.zero,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.melonBackground),
        borderRadius: BorderRadius.circular(20.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.melonBackground),
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
    return Scaffold(
      appBar: portfolioAppBar(context: context, title: "Login"),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("images/logo.png"),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 0),
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Username",
                        style: TextStyle(
                            color: AppColor.melonFontcolor, fontSize: 16),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      TextField(
                        style: TextStyle(
                            color: AppColor.melonFontcolor, fontSize: 17),
                        decoration: inputDecoration,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Password",
                        style: TextStyle(
                            color: AppColor.melonFontcolor, fontSize: 16),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      TextField(
                        obscureText: true,
                        style: TextStyle(
                            color: AppColor.melonFontcolor, fontSize: 17),
                        decoration: inputDecoration,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(14),
                            primary: AppColor.dairyCreamBackground,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onPressed: () {},
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: AppColor.dairyCreamFontcolor,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
