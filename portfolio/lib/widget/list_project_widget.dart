import 'package:flutter/material.dart';
import 'package:portfolio/main_pages/info_Page.dart';
import 'package:portfolio/model/project.dart';
import 'package:portfolio/res/color.dart';
import 'package:portfolio/constant.dart';
import 'package:portfolio/portfolio_function.dart';

class ListCard extends StatelessWidget {
  const ListCard({
    Key key,
    @required this.listProject,
  }) : super(key: key);

  final List<Project> listProject;

  @override
  Widget build(BuildContext context) {
    final List indexList = Iterable<int>.generate(10).toList();
    return Wrap(
      spacing: 25,
      runSpacing: 30,
      alignment: WrapAlignment.center,
      children: indexList
          .map((index) => InkWell(
              splashColor: AppColor.listBackground[index % 6],
              borderRadius: BorderRadius.all(radius),
              onTap: () {
                openPage(context, InfoPage());
              },
              child: Ink(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            //Todo: images well be changed
                            "https://play-lh.googleusercontent.com/qIiIyPtxKc903sdu1fgzU2UgH4Ju3ITY1ViYEu6zy2I3rdS8Q9t64uumt5ZmfZYXKg4=w720-h310-rw",
                          )),
                      borderRadius: BorderRadius.all(radius),
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
                                bottomLeft: radius, bottomRight: radius),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Entry $index', // Todo:  name well be changed
                                style: TextStyle(
                                    color: AppColor.listForeground[index % 6],
                                    fontSize: 20),
                              ),
                              Row(
                                  children: listProject[
                                          0] // Todo: index well be changed
                                      .technologyStack
                                      .map((image) => Image.asset(
                                            "images/$image.png",
                                            height: 30,
                                          ))
                                      .toList()),
                            ],
                          ))))))
          .toList()
          .cast<Widget>(),
    );
  }
}
