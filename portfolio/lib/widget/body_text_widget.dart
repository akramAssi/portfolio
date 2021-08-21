import 'package:flutter/material.dart';
import 'package:portfolio/res/color.dart';

class bodyText extends StatelessWidget {
  final String text;
  final double fontSize;
  const bodyText({
    Key key,
    @required this.text,
    this.fontSize = 15,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: AppColor.fontColor, fontSize: fontSize),
    );
  }
}
