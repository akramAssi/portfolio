import 'package:animated_text/animated_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'dart:math' as math;

import 'homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  SplashScreen({
    Key key,
  }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  Tween<double> _scaleTween = Tween<double>(begin: 0, end: 1);
  AnimationController controller;
  SequenceAnimation sequenceAnimation;
  static Matrix4 _pmat(num pv) {
    return new Matrix4(
      1.0, 0.0, 0.0, 0.0, //
      0.0, 1.0, 0.0, 0.0, //
      0.0, 0.0, 1.0, pv * 0.001, //
      0.0, 0.0, 0.0, 1.0,
    );
  }

  Matrix4 perspective = _pmat(1.0);

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this);
    sequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            from: const Duration(milliseconds: 0),
            to: const Duration(milliseconds: 300),
            tag: "logo3_scale")
        //logo_3
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            from: const Duration(milliseconds: 290),
            to: const Duration(milliseconds: 310),
            tag: "logo2_fade")
        //logo2_fade
        .addAnimatable(
            animatable:
                Tween<double>(begin: math.pi - 210 * math.pi / 180, end: 0),
            from: const Duration(milliseconds: 290),
            to: const Duration(milliseconds: 600),
            tag: "logo2_rotateX")
        .addAnimatable(
            animatable:
                Tween<double>(begin: math.pi - 70 * math.pi / 180, end: 0),
            from: const Duration(milliseconds: 290),
            to: const Duration(milliseconds: 600),
            tag: "logo2_rotateY")
        .addAnimatable(
            animatable:
                Tween<double>(begin: math.pi - 210 * math.pi / 180, end: 0),
            from: const Duration(milliseconds: 290),
            to: const Duration(milliseconds: 600),
            tag: "logo2_rotateZ")
        //logo2_rotate
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            from: const Duration(milliseconds: 590),
            to: const Duration(milliseconds: 610),
            tag: "logo1_fade")
        //logo1_fade
        .addAnimatable(
            animatable:
                Tween<double>(begin: math.pi - 110 * math.pi / 180, end: 0),
            from: const Duration(milliseconds: 600),
            to: const Duration(milliseconds: 900),
            tag: "logo1_rotateX")
        .addAnimatable(
            animatable:
                Tween<double>(begin: math.pi - 70 * math.pi / 180, end: 0),
            from: const Duration(milliseconds: 600),
            to: const Duration(milliseconds: 900),
            tag: "logo1_rotateY")
        .addAnimatable(
            animatable:
                Tween<double>(begin: math.pi - 210 * math.pi / 180, end: 0),
            from: const Duration(milliseconds: 600),
            to: const Duration(milliseconds: 900),
            tag: "logo1_rotateZ")
        .addAnimatable(
            animatable:
                Tween<double>(begin: 0, end: math.pi - 177 * math.pi / 180),
            from: const Duration(milliseconds: 900),
            to: const Duration(milliseconds: 1000),
            tag: "logo1_rotate")
        .animate(controller);
    //logo2_rotate
    controller.forward();
  }

  void goToHomePage() {
    controller.reset();
    controller.reverse(from: 1000.0);
    Future.delayed(Duration(milliseconds: 850), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print(size.width / 11);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: [
                // Image.asset("images/Path 4.png"),
                // Image.asset("images/Path 2.png"),
                // Image.asset("images/Path 3.png"),
                AnimatedBuilder(
                  builder: (context, child) {
                    return Transform.scale(
                      scale: sequenceAnimation["logo3_scale"].value,
                      child: Image.asset("images/logo3.png"),
                    );
                  },
                  animation: controller,
                ),
                AnimatedBuilder(
                  builder: (context, child) {
                    return Transform(
                      alignment: FractionalOffset.center,
                      transform: perspective.scaled(1.0, 1.0, 1.0)
                        ..rotateX(sequenceAnimation["logo2_rotateX"].value)
                        ..rotateY(sequenceAnimation["logo2_rotateY"].value)
                        ..rotateZ(sequenceAnimation["logo2_rotateZ"].value),
                      child: Opacity(
                        opacity: sequenceAnimation["logo2_fade"].value,
                        child: Image.asset("images/logo2.png"),
                      ),
                    );
                  },
                  animation: controller,
                ),
                AnimatedBuilder(
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: sequenceAnimation["logo1_rotate"].value,
                      child: Transform(
                        alignment: FractionalOffset.center,
                        transform: perspective.scaled(1.0, 1.0, 1.0)
                          ..rotateX(sequenceAnimation["logo1_rotateX"].value)
                          ..rotateY(sequenceAnimation["logo1_rotateY"].value)
                          ..rotateZ(sequenceAnimation["logo1_rotateZ"].value),
                        child: Opacity(
                          opacity: sequenceAnimation["logo1_fade"].value,
                          child: Image.asset("images/logo1.png"),
                        ),
                      ),
                    );
                  },
                  animation: controller,
                ),
                Positioned(
                  top: 165,
                  left: 66,
                  child: SizedBox(
                    width: 250,
                    height: size.width / 9,
                    child: AnimatedText(
                      repeatCount: 1,
                      alignment: Alignment.center,
                      speed: Duration(milliseconds: 700),
                      controller: AnimatedTextController.play,
                      displayTime: Duration(milliseconds: 1000),
                      wordList: ['Akram Assi', 'welcome '],
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: size.width / 9,
                          fontFamily: "Snell"),
                      onAnimate: (index) {
                        print("Animating index:" + index.toString());
                      },
                      onFinished: () {
                        print("Animtion finished");
                      },
                    ),
                  ),
                ),

                Positioned(
                  bottom: 120,
                  right: 50,
                  child: SizedBox(
                    width: 250,
                    height: size.width / 9,
                    child: AnimatedText(
                      repeatCount: 1,
                      alignment: Alignment.centerRight,
                      speed: Duration(milliseconds: 700),
                      controller: AnimatedTextController.play,
                      displayTime: Duration(milliseconds: 1000),
                      wordList: ['Portfolio', '.... '],
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: size.width / 9,
                          fontFamily: "Snell"),
                      onAnimate: (index) {
                        print("Animating index:" + index.toString());
                      },
                      onFinished: () {
                        // controller.reset();
                        // controller.reverse(from: 1000.0);
                        goToHomePage();

                        print("Animtio0n finished");
                      },
                    ),
                  ),
                )
              ],
            ),
            AnimatedBuilder(
              builder: (context, child) {
                return Transform.scale(
                  scale: sequenceAnimation["logo3_scale"].value,
                  child: Image.asset("images/bottom.png"),
                );
              },
              animation: controller,
            )
            // Image.asset("images/splach_image.png"),
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
