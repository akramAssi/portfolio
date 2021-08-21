import 'package:flutter/material.dart';
import 'package:portfolio/login_page.dart';
import 'package:portfolio/model/project.dart';
import 'package:portfolio/main_pages/profile_page.dart';
import 'package:portfolio/constant.dart';
import 'package:portfolio/widget/body_text_widget.dart';
import 'package:portfolio/portfolio_function.dart';
import 'package:portfolio/widget/list_project_widget.dart';
import 'package:portfolio/widget/scroll_to_hide_widget.dart';
import '../res/color.dart';
import '../widget/image_slider_widget.dart';

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

  @override
  Widget build(BuildContext context) {
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
                borderRadius:
                    BorderRadius.only(topRight: radius, topLeft: radius),
                color: AppColor.opalBackground,
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
                            Flexible(
                                flex: 2,
                                child: Image.asset("images/actor1.png")),
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
                                        openPage(
                                          context,
                                          ProfilePage(),
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
                              context,
                              name: "Web",
                              backgroundColor: AppColor.melonBackground,
                              foregroundColor: AppColor.melonFontcolor,
                              multiSizeIcon: true,
                            ),
                            buildTypeCard(
                              context,
                              name: "Mobile",
                              backgroundColor: AppColor.babyPinkBackground,
                              foregroundColor: AppColor.babyPinkFontcolor,
                              multiSizeIcon: true,
                            ),
                            buildTypeCard(
                              context,
                              name: "Desktop",
                              backgroundColor:
                                  AppColor.brightNavyBlueBackground,
                              foregroundColor: AppColor.brightNavyBlueFontcolor,
                              multiSizeIcon: true,
                            ),
                            buildTypeCard(
                              context,
                              name: "Script",
                              backgroundColor: AppColor.lavenderBlueBackground,
                              foregroundColor: AppColor.lavenderBlueFontcolor,
                              multiSizeIcon: true,
                            ),
                          ],
                        ),
                      ),
                      ListCard(listProject: listProject),
                      SizedBox(
                        height: 30,
                      )
                    ]))));
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
            openPage(context, page);
          },
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
}
