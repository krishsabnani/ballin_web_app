import 'dart:ui';

import 'package:ballin_web_app/modules/home/data/services/page_provider.dart';
import 'package:ballin_web_app/modules/home/views/widgets/ballin_app_bar.dart';
import 'package:ballin_web_app/modules/home/views/widgets/footer.dart';
import 'package:ballin_web_app/modules/home/views/widgets/side_drawer.dart';
import 'package:ballin_web_app/utilities/app_text.dart';
import 'package:ballin_web_app/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {

  @override
  void initState() {
    super.initState();
    PageProvider pageProvider = Provider.of<PageProvider>(context,listen: false);
    pageProvider.getAboutUsContent(true);
  }

  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);
    return pageProvider.isLoading ? CircularProgressIndicator()
        :ListView(
        children: [
          LayoutBuilder(builder: (context,constraints){
            if(constraints.maxWidth > 700){
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("assets/images/Doodle.png"),
                  SizedBox(height: 20,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width:MediaQuery.of(context).size.width/2 -40,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText.SubHeading(text: "Who are we?",size: 24),
                              SizedBox(height: 10,),
                              AppText.Content(text: pageProvider.aboutData['para 3'])
                            ],
                          ),
                        ),
                        Image.network(pageProvider.aboutData['image 3'],height: 400,width: MediaQuery.of(context).size.width/2 - 40,),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.network(pageProvider.aboutData['image 2'],height: 400,width: MediaQuery.of(context).size.width/2 - 40,),
                        Container(
                          width:MediaQuery.of(context).size.width/2 -40,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText.SubHeading(text: "What we do?",size: 24),
                              SizedBox(height: 10,),
                              AppText.Content(text: pageProvider.aboutData['para 2'])
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            }
            else return Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("assets/images/Doodle.png"),
                  SizedBox(height: 20,),
                  Image.network(pageProvider.aboutData['image 3']),//,height: 400,),//width: MediaQuery.of(context).size.width/2 - 40,),
                  SizedBox(height: 20,),
                  AppText.SubHeading(text: "Who are we?",size: 24),
                  SizedBox(height: 10,),
                  AppText.Content(text: pageProvider.aboutData['para 3']),
                  SizedBox(height: 20,),
                  Image.network(pageProvider.aboutData['image 2']),//,height: 400,),//width: MediaQuery.of(context).size.width/2 - 40,),
                  SizedBox(height: 20,),
                  AppText.SubHeading(text: "What we do?",size: 24),
                  SizedBox(height: 10,),
                  AppText.Content(text: pageProvider.aboutData['para 2'])
                ],
              ),
            );
          }),
          SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.all(20),
            color: ThemeColors.blackColor,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppText.SubHeading(text: "Our Organization",color: ThemeColors.whiteColor,size: 24),
                SizedBox(height: 20,),
                Image.network(pageProvider.aboutData['image 1'],height: 300,),
                SizedBox(height: 20,),
                AppText.Content(text: pageProvider.aboutData['para 1'],color: ThemeColors.whiteColor),
              ],
            ),
          ),
          Footer()
        ],
      );
  }
}
