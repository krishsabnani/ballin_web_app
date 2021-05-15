import 'package:ballin_web_app/modules/home/data/services/page_provider.dart';
import 'package:ballin_web_app/modules/home/views/screens/get_in_touch.dart';
import 'package:ballin_web_app/modules/home/views/widgets/menu_widget.dart';
import 'package:ballin_web_app/utilities/app_text.dart';
import 'package:ballin_web_app/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SideDrawer extends StatefulWidget {
  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {

  List<String> appBarOptions = ["Home","Shot Balls", "About","Ballin Team"];
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
            isSelected: currentTabIndex == appBarOptions.indexOf("Home"),
            onPress: (){
              currentTabIndex = appBarOptions.indexOf("Home");
              pageProvider.changeTab(currentTabIndex);
              setState(() {

              });
            },
          ),
          MenuWidget(
            title: "Shot Balls",
            isSelected: currentTabIndex == appBarOptions.indexOf("Shot Balls"),
            onPress: (){
              currentTabIndex = appBarOptions.indexOf("Shot Balls");
              pageProvider.changeTab(currentTabIndex);
              setState(() {

              });
            },
          ),
          MenuWidget(
            title: "About",
            isSelected: currentTabIndex == appBarOptions.indexOf("About"),
            onPress: (){
              currentTabIndex = appBarOptions.indexOf("About");
              pageProvider.changeTab(currentTabIndex);
              setState(() {

              });
            },
          ),
          MenuWidget(
            title: "Ballin Team",
            isSelected: currentTabIndex == appBarOptions.indexOf("Ballin Team"),
            onPress: (){
              currentTabIndex = appBarOptions.indexOf("Ballin Team");
              pageProvider.changeTab(currentTabIndex);
              setState(() {

              });
            },
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:10),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    settings: RouteSettings(name: 'get-in-touch'),
                    builder: (context)=>GetInTouch()));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:  BorderRadius.circular(10),
                  color: ThemeColors.highlightColor,
                ),
                padding: EdgeInsets.all(10),
                child: AppText.Heading(text: "Get in Touch",color: ThemeColors.darkWhite,size: 16),
              ),
            ),
          )
        ],
      )
      ,
    );
  }
}
