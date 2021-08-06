import 'package:flutter/material.dart';
import 'package:portfolio/res/color.dart';

import 'image_slider.dart';

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
          ),
        ),
        elevation: 0,
        title: Text("SOUQY",
            style: TextStyle(
              color: AppColor.fontColor,
              fontSize: 23,
            )),
        backgroundColor: AppColor.background,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 5,
            ),
            PortfolioImageSlider(
              imageList: [
                "https://learn.g2crowd.com/hubfs/What-is-a-tech-stack.png",
                "https://analyticsindiamag.com/wp-content/uploads/2020/10/7d744a684fe03ebc7e8de545f97739dd.jpg",
                "https://play-lh.googleusercontent.com/qIiIyPtxKc903sdu1fgzU2UgH4Ju3ITY1ViYEu6zy2I3rdS8Q9t64uumt5ZmfZYXKg4=w720-h310-rw",
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "SOUQY",
                        style: TextStyle(
                          color: AppColor.fontColor,
                          fontSize: 25,
                        ),
                      ),
                      TextButton(
                          style: TextButton.styleFrom(
                            primary: AppColor.fontColor,
                          ),
                          onPressed: () {},
                          child: Row(
                            children: [
                              Text(
                                "Source code",
                                style: TextStyle(
                                    color: AppColor.fontColor, fontSize: 17),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Image.asset("images/github.png")
                            ],
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  ///
                  ///end row project name and source code icon
                  ///
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Text messaging templates provide pre-set text that can be used to quickly send common text messages without typing the message itself. For example, if you are “running late” or “in a meeting”, this feature lets you send those replies simply by choosing them from a menu, instead of typing out the whole phrase.",
                      style: TextStyle(color: AppColor.fontColor, fontSize: 15),
                    ),
                  ),

                  ///
                  ///end  descrip text for project
                  ///
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}