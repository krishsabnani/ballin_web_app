import 'package:ballin_web_app/modules/home/data/services/page_provider.dart';
import 'package:ballin_web_app/modules/home/views/widgets/menu_widget.dart';
import 'package:ballin_web_app/utilities/app_text.dart';
import 'package:ballin_web_app/utilities/colors.dart';
import 'package:ballin_web_app/utilities/tabs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BallinAppBar extends StatefulWidget {
  Function popFunc;
  BallinAppBar({this.popFunc});
  @override
  _BallinAppBarState createState() => _BallinAppBarState();
}

class _BallinAppBarState extends State<BallinAppBar> {

  List<String> appBarOptions = ["Home","Shot Balls", "About","Ballin App"];
  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(30),
        elevation: 25,
        child: LayoutBuilder(
          builder: (ctx, constraints) {
            if(constraints.maxWidth > 700)
            return Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: ThemeColors.blackColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset("assets/images/logo_white.png",fit: BoxFit.contain,height: 75,width: 75,),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MenuWidget(
                        title: "Home",
                        isSelected: pageProvider.currentTab == Tabs.Home,
                        onPress: (){
                          currentTabIndex = appBarOptions.indexOf("Home");
                          pageProvider.changeTab(currentTabIndex);
                          widget.popFunc();
                          setState(() {

                          });
                        },
                      ),
                      MenuWidget(
                        title: "Shot Balls",
                        isSelected: pageProvider.currentTab == Tabs.Shot_Balls,
                        onPress: (){
                          currentTabIndex = appBarOptions.indexOf("Shot Balls");
                          pageProvider.changeTab(currentTabIndex);
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
                          widget.popFunc();
                          setState(() {

                          });
                        },
                      ),
                      MenuWidget(
                        title: "Ballin App",
                        isSelected: pageProvider.currentTab == Tabs.Ballin_App,
                        onPress: (){
                          currentTabIndex = appBarOptions.indexOf("Ballin App");
                          pageProvider.changeTab(currentTabIndex);
                          widget.popFunc();
                          setState(() {

                          });
                        },
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal:10),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:  BorderRadius.circular(10),
                            color: ThemeColors.highlightColor,
                          ),
                          padding: EdgeInsets.all(10),
                          child: AppText.Heading(text: "Get in Touch",color: ThemeColors.darkWhite,size: 16),
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
            else return Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: ThemeColors.blackColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset("assets/images/logo_white.png",fit: BoxFit.contain,height: 75,width: 75,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(icon: Icon(Icons.menu,color: ThemeColors.whiteColor,), onPressed: (){
                      Scaffold.of(context).openEndDrawer();
                    }),
                  )
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
