import 'package:flutter/material.dart';
import 'package:portfolio/res/color.dart';
import 'package:portfolio/widget/app_bar_widget.dart';
import 'package:portfolio/portfolio_function.dart';

class ProfilePageEdit extends StatefulWidget {
  const ProfilePageEdit({Key key, this.isAdmin = true}) : super(key: key);
  final bool isAdmin;

  @override
  _ProfilePageEditState createState() => _ProfilePageEditState();
}

class _ProfilePageEditState extends State<ProfilePageEdit> {
  TextEditingController _welecamTextController;

  TextEditingController _briefTextController;

  bool editMood = false;

  String projectNameText;

  String descriptionText;

  @override
  void initState() {
    super.initState();

    // welecam text controller
    _welecamTextController = TextEditingController();
    _welecamTextController.text = "My name is Akram Assi";
// breif text controller
    _briefTextController = TextEditingController();
    _briefTextController.text =
        "I graduated from Najah University with a bachelor’s degree in computer " +
            "science and currently reside in Nablus, Palestine. This application was " +
            "made to show off the skills I learned during my studies.";
  }

  @override
  void dispose() {
    super.dispose();
    // _controller.close();
    _welecamTextController.dispose();
    _briefTextController.dispose();
  }

  void enableEditMode() {
    setState(() {
      editMood = true;
      projectNameText = _welecamTextController.text;
      descriptionText = _briefTextController.text;
    });
  }

  void disableEditMode() {
    setState(() {
      editMood = false;
      _welecamTextController.text = projectNameText;
      _briefTextController.text = descriptionText;
      projectNameText = null;
      descriptionText = null;
    });
  }

  void saveText() {
    setState(() {
      editMood = false;
      projectNameText = null;
      descriptionText = null;
    });
  }

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
              widget.isAdmin
                  ? buildEditButtonBar(
                      enableEditMode, disableEditMode, saveText, editMood)
                  : SizedBox.shrink(),
              SizedBox(height: 15),
              editText(
                _welecamTextController,
                18,
                editMood,
                textAlign: TextAlign.center,
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: editText(
                    _briefTextController,
                    16,
                    editMood,
                    textAlign: TextAlign.center,
                  )),
              Wrap(
                spacing: 25,
                runSpacing: 30,
                alignment: WrapAlignment.center,
                children: [
                  buildTypeCard(
                    context,
                    name: "Web",
                    backgroundColor: AppColor.melonBackground,
                    foregroundColor: AppColor.melonFontcolor,
                    multiSizeIcon: false,
                  ),
                  buildTypeCard(
                    context,
                    name: "Android",
                    backgroundColor: AppColor.opalBackground,
                    foregroundColor: AppColor.opalFontcolor,
                    multiSizeIcon: false,
                  ),
                  buildTypeCard(
                    context,
                    name: "Flutter",
                    backgroundColor: AppColor.brightNavyBlueBackground,
                    foregroundColor: AppColor.brightNavyBlueFontcolor,
                    multiSizeIcon: false,
                  ),
                  buildTypeCard(
                    context,
                    name: "Python",
                    backgroundColor: AppColor.lavenderBlueBackground,
                    foregroundColor: AppColor.lavenderBlueFontcolor,
                    multiSizeIcon: false,
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
}
