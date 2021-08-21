import 'package:flutter/material.dart';
import 'package:portfolio/edit_pages/category_page_edit.dart';
import 'package:portfolio/edit_pages/profile_page_edit.dart';
import 'package:portfolio/main_pages/category_page.dart';
import 'package:portfolio/main_pages/info_Page.dart';
import 'package:portfolio/login_page.dart';
import 'package:portfolio/model/project.dart';
import 'package:portfolio/main_pages/profile_page.dart';
import 'package:portfolio/portfolio_function.dart';
import 'package:portfolio/widget/app_bar_widget.dart';
import 'package:portfolio/widget/body_text_widget.dart';
import 'package:portfolio/widget/list_project_widget.dart';
import 'package:portfolio/widget/scroll_to_hide_widget.dart';
import '../res/color.dart';
import '../widget/image_slider_widget.dart';

class HomePageEdit extends StatefulWidget {
  HomePageEdit({Key key}) : super(key: key);
  final bool isAdmin = true;
  @override
  _HomePageEditState createState() => _HomePageEditState();
}

class _HomePageEditState extends State<HomePageEdit> {
  TextEditingController _welecamTextController;
  TextEditingController _briefTextController;
  bool editMood = false;
  String welcomeText;
  String briefText;
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

  ScrollController scrollController;
  @override
  void initState() {
    super.initState();

    scrollController = ScrollController();
    // welecam text controller
    _welecamTextController = TextEditingController();
    _welecamTextController.text = "Hi, I’m  Akram Assi ";
// breif text controller
    _briefTextController = TextEditingController();
    _briefTextController.text =
        "This is my portfolio, which I use to display projects " +
            "during my undergraduate years.";
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
    _welecamTextController.dispose();
    _briefTextController.dispose();
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

  void enableEditMode() {
    setState(() {
      editMood = true;
      welcomeText = _welecamTextController.text;
      briefText = _briefTextController.text;
    });
  }

  void disableEditMode() {
    setState(() {
      editMood = false;
      _welecamTextController.text = welcomeText;
      _briefTextController.text = briefText;
      welcomeText = null;
      briefText = null;
    });
  }

  void saveText() {
    setState(() {
      editMood = false;
      welcomeText = null;
      briefText = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List indexList = Iterable<int>.generate(10).toList();
    return Scaffold(
      appBar: (!widget.isAdmin)
          ? null
          : portfolioAppBar(context: context, title: "Administrator"),
      bottomNavigationBar: (widget.isAdmin)
          ? null
          : ScrollToHideWidget(
              controller: scrollController,
              child: Container(
                color: Colors.transparent,
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 56,
                  width: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25)),
                    color: AppColor.opalBackground,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      buildMenuButton(
                          Icons.person, "Profile", true, ProfilePage()),
                      buildMenuButton(Icons.login, "Login", false, LoginPage()),
                    ],
                  ),
                ),
              ),
            ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Container(
          // margin: EdgeInsets.only(top: 50),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildEditButtonBar(
                        enableEditMode, disableEditMode, saveText, editMood),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                            flex: 2, child: Image.asset("images/actor1.png")),
                        SizedBox(
                          width: 3,
                        ),
                        Flexible(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              editText(_welecamTextController, 18, editMood),
                              SizedBox(
                                height: 2,
                              ),
                              editText(_briefTextController, 14, editMood),
                              SizedBox(
                                height: 3,
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                child: InkWell(
                                  onTap: () {
                                    _openProfilePage(
                                      page: ProfilePageEdit(),
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
                    // SizedBox(
                    //   height: 18,
                    // ),

                    //     SizedBox(
                    //       height: 10,
                    //     ),
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
              ListCard(
                listProject: listProject,
                isAdmin: true,
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
          page: CategoryPageEdit(
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
