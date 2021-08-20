import 'package:flutter/material.dart';
import 'package:portfolio/main_pages/category_page.dart';
import 'package:portfolio/main_pages/info_Page.dart';
import 'package:portfolio/main_pages/login_page.dart';
import 'package:portfolio/model/project.dart';
import 'package:portfolio/main_pages/profile_page.dart';
import 'package:portfolio/widget/body_text.dart';
import 'package:portfolio/widget/scroll_to_hide_widget.dart';
import '../res/color.dart';
import '../widget/image_slider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  ScrollController controller;
  @override
  void initState() {
    super.initState();

    controller = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void _openProfilePage({bool fullscreenDialog: false, Widget page}) {
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
    final List indexList = Iterable<int>.generate(10).toList();
    return Scaffold(
      bottomNavigationBar: ScrollToHideWidget(
        controller: controller,
        child: Container(
          color: Colors.transparent,
          alignment: Alignment.bottomCenter,
          child: Container(
            // constraints: BoxConstraints(maxWidth: 300, minWidth: 300),
            height: 56,
            width: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25), topLeft: Radius.circular(25)),
              // backgroundBlendMode: BlendMode.
              color: AppColor.opalBackground,
              // gradient: LinearGradient(
              //   begin: Alignment.bottomLeft,
              //   end: Alignment.topRight,
              //   colors: [
              //     // Color(0XFF),
              //     // Color(0XFF),
              //     // Color(0XFF),
              //     // Color(0XFF),
              //     // Color(0XFF),
              //     // Color(0XFF),
              //     // Color(0XFF),
              //     // Color(0XFF),
              //     // Color(0XFF),
              //     // Color(0XFF),
              //     // Color(0XFF),
              //     // Color(0XFF),
              //     Color(0XFFb6d0c7),
              //     Color(0XFFb5d6bc),
              //     Color(0XFFc1d9aa),
              //     Color(0XFFd9d897),
              //     Color(0XFFf9d38a),

              //     //blue
              //     // Color(0XFFb2c6de),
              //     // Color(0XFFadc9e3),
              //     // Color(0XFFa8cce7),
              //     // Color(0XFFa2d0ea),
              //     // Color(0XFF9bd3ed),
              //     // Color(0XFF95d6ef),
              //     // Color(0XFF8fd8f0),
              //     // Color(0XFF88dbf1),
              //     // Color(0XFF81def1),
              //     // Color(0XFF7ae2f0),
              //     // Color(0XFF74e5ee),
              //     // Color(0XFF70e8eb),
              //   ],
              // ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildMenuButton(Icons.person, "Profile", true, ProfilePage()),
                buildMenuButton(Icons.login, "Login", false, LoginPage()),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: controller,
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
                    Flexible(flex: 2, child: Image.asset("images/actor1.png")),
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
                                _openProfilePage(
                                  page: ProfilePage(),
                                );
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

  Expanded buildMenuButton(
      IconData icon, String title, bool left, Widget page) {
    return Expanded(
      flex: 1,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: left
              ? BorderRadius.only(topLeft: Radius.circular(25))
              : BorderRadius.only(topRight: Radius.circular(25)),
          onTap: () {
            _openProfilePage(page: page);
          },
          // splashColor:
          //     left ? AppColor.opalBackground : AppColor.deepChampagneBackground,
          splashColor: AppColor.opalFontcolor,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 2.5,
                ),
                Text(title)
              ],
            ),
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
