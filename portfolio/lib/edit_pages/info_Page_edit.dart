import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/portfolio_function.dart';
import 'package:portfolio/res/color.dart';
import 'package:portfolio/widget/app_bar_widget.dart';
import 'package:portfolio/widget/body_text_widget.dart';
import 'package:portfolio/widget/image_slider_widget.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class InfoPageEdit extends StatefulWidget {
  InfoPageEdit({Key key, this.projectName, this.isAdmin = true})
      : super(key: key);
  final String projectName;
  final isAdmin;
  @override
  _InfoPageEditState createState() => _InfoPageEditState();
}

class _InfoPageEditState extends State<InfoPageEdit> {
  var technologyStack = [
    "web",
    "flutter",
    "android",
    "flask",
    "flutter",
    "ios",
  ];
  YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: '92vhSBYvKQI',
      params: const YoutubePlayerParams(
        playlist: [
          '92vhSBYvKQI',
          // 'K18cpp_-gP8',
          // 'iLnmTe5Q2Qw',
          // '_WoCV4c6XOE',
          // 'KmzdUe0RSJo',
          // '6jZDSSZZxjQ',
          // 'p2lYr3vM_1w',
          // '7QUtEmBT_-w',
          // '34_PXCzGw1M',
        ],
        autoPlay: false,
        showControls: true,
        showFullscreenButton: true,
        desktopMode: false,
        privacyEnhanced: true,
        useHybridComposition: false,
      ),
    );
    _controller.onEnterFullscreen = () {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      // log('Entered Fullscreen');
    };
    // _controller.onExitFullscreen = () {
    //   log('Exited Fullscreen');
    // };

    // welecam text controller
    _projectNameTextController = TextEditingController();
    _projectNameTextController.text = widget.projectName;
// breif text controller
    _descriptionTextController = TextEditingController();
    _descriptionTextController.text =
        "Text messaging templates provide pre-set text that can be" +
            " used to quickly send common text messages without typing the message itself." +
            " For example, if you are “running late” or “in a meeting”, this feature lets you " +
            "send those replies simply by choosing them from a menu, instead of typing out the whole phrase.";
  }

  // void dispose() {
  //   _controller.close();
  //   super.dispose();
  // }

  TextEditingController _projectNameTextController;
  TextEditingController _descriptionTextController;
  bool editMood = false;
  String projectNameText;
  String descriptionText;

  @override
  void dispose() {
    super.dispose();
    // _controller.close();
    _projectNameTextController.dispose();
    _descriptionTextController.dispose();
  }

  void enableEditMode() {
    setState(() {
      editMood = true;
      projectNameText = _projectNameTextController.text;
      descriptionText = _descriptionTextController.text;
    });
  }

  void disableEditMode() {
    setState(() {
      editMood = false;
      _projectNameTextController.text = projectNameText;
      _descriptionTextController.text = descriptionText;
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
    const player = YoutubePlayerIFrame();
    return Scaffold(
      appBar: portfolioAppBar(
        context: context,
        title: widget.projectName,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 5,
            ),
            PortfolioImageSlider(
              imageList: [
                "https://learn.g2crowd.com/hubfs/What-is-a-tech-stack.png",
                "https://analyticsindiamag.com/wp-content/uploads/2020/10/7d744a684fe03ebc7e8de545f97739dd.jpg",
                "https://play-lh.googleusercontent.com/qIiIyPtxKc903sdu1fgzU2UgH4Ju3ITY1ViYEu6zy2I3rdS8Q9t64uumt5ZmfZYXKg4=w720-h310-rw",
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  widget.isAdmin
                      ? buildEditButtonBar(
                          enableEditMode, disableEditMode, saveText, editMood)
                      : SizedBox.shrink(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          flex: 1,
                          child: editText(
                              _projectNameTextController, 25, editMood)),
                      TextButton(
                          style: TextButton.styleFrom(
                            primary: AppColor.fontColor,
                          ),
                          onPressed: () {},
                          child: Row(
                            children: [
                              bodyText(
                                text: "Source code",
                                fontSize: 17,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Image.asset(
                                "images/github.png",
                                width: 35,
                              )
                            ],
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  ///
                  ///end row project name and source code icon
                  ///
                  Container(
                    alignment: Alignment.center,
                    child: editText(_descriptionTextController, 15, editMood,
                        textAlign: TextAlign.justify),
                  ),

                  ///
                  ///end  descrip text for project
                  ///
                  SizedBox(
                    height: 20,
                  ),
                  Wrap(
                    spacing: 20,
                    runSpacing: 12,
                    children: technologyStack
                        .map((item) => Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 3),
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

                  ///
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Image.asset("images/youtube.png"),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        "Youtube",
                        style: TextStyle(
                          color: AppColor.fontColor,
                          fontSize: 25,
                        ),
                      )
                    ],
                  ),

                  SizedBox(
                    height: 25,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: YoutubePlayerControllerProvider(
                      // Passing controller to widgets below.
                      controller: _controller,
                      child: Stack(
                        children: [
                          player,
                          Positioned.fill(
                            child: YoutubeValueBuilder(
                              controller: _controller,
                              builder: (context, value) {
                                return AnimatedCrossFade(
                                  firstChild: const SizedBox.shrink(),
                                  secondChild: Material(
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              YoutubePlayerController
                                                  .getThumbnail(
                                            videoId: _controller
                                                .params.playlist.first,
                                            quality: ThumbnailQuality.medium,
                                          )),
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                      child: const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                                  ),
                                  crossFadeState: value.isReady
                                      ? CrossFadeState.showFirst
                                      : CrossFadeState.showSecond,
                                  duration: const Duration(milliseconds: 300),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
