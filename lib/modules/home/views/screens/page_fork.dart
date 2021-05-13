import 'package:ballin_web_app/modules/home/data/services/page_provider.dart';
import 'package:ballin_web_app/modules/home/views/screens/about_page.dart';
import 'package:ballin_web_app/modules/home/views/screens/home_page.dart';
import 'package:ballin_web_app/modules/home/views/widgets/ballin_app_bar.dart';
import 'package:ballin_web_app/modules/home/views/widgets/side_drawer.dart';
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
      endDrawer: SideDrawer(),
      appBar: PreferredSize(
        child: BallinAppBar(popFunc: (){},),
        preferredSize: Size.fromHeight(100),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: _buildPage(pageProvider.currentTab)
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
          color: Colors.red,
        );
        break;
      case Tabs.About:
        return AboutPage();
        break;
      case Tabs.Ballin_App:
        return Container(
          color: Colors.grey,
        );
        break;
      default: return HomePage();
      break;
    }
  }
}