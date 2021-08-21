library shadow;

import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Blur {
  final double sigmaX;
  final double sigmeY;
  const Blur(this.sigmaX, this.sigmeY);
}

class MyShadow extends StatelessWidget {
  final double opacity;
  final double scale;
  final Widget child;
  final Offset offset;
  final Blur blur;

  MyShadow({
    this.opacity = 1,
    @required this.child,
    this.scale = 1,
    this.offset = const Offset(5, 5),
    this.blur = const Blur(1, 1),
  }) : assert(opacity >= 0 && opacity <= 1);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Opacity(
          opacity: opacity,
          child: Transform.translate(
            offset: offset,
            child: Transform.scale(
              scale: scale,
              // child: Expanded(
              child: Stack(
                children: <Widget>[
                  //child,
                  Center(
                    child: ClipRect(
                      // <-- clips to the 200x200 [Container] below
                      child: ImageFiltered(
                        imageFilter: ui.ImageFilter.blur(
                          sigmaX: blur.sigmaX,
                          sigmaY: blur.sigmeY,
                        ),
                        child: child,
                      ),
                    ),
                  )
                ],
              ),
              // ),
            ),
          ),
        ),
        child,
      ],
    );
  }
}
