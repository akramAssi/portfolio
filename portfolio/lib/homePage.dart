import 'package:flutter/material.dart';
import 'package:portfolio/category_page.dart';
import 'package:portfolio/info_Page.dart';
import 'package:portfolio/model/project.dart';
import 'package:portfolio/profile_page.dart';
import 'package:portfolio/widget/body_text.dart';
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

  void _openProfilePage(BuildContext context,
      {bool fullscreenDialog: false, Widget page}) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => page,
        // builder: (context) => ProfilePage(),
        fullscreenDialog: fullscreenDialog,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List indexList = Iterable<int>.generate(5).toList();
    return Scaffold(
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          // backgroundBlendMode: BlendMode.
          gradient: LinearGradient(
            colors: [
              // Color(0XFF),
              // Color(0XFF),
              // Color(0XFF),
              // Color(0XFF),
              // Color(0XFF),
              // Color(0XFF),
              // Color(0XFF),
              // Color(0XFF),
              // Color(0XFF),
              // Color(0XFF),
              // Color(0XFF),
              // Color(0XFF),
              //green <- blue
              Color(0XFFb2c6de),
              Color(0XFFa0d0ec),
              Color(0XFF87dbf3),
              Color(0XFF6ee6f1),
              Color(0XFF63f0e4),
              Color(0XFF60efd6),
              Color(0XFF63edc7),
              Color(0XFF6aebb7),
              Color(0XFF5ee0ad),
              Color(0XFF53d5a3),
              Color(0XFF46cb99),
              Color(0XFF39c08f),
              //green
              // Color(0XFFb2c6de),
              // Color(0XFFb2cde1),
              // Color(0XFFb4d4e2),
              // Color(0XFFb9dbe3),
              // Color(0XFFc0e1e3),
              // Color(0XFFb7dbdb),
              // Color(0XFFadd5d2),
              // Color(0XFFa5cfc9),
              // Color(0XFF87bcb5),
              // Color(0XFF69aaa2),
              // Color(0XFF49978f),
              // Color(0XFF20857c),
              //blue
              // Color(0XFFb2c6de),
              // Color(0XFFadc9e3),
              // Color(0XFFa8cce7),
              // Color(0XFFa2d0ea),
              // Color(0XFF9bd3ed),
              // Color(0XFF95d6ef),
              // Color(0XFF8fd8f0),
              // Color(0XFF88dbf1),
              // Color(0XFF81def1),
              // Color(0XFF7ae2f0),
              // Color(0XFF74e5ee),
              // Color(0XFF70e8eb),
            ],
          ),
        ),
        child: Row(
          children: [
            Column(
              children: [
                Icon(
                  Icons.ac_unit,
                  color: Colors.white,
                ),
                Text("Profile")
              ],
            ),
            Column(
              children: [
                Icon(
                  Icons.login,
                  color: Colors.white,
                ),
                Text("Login")
              ],
            )
          ],
        ),
      ),
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
                          bodyText(
                            text: "Hi, I’m  Akram Assi ",
                            fontSize: 18,
                          ),
                          bodyText(
                            text:
                                "This is my portfolio, which I use to display projects " +
                                    "during my undergraduate years.",
                            fontSize: 14,
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {
                                _openProfilePage(context,
                                    page: ProfilePage(),
                                    fullscreenDialog: true);
                              },
                              child: bodyText(
                                text: "more -›",
                                fontSize: 12,
                              ),
                            ),
                          ),
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
                      context: context,
                      backgroundColor: AppColor.melonBackground,
                      foregroundColor: AppColor.melonFontcolor,
                    ),
                    buildTypeCard(
                      name: "Mobile",
                      context: context,
                      backgroundColor: AppColor.babyPinkBackground,
                      foregroundColor: AppColor.babyPinkFontcolor,
                    ),
                    buildTypeCard(
                      name: "Desktop",
                      context: context,
                      backgroundColor: AppColor.brightNavyBlueBackground,
                      foregroundColor: AppColor.brightNavyBlueFontcolor,
                    ),
                    buildTypeCard(
                      name: "Script",
                      context: context,
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
                    .map((index) => InkWell(
                          splashColor: AppColor.listBackground[index % 6],
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InfoPage()),
                            );
                          },
                          child: Ink(
                            // alignment: Alignment.bottomCenter,
                            // margin: EdgeInsets.all(20),
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
                            // constraints: BoxConstraints(maxWidth: 366),
                            height: 235,
                            child: Align(
                              alignment: Alignment.bottomCenter,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Entry $index',
                                      style: TextStyle(
                                          color: AppColor
                                              .listForeground[index % 6],
                                          fontSize: 20),
                                    ),
                                    Row(
                                        children: listProject[0]
                                            .technologyStack
                                            .map((image) => Image.asset(
                                                  "images/$image.png",
                                                  height: 30,
                                                ))
                                            .toList()),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ))
                    .toList()
                    .cast<Widget>(),
              ),
              SizedBox(
                height: 30,
              ),
              // Image.asset("images/${listProject[0].technologyStack[0]}.png"),
            ],
          ),
        ),
      ),
    );
  }

  InkWell buildTypeCard(
      {BuildContext context,
      String name,
      Color backgroundColor,
      Color foregroundColor}) {
    return InkWell(
      borderRadius: BorderRadius.circular(25),
      onTap: () {
        _openProfilePage(
          context,
          page: CategoryPage(
            title: name,
          ),
        );
      },
      splashColor: foregroundColor,
      child: Container(
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
                "images/$name.png",
                width: name == "Web"
                    ? 50
                    : name == "Desktop"
                        ? 38
                        : 45,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
