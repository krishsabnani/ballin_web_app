import 'package:ballin_web_app/modules/home/data/models/blog_model.dart';
import 'package:ballin_web_app/utilities/app_text.dart';
import 'package:ballin_web_app/utilities/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

class BlogCard extends StatefulWidget {
  BlogModel blogModel;
  BlogCard(this.blogModel);
  @override
  _BlogCardState createState() => _BlogCardState();
}

class _BlogCardState extends State<BlogCard> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: 325,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),topRight: Radius.circular(15)
                  ),
                  image: DecorationImage(
                    image: NetworkImage(widget.blogModel.imgUrl),
                    fit: BoxFit.cover,
                  )
                ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText.SubHeading(text: widget.blogModel.type,color: ThemeColors.subSecondaryColor),
                      AppText.SubHeading(text: DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY).format(DateTime.fromMillisecondsSinceEpoch(widget.blogModel.timeStamp)),
                          color: ThemeColors.subSecondaryColor)
                    ],
                  ),
                  SizedBox(height: 15,),
                  AppText.SubHeading(text:widget.blogModel.title,color: ThemeColors.blackColor,size: 18),
                  SizedBox(height: 15,),
                  AppText.Content(text: widget.blogModel.desc,color: ThemeColors.subSecondaryColor,
                      textOverflow: TextOverflow.ellipsis,max: 2),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(CupertinoIcons.heart_fill,color: ThemeColors.red,),
                          AppText.Content(text: " " + widget.blogModel.likes.toString())
                        ],
                      ),
                      AppText.Content(text: "${widget.blogModel.readTime} min read")
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
