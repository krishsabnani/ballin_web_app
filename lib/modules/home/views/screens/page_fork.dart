import 'package:ballin_web_app/modules/home/data/services/page_provider.dart';
import 'package:ballin_web_app/modules/home/views/screens/about_page.dart';
import 'package:ballin_web_app/modules/home/views/screens/ballin_team_page.dart';
import 'package:ballin_web_app/modules/home/views/screens/get_in_touch.dart';
import 'package:ballin_web_app/modules/home/views/screens/home_page.dart';
import 'package:ballin_web_app/modules/home/views/widgets/ballin_app_bar.dart';
import 'package:ballin_web_app/modules/home/views/widgets/footer.dart';
import 'package:ballin_web_app/modules/home/views/widgets/side_drawer.dart';
import 'package:ballin_web_app/utilities/app_text.dart';
import 'package:ballin_web_app/utilities/screens/loading_page.dart';
import 'package:ballin_web_app/utilities/screens/splash_screen.dart';
import 'package:ballin_web_app/utilities/tabs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageFork extends StatefulWidget {
  @override
  _PageForkState createState() => _PageForkState();
}

class _PageForkState extends State<PageFork> {
  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);
    return Scaffold(
      endDrawer: SideDrawer(popFunc: (){},),
      appBar: PreferredSize(
        child: BallinAppBar(popFunc: (){},),
        preferredSize: Size.fromHeight(100),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(0),
            child: _buildPage(pageProvider.currentTab)
          ),
          Footer()
        ],
      ),
    );
  }


  Widget _buildPage(Tabs tab){
    switch(tab){
      case Tabs.Home:
        return HomePage();
        break;
      case Tabs.Shot_Balls:
        return Container(
          height: MediaQuery.of(context).size.height-100,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/Update.png",height: 200,width: 200,),
              SizedBox(height: 20,),
              AppText.SubHeading(text: "Coming Soon!")
            ],
          ),
        );
        break;
      case Tabs.About:
        return AboutPage();
        break;
      case Tabs.Ballin_Team:
        return BallinTeamPage();
        break;
      case Tabs.Get_in_Touch:
        return GetInTouch();
        break;
      default: return HomePage();
      break;
    }
  }
}
