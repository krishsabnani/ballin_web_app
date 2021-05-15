import 'package:ballin_web_app/modules/home/data/services/page_provider.dart';
import 'package:ballin_web_app/modules/home/views/screens/get_in_touch.dart';
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

  List<String> appBarOptions = ["Home","Ballin Shots", "About","Ballin Team"];
  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Material(
        //borderRadius: BorderRadius.circular(30),
        elevation: 25,
        child: LayoutBuilder(
          builder: (ctx, constraints) {
            if(constraints.maxWidth > 700)
            return Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                //borderRadius: BorderRadius.circular(30),
                color: ThemeColors.blackColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                        onTap: (){
                          currentTabIndex = appBarOptions.indexOf("Home");
                          pageProvider.changeTab(currentTabIndex);
                          widget.popFunc();
                          setState(() {

                          });
                        },
                        child: Image.asset("assets/images/logo_white.png",fit: BoxFit.contain,height: 75,width: 75,)),
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
                        title: "Ballin Shots",
                        isSelected: pageProvider.currentTab == Tabs.Shot_Balls,
                        onPress: (){
                          currentTabIndex = appBarOptions.indexOf("Ballin Shots");
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
                        title: "Ballin Team",
                        isSelected: pageProvider.currentTab == Tabs.Ballin_Team,
                        onPress: (){
                          currentTabIndex = appBarOptions.indexOf("Ballin Team");
                          pageProvider.changeTab(currentTabIndex);
                          widget.popFunc();
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
                ],
              ),
            );
            else return Container(
              //padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
              //  borderRadius: BorderRadius.circular(30),
                color: ThemeColors.blackColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset("assets/images/logo_white.png",fit: BoxFit.contain,height: 65,width: 65,),
                  ),
                  /*Padding(
                    padding: EdgeInsets.all(10.0),
                    child: AppText.SubContent(text: 'Ballin', color: Colors.white, size: 30),
                  ),*/
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
