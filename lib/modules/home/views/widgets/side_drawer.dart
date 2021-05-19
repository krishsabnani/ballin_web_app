import 'package:ballin_web_app/modules/home/data/services/page_provider.dart';
import 'package:ballin_web_app/modules/home/views/screens/get_in_touch.dart';
import 'package:ballin_web_app/modules/home/views/widgets/menu_widget.dart';
import 'package:ballin_web_app/utilities/app_text.dart';
import 'package:ballin_web_app/utilities/colors.dart';
import 'package:ballin_web_app/utilities/tabs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SideDrawer extends StatefulWidget {
  Function popFunc;
  SideDrawer({this.popFunc});
  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {

  List<String> appBarOptions = ["Home","Ballin Shots", "About","Ballin Team","Get In Touch"];
  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MenuWidget(
            title: "Home",
            isSelected: pageProvider.currentTab == Tabs.Home,
            onPress: (){
              currentTabIndex = appBarOptions.indexOf("Home");
              pageProvider.changeTab(currentTabIndex);
              Navigator.pop(context);
              widget.popFunc();
              setState(() {

              });
            },
          ),
          MenuWidget(
            title: "Ballin Shots",
            isSelected: pageProvider.currentTab == Tabs.Shot_Balls,
            onPress: (){
              currentTabIndex = appBarOptions.indexOf("Ballin Shots");
              pageProvider.changeTab(currentTabIndex);
              Navigator.pop(context);
              widget.popFunc();

              setState(() {

              });
            },
          ),
          MenuWidget(
            title: "About",
            isSelected: pageProvider.currentTab == Tabs.About,
            onPress: (){
              currentTabIndex = appBarOptions.indexOf("About");
              pageProvider.changeTab(currentTabIndex);
              Navigator.pop(context);
              widget.popFunc();
              setState(() {

              });
            },
          ),
          MenuWidget(
            title: "Ballin Team",
            isSelected: pageProvider.currentTab == Tabs.Ballin_Team,
            onPress: (){
              currentTabIndex = appBarOptions.indexOf("Ballin Team");
              pageProvider.changeTab(currentTabIndex);
              Navigator.pop(context);
              widget.popFunc();
              setState(() {

              });
            },
          ),
          MenuWidget(
            title: "Get In Touch",
            isSelected: pageProvider.currentTab == Tabs.Get_in_Touch,
            onPress: (){
              currentTabIndex = appBarOptions.indexOf("Get In Touch");
              pageProvider.changeTab(currentTabIndex);
              Navigator.pop(context);
              widget.popFunc();
              setState(() {

              });
            },
          ),

        ],
      )
      ,
    );
  }
}
