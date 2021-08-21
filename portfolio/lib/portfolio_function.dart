import 'package:flutter/material.dart';
import 'package:portfolio/main_pages/category_page.dart';
import 'package:portfolio/res/color.dart';

void openPage(
  BuildContext context,
  Widget page, {
  bool fullscreenDialog: false,
}) {
  Navigator.of(context).push(
    MaterialPageRoute<void>(
      builder: (context) => page,
      // builder: (context) => ProfilePage(),
      fullscreenDialog: fullscreenDialog,
    ),
  );
}

InkWell buildTypeCard(
  BuildContext context, {
  @required String name,
  @required Color backgroundColor,
  @required Color foregroundColor,
  @required bool multiSizeIcon,
}) {
  return InkWell(
    borderRadius: BorderRadius.circular(25),
    onTap: () {
      openPage(
        context,
        CategoryPage(
          title: name,
        ),
      );
    },
    splashColor: foregroundColor,
    child: Container(
      width: 170,
      height: 90,
      constraints: BoxConstraints(maxWidth: 183),
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(25))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              name,
              style: TextStyle(color: foregroundColor, fontSize: 20),
            ),
            SizedBox(
              width: 2,
            ),
            (multiSizeIcon)
                ? Image.asset(
                    "images/$name.png",
                    width: name == "Web"
                        ? 50
                        : name == "Desktop"
                            ? 38
                            : 45,
                  )
                : Image.asset(
                    "images/$name@X2.png",
                    height: 50,
                  ),
          ],
        ),
      ),
    ),
  );
}

TextField editText(
  TextEditingController controller,
  double fontSize,
  bool editable, {
  TextAlign textAlign = TextAlign.start,
}) {
  return TextField(
    controller: controller,
    style: TextStyle(color: AppColor.fontColor, fontSize: fontSize),
    textAlign: textAlign,
    // keyboardType: TextInputType.text,
    maxLines: null,
    enabled: editable,
    // readOnly: editable,
    selectionControls: null,
    decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        contentPadding: EdgeInsets.zero,
        isDense: true,
        hintText: "Hint here"),
  );
}

Row buildEditButtonBar(void Function() enableEditMode,
    VoidCallback disableEditMode, VoidCallback saveText, editMood) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Visibility(
        visible: !editMood,
        child: IconButton(
          onPressed: enableEditMode,
          icon: Icon(
            Icons.edit,
            color: AppColor.fontColor,
          ),
        ),
      ),
      Visibility(
          visible: editMood,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: saveText,
                icon: Icon(
                  Icons.check,
                  color: AppColor.opalFontcolor,
                ),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: disableEditMode,
                icon: Icon(
                  Icons.close_sharp,
                  color: AppColor.babyPinkFontcolor,
                ),
              )
            ],
          ))
    ],
  );
}
