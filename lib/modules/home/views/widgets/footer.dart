import 'package:ballin_web_app/utilities/app_text.dart';
import 'package:ballin_web_app/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeColors.blackColor,
      padding: EdgeInsets.all(20),
      child: LayoutBuilder(
        builder: (context, constraint) {
          if(constraint.maxWidth > 700)
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.SubHeading(text: "Follow #Balin",color: ThemeColors.whiteColor,size: 20),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(icon: Icon(FontAwesomeIcons.instagram,color: ThemeColors.whiteColor,),onPressed: (){},),
                          SizedBox(width: 10,),
                          IconButton(icon: Icon(FontAwesomeIcons.facebookF,color: ThemeColors.whiteColor,),onPressed: (){},),
                          SizedBox(width: 10,),
                          IconButton(icon: Icon(FontAwesomeIcons.linkedinIn,color: ThemeColors.whiteColor,),onPressed: (){},),                        ],
                      )
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.SubHeading(text: "Want to Contribute?",color: ThemeColors.whiteColor,size: 20),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(icon: Icon(FontAwesomeIcons.envelope,color: ThemeColors.whiteColor,),onPressed: (){},),
                          SizedBox(width: 10,),
                          IconButton(icon: Icon(FontAwesomeIcons.phoneAlt,color: ThemeColors.whiteColor,),onPressed: (){},),
                        ],
                      )
                    ],
                  )
                ],
              ),

              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText.Content(text: "By  ",color: ThemeColors.whiteColor,size: 14),
                  Image.asset("assets/images/semicoln_logo.png",height: 20,)
                ],
              )
            ],
          );
          else return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppText.SubHeading(text: "Follow #Ballin",color: ThemeColors.whiteColor,size: 20),
              SizedBox(height: 20,),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(icon: Icon(FontAwesomeIcons.instagram,color: ThemeColors.whiteColor,),onPressed: (){},),
                  SizedBox(width: 10,),
                  IconButton(icon: Icon(FontAwesomeIcons.facebookF,color: ThemeColors.whiteColor,),onPressed: (){},),
                  SizedBox(width: 10,),
                  IconButton(icon: Icon(FontAwesomeIcons.linkedinIn,color: ThemeColors.whiteColor,),onPressed: (){},),                        ],
              ),
              SizedBox(height: 20,),
              AppText.SubHeading(text: "Want to Contribute?",color: ThemeColors.whiteColor,size: 20),
              SizedBox(height: 20,),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(icon: Icon(FontAwesomeIcons.envelope,color: ThemeColors.whiteColor,),onPressed: (){},),
                  SizedBox(width: 10,),
                  IconButton(icon: Icon(FontAwesomeIcons.phoneAlt,color: ThemeColors.whiteColor,),onPressed: (){},),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                //mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText.Content(text: "By  ",color: ThemeColors.whiteColor,size: 14),
                  Image.asset("assets/images/semicoln_logo.png",)
                ],
              )
            ],
          );
        }
      ),
    );
  }
}