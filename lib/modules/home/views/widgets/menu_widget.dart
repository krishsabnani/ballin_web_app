import 'package:ballin_web_app/utilities/app_text.dart';
import 'package:ballin_web_app/utilities/colors.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatefulWidget {

  String title;
  bool isSelected;
  Function onPress;

  MenuWidget({this.title,this.isSelected,this.onPress});
  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:10,vertical: 10),
      child: GestureDetector(
        onTap: widget.onPress,
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppText.SubHeading(text: widget.title,color: ThemeColors.lightGrey,size: 18),
              widget.isSelected ?Container(
                width: 20,
                height: 1.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ThemeColors.highlightColor
                ),
              ):Center()
            ],
          ),
        ),
      ),
    );
  }
}
