import 'package:ballin_web_app/modules/home/data/models/member_model.dart';
import 'package:ballin_web_app/utilities/app_text.dart';
import 'package:ballin_web_app/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MemberWidget extends StatelessWidget {
  MemberModel member;
  MemberWidget(this.member);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(member.img),
        ),
        SizedBox(height: 10,),
        AppText.SubHeading(text: member.name,color: ThemeColors.blackColor,size: 18),
        SizedBox(height: 10,),
        AppText.Content(text: member.desg,color: ThemeColors.blackColor,size: 16),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(member.socialIds.toJson().keys.length, (index) =>
              IconButton(icon: Icon(getIcon(member.socialIds.toJson().keys.elementAt(index))), onPressed: (){
                launch(member.socialIds.toJson()[member.socialIds.toJson().keys.elementAt(index)]);
              })),
        )
      ],
    );
  }

  IconData getIcon(String key){
    if(key == "instagram"){
      return FontAwesomeIcons.instagram;
    }
    else if(key == "linkedIn"){
      return FontAwesomeIcons.linkedinIn;
    }
  }

}
