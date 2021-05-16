import 'package:ballin_web_app/modules/home/data/models/member_model.dart';
import 'package:ballin_web_app/utilities/app_text.dart';
import 'package:ballin_web_app/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MemberWidget extends StatelessWidget {
  MemberModel member;
  int type;
  MemberWidget(this.member,this.type);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: type == 1?MediaQuery.of(context).size.width/4 - 5: MediaQuery.of(context).size.width/2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(member.img),
            backgroundColor: ThemeColors.blackColor,
          ),
          SizedBox(height: 10,),
          AppText.SubHeading(text: member.name,color: ThemeColors.blackColor,size: 18, textAlign: TextAlign.center),
          SizedBox(height: 10,),
          AppText.Content(text: member.desg,color: ThemeColors.blackColor,size: 16, textAlign: TextAlign.center),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(member.socialIds.toJson().keys.length, (index) =>
                IconButton(icon: Icon(getIcon(member.socialIds.toJson().keys.elementAt(index)),color: ThemeColors.blackColor,), onPressed: (){
                  if(member.socialIds.toJson().keys.elementAt(index) == "email"){
                    launch("mailto:" + member.socialIds.toJson()[member.socialIds.toJson().keys.elementAt(index)]);
                  }
                  else launch(member.socialIds.toJson()[member.socialIds.toJson().keys.elementAt(index)]);
                })),
          ),
        ],
      ),
    );
  }

  IconData getIcon(String key){
    print(key);
     if(key == "linkedIn"){
      return FontAwesomeIcons.linkedinIn;
    }
    else if(key == "email"){
      return FontAwesomeIcons.envelope;
    }
  }

}
