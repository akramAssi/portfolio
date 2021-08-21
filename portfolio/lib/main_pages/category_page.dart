import 'package:flutter/material.dart';
import 'package:portfolio/main_pages/info_Page.dart';
import 'package:portfolio/model/project.dart';
import 'package:portfolio/res/color.dart';
import 'package:portfolio/widget/app_bar_widget.dart';
import 'package:portfolio/widget/list_project_widget.dart';

class CategoryPage extends StatelessWidget {
  final String title;
  CategoryPage({Key key, @required this.title}) : super(key: key);
  final List<String> technologyStack = [
    "web",
    "flutter",
    "android",
    "flask",
    "flutter",
    "ios",
  ];

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
      appBar: portfolioAppBar(context: context, title: title),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
          child: Column(
            children: [
              Text("text that can be used to quickly send common" +
                  "Nablus, Palestine. This application was made to show off"),
              SizedBox(
                height: 15,
              ),
              Wrap(
                spacing: 20,
                runSpacing: 12,
                children: technologyStack
                    .map((item) => Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                          decoration: BoxDecoration(
                              color: AppColor.background,
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 6,
                                    color: Colors.grey[300],
                                    offset: Offset(0.2, 2))
                              ]),
                          child: Text(
                            item,
                            style: TextStyle(color: AppColor.fontColor),
                          ),
                        ))
                    .toList(),
              ),
              SizedBox(
                height: 45,
              ),
              ListCard(listProject: listProject),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
