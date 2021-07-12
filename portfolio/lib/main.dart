import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'dart:math' as math;

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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
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
            to: const Duration(milliseconds: 175),
            tag: "logo3_scale")
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            from: const Duration(milliseconds: 175),
            to: const Duration(milliseconds: 195),
            tag: "logo2_fade")
        .addAnimatable(
            animatable:
                Tween<double>(begin: math.pi - 210 * math.pi / 180, end: 0),
            from: const Duration(milliseconds: 177),
            to: const Duration(milliseconds: 400),
            tag: "logo2_rotateX")
        .addAnimatable(
            animatable:
                Tween<double>(begin: math.pi - 70 * math.pi / 180, end: 0),
            from: const Duration(milliseconds: 177),
            to: const Duration(milliseconds: 400),
            tag: "logo2_rotateY")
        .addAnimatable(
            animatable:
                Tween<double>(begin: math.pi - 210 * math.pi / 180, end: 0),
            from: const Duration(milliseconds: 177),
            to: const Duration(milliseconds: 400),
            tag: "logo2_rotateZ")
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            from: const Duration(milliseconds: 175),
            to: const Duration(milliseconds: 195),
            tag: "logo1_fade")
        .addAnimatable(
            animatable:
                Tween<double>(begin: math.pi - 210 * math.pi / 180, end: 0),
            from: const Duration(milliseconds: 177),
            to: const Duration(milliseconds: 400),
            tag: "logo1_rotateX")
        .addAnimatable(
            animatable:
                Tween<double>(begin: math.pi - 70 * math.pi / 180, end: 0),
            from: const Duration(milliseconds: 177),
            to: const Duration(milliseconds: 400),
            tag: "logo1_rotateY")
        .addAnimatable(
            animatable:
                Tween<double>(begin: math.pi - 210 * math.pi / 180, end: 0),
            from: const Duration(milliseconds: 177),
            to: const Duration(milliseconds: 400),
            tag: "logo1_rotateZ")
        .animate(controller);
    controller.forward();
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

                // Image.asset("images/logo3.png"),
                // Image.asset("images/logo2.png"),

                new AnimatedBuilder(
                  builder: (context, child) {
                    // return Image.asset("images/logo1.png");
                    return Transform.scale(
                      scale: sequenceAnimation["logo3_scale"].value,
                      child: Image.asset("images/logo3.png"),
                    );
                  },
                  animation: controller,
                ),
                new AnimatedBuilder(
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
                new AnimatedBuilder(
                  builder: (context, child) {
                    return Transform(
                      alignment: FractionalOffset.center,
                      transform: perspective.scaled(1.0, 1.0, 1.0)
                        ..rotateX(sequenceAnimation["logo2_rotateX"].value)
                        ..rotateY(sequenceAnimation["logo2_rotateY"].value)
                        ..rotateZ(sequenceAnimation["logo2_rotateZ"].value),
                      child: Opacity(
                        opacity: sequenceAnimation["logo2_fade"].value,
                        child: Image.asset("images/logo1.png"),
                      ),
                    );
                  },
                  animation: controller,
                ),
                // Image.asset("images/logo1.png"),
                // TweenAnimationBuilder(
                //     tween: _scaleTween,
                //     duration: Duration(milliseconds: 600),
                //     builder: (context, scale, child) {
                //       return Transform.scale(
                //         scale: scale,
                //         child: child,
                //       );
                //     },
                //     child: Image.asset("images/logo1.png")),
                Positioned(
                  top: 165,
                  left: 66,
                  child: AutoSizeText("Akram Assi",
                      maxLines: 1,
                      maxFontSize: 45,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width / 9,
                          fontFamily: "Snell")),
                ),
                Positioned(
                  bottom: 120,
                  right: 50,
                  child: AutoSizeText("Portfolio",
                      maxLines: 1,
                      maxFontSize: 45,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width / 9,
                          fontFamily: "Snell")),
                )
              ],
            ),
            // Image.asset("images/splach_image.png"),
            Image.asset("images/bottom.png"),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
