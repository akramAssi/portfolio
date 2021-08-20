import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScrollToHideWidget extends StatefulWidget {
  final ScrollController controller;
  final Widget child;
  final Duration duration;
  const ScrollToHideWidget(
      {Key key,
      @required this.controller,
      @required this.child,
      this.duration = const Duration(milliseconds: 250)})
      : super(key: key);

  @override
  _ScrollToHideWidgetState createState() => _ScrollToHideWidgetState();
}

class _ScrollToHideWidgetState extends State<ScrollToHideWidget> {
  bool isvisable = true;
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(listen);
  }

  @override
  void dispose() {
    widget.controller.removeListener(listen);
    super.dispose();
  }

  void listen() {
    final direction = widget.controller.position.userScrollDirection;
    if (direction == ScrollDirection.forward ||
        widget.controller.position.pixels <= 200) {
      show();
    } else {
      hide();
    }
  }

  void show() {
    if (!isvisable) {
      setState(() {
        isvisable = true;
      });
    }
  }

  void hide() {
    if (isvisable) {
      setState(() {
        isvisable = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: isvisable ? 56 : 0,
      duration: widget.duration,
      child: OverflowBox(child: widget.child),
    );
  }
}
