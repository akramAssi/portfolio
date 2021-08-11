// import 'package:flutter/material.dart';
// import 'package:portfolio/homePage.dart';
// import 'package:portfolio/res/color.dart';
// import 'package:portfolio/splash_screen.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         accentColor: AppColor.fontColor,
//         scaffoldBackgroundColor: AppColor.background,
//         // splashColor: AppColor.fontColor,
//         fontFamily: "ComicSansMS",
//       ),
//       // home: SplashScreen(),
//       home: HomePage(),
//     );
//   }
// }
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:youtube_plyr_iframe/youtube_plyr_iframe.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(YoutubeApp());
}

///
class YoutubeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Youtube Plyr Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.blue),
      ),
      debugShowCheckedModeBanner: false,
      home: YoutubeAppDemo(),
    );
  }
}

///
class YoutubeAppDemo extends StatefulWidget {
  @override
  _YoutubeAppDemoState createState() => _YoutubeAppDemoState();
}

class _YoutubeAppDemoState extends State<YoutubeAppDemo> {
  String videoID = "PuMz4v5PYKc";
  List<Map<String, dynamic>> players = [
    {
      "videoID": "AOhFzDN3eMI",
      "quality": ThumbnailQuality.max,
    },
    {
      "videoID": "LRNuWYvRtac",
      "quality": ThumbnailQuality.standard,
    },
    {
      "videoID": "ZEqba-Bg7Z0",
      "quality": ThumbnailQuality.high,
    },
  ];
  double headerSize = 25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: new Center(
              child: Column(
                // center the children
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ytPlayer("KwIP0hjqIdU"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showDialog(context, videoID) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return YoutubeViewer(
          videoID,
        );
      },
    );
  }

  Widget ytPlayer(videoID) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          _showDialog(
            context,
            videoID,
          );
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                LayoutBuilder(
                  builder: (context, constraints) {
                    if (kIsWeb && constraints.maxWidth > 800) {
                      return Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width / 2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: new Image.network(
                            YoutubePlayerController.getThumbnail(
                                videoId: videoID,
                                // todo: get thumbnail quality from list
                                quality: ThumbnailQuality.max,
                                webp: false),
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width * 2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: new Image.network(
                            YoutubePlayerController.getThumbnail(
                                videoId: videoID,
                                // todo: get thumbnail quality from list
                                quality: ThumbnailQuality.max,
                                webp: false),
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
            Icon(
              Icons.play_circle_filled,
              color: Colors.white,
              size: 55.0,
            ),
          ],
        ),
      ),
    );
  }
}

class YoutubeViewer extends StatefulWidget {
  final String videoID;
  YoutubeViewer(this.videoID);
  @override
  _YoutubeViewerState createState() => _YoutubeViewerState();
}

class _YoutubeViewerState extends State<YoutubeViewer> {
  YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoID, // livestream example
      params: YoutubePlayerParams(
        //startAt: Duration(minutes: 1, seconds: 5),
        showControls: true,
        showFullscreenButton: true,
        desktopMode: false,
        autoPlay: true,
        enableCaption: true,
        showVideoAnnotations: false,
        enableJavaScript: true,
        privacyEnhanced: true,
        useHybridComposition: true,
        playsInline: false,
      ),
    )..listen((value) {
        print(_controller.value.position);
        if (value.isReady && !value.hasPlayed) {
          _controller
            ..hidePauseOverlay()
            ..play()
            ..hideTopMenu();
        }
        if (value.hasPlayed) {
          _controller..hideEndScreen();
        }
      });

    _controller.onExitFullscreen = () {
      Navigator.of(context).pop();
    };
  }

  @override
  Widget build(BuildContext context) {
    final player = YoutubePlayerIFrame();
    return YoutubePlayerControllerProvider(
      key: UniqueKey(),
      controller: _controller,
      child: AlertDialog(
          insetPadding: EdgeInsets.all(10),
          backgroundColor: Colors.white,
          content: Container(height: 450, width: 750, child: player),
          contentPadding: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          )),
    );
  }
}
