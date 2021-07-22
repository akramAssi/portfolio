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
        ])
  ];
  @override
  Widget build(BuildContext context) {
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                fontSize: 20,
                              )),
                          Text(
                              "This is my portfolio, which I use to display projects during my undergraduate years.",
                              style: TextStyle(
                                fontFamily: "ComicSansMS",
                                fontSize: 16,
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              Wrap(
                spacing: 20,
                runSpacing: 30,
                alignment: WrapAlignment.spaceEvenly,
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
              // ListView.builder(
              //     padding: const EdgeInsets.all(8),
              //     itemCount: listProject.length,
              //     itemBuilder: (BuildContext context, int index) {
              //       return Container(
              //         height: 50,
              //         color: Colors.amber[colorCodes[index]],
              //         child: Center(child: Text('Entry ${entries[index]}')),
              //       );
              //     })
            ],
          ),
        ),
      ),
    );
  }

  Container buildTypeCard(
      {String name, Color backgroundColor, Color foregroundColor}) {
    return Container(
      constraints: BoxConstraints(maxHeight: 183),
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(25))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              name,
              style: TextStyle(
                  color: foregroundColor,
                  fontFamily: "ComicSansMS",
                  fontSize: 26),
            ),
            SizedBox(
              width: 30,
            ),
            Image.asset("images/web.png"),
          ],
        ),
      ),
    );
  }
}
