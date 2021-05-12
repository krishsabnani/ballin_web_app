import 'package:ballin_web_app/modules/home/data/services/page_provider.dart';
import 'package:ballin_web_app/modules/home/views/widgets/footer.dart';
import 'package:ballin_web_app/modules/home/views/widgets/memeber_widget.dart';
import 'package:ballin_web_app/utilities/app_text.dart';
import 'package:ballin_web_app/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BallinTeamPage extends StatefulWidget {
  @override
  _BallinTeamPageState createState() => _BallinTeamPageState();
}

class _BallinTeamPageState extends State<BallinTeamPage> {

  @override
  void initState() {
    super.initState();
    PageProvider pageProvider = Provider.of<PageProvider>(context,listen: false);
    pageProvider.getMembersContent(true);
  }


  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);
    return Container(
      child: pageProvider.isMembersLoading ?
          CircularProgressIndicator():
      LayoutBuilder(
            builder: (context, constraints) {
              if(constraints.maxWidth > 700)
              return ListView(
        shrinkWrap: true,
        children: [
              AppText.Heading(text: "Our Team",color: ThemeColors.blackColor,size: 24),
              SizedBox(height: 20,),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate((pageProvider.members.length/4).ceil(), (i) =>
                    Padding(
                      padding:  EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(getLength(i,pageProvider.members.length),(index) => MemberWidget(pageProvider.members[4*i + index],1)),
                      ),
                    )),
              )
        ]
      );
              else return ListView(
                shrinkWrap: true,
                children: [
                  Center(child: AppText.Heading(text: "Our Team",color: ThemeColors.blackColor,size: 24)),
                  SizedBox(height: 40,),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(pageProvider.members.length, (index) => Padding(
                      padding:  EdgeInsets.symmetric(vertical: 15),
                      child: MemberWidget(pageProvider.members[index],2),
                    )),
                  )
                ],
              );
            }
          ),
    );
  }

  int getLength(i,l){
    if(l~/4 == i) return l%4;
    else return 4;
  }
}
