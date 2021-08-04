import 'package:flutter/material.dart';
import 'package:portfolio/model/project.dart';
import 'res/color.dart';

import 'widget/image_slider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);
  final List<Project> listProject = [
    Project(
        images: [
          "https://www.shaadidukaan.com/vogue/wp-content/uploads/2019/08/hug-kiss-images.jpg",
          "https://analyticsindiamag.com/wp-content/uploads/2020/10/7d744a684fe03ebc7e8de545f97739dd.jpg",
          "https://play-lh.googleusercontent.com/qIiIyPtxKc903sdu1fgzU2UgH4Ju3ITY1ViYEu6zy2I3rdS8Q9t64uumt5ZmfZYXKg4=w720-h310-rw",
        ],
        name: "Project1",
        technologyStack: [
          "python",
          "flutter",
          "android",
        ])
  ];

  @override
  Widget build(BuildContext context) {
    final List indexList = Iterable<int>.generate(5).toList();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PortfolioImageSlider(
                imageList: [
                  "https://learn.g2crowd.com/hubfs/What-is-a-tech-stack.png",
                  "https://analyticsindiamag.com/wp-content/uploads/2020/10/7d744a684fe03ebc7e8de545f97739dd.jpg",
                  "https://play-lh.googleusercontent.com/qIiIyPtxKc903sdu1fgzU2UgH4Ju3ITY1ViYEu6zy2I3rdS8Q9t64uumt5ZmfZYXKg4=w720-h310-rw",
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(flex: 2, child: Image.asset("images/actor.png")),
                    Flexible(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text("Hi, I’m  Akram Assi ",
                              style: TextStyle(
                                fontFamily: "ComicSansMS",
                                fontSize: 18,
                              )),
                          Text(
                              "This is my portfolio, which I use to display projects during my undergraduate years.",
                              style: TextStyle(
                                fontFamily: "ComicSansMS",
                                fontSize: 14,
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Wrap(
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
                      name: "Mobile",
                      backgroundColor: AppColor.babyPinkBackground,
                      foregroundColor: AppColor.babyPinkFontcolor,
                    ),
                    buildTypeCard(
                      name: "Desktop",
                      backgroundColor: AppColor.brightNavyBlueBackground,
                      foregroundColor: AppColor.brightNavyBlueFontcolor,
                    ),
                    buildTypeCard(
                      name: "Script",
                      backgroundColor: AppColor.lavenderBlueBackground,
                      foregroundColor: AppColor.lavenderBlueFontcolor,
                    ),
                  ],
                ),
              ),
              Wrap(
                spacing: 25,
                runSpacing: 30,
                alignment: WrapAlignment.center,
                children: indexList
                    .map((index) => Container(
                          alignment: Alignment.bottomCenter,
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    "https://play-lh.googleusercontent.com/qIiIyPtxKc903sdu1fgzU2UgH4Ju3ITY1ViYEu6zy2I3rdS8Q9t64uumt5ZmfZYXKg4=w720-h310-rw",
                                  )),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                              boxShadow: [
                                BoxShadow(
                                    color: AppColor.listBackground[index % 6],
                                    blurRadius: 1,
                                    spreadRadius: .2)
                              ]),
                          width: 366,
                          constraints: BoxConstraints(maxWidth: 366),
                          height: 235,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColor.listBackground[index % 6],
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(25),
                                  bottomRight: Radius.circular(25)),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            height: 50,
                            child: Row(
                              children: [
                                Text(
                                  'Entry $index',
                                  style: TextStyle(
                                      color: AppColor.listForeground[index % 6],
                                      fontFamily: "ComicSansMS",
                                      fontSize: 20),
                                ),
                                Row(
                                  ma
                                    children: listProject[0]
                                        .technologyStack
                                        .map((image) => Image.asset(
                                              "images/$image.png",
                                              width: 30,
                                            ))
                                        .toList()),
                              ],
                            ),
                          ),
                        ))
                    .toList()
                    .cast<Widget>(),
              ),
              // Image.asset("images/${listProject[0].technologyStack[0]}.png"),
            ],
          ),
        ),
      ),
    );
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
              style: TextStyle(
                  color: foregroundColor,
                  fontFamily: "ComicSansMS",
                  fontSize: 20),
            ),
            SizedBox(
              width: 2,
            ),
            Image.asset(
              "images/$name.png",
              width: name == "Desktop" ? 40 : 50,
            ),
          ],
        ),
      ),
    );
  }
}
