import 'package:flutter/material.dart';
import 'package:portfolio/main_pages/info_Page.dart';
import 'package:portfolio/model/project.dart';
import 'package:portfolio/res/color.dart';
import 'package:portfolio/widget/app_bar.dart';

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
            ],
          ),
        ),
      ),
    );
  }
}
