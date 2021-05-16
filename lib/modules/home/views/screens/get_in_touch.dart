import 'package:ballin_web_app/modules/home/data/services/page_provider.dart';
import 'package:ballin_web_app/modules/home/views/widgets/ballin_app_bar.dart';
import 'package:ballin_web_app/modules/home/views/widgets/footer.dart';
import 'package:ballin_web_app/modules/home/views/widgets/side_drawer.dart';
import 'package:ballin_web_app/utilities/app_text.dart';
import 'package:ballin_web_app/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GetInTouch extends StatefulWidget {
  @override
  _GetInTouchState createState() => _GetInTouchState();
}



class _GetInTouchState extends State<GetInTouch> {


  String name,email,number,reason;
  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);
    return Scaffold(
      endDrawer: SideDrawer(),
      appBar: PreferredSize(
        child: BallinAppBar(
          popFunc: () {
            Navigator.pop(context);
          },
        ),
        preferredSize: Size.fromHeight(100),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child:  LayoutBuilder(builder: (context,constraints){
              if(constraints.maxWidth > 700){
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 20,),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width:MediaQuery.of(context).size.width/2 -40,
                            child: Padding(
                              padding:  EdgeInsets.only(right: 35),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText.SubHeading(text: "Get in touch",size: 24),
                                  SizedBox(height: 20,),
                                  AppText.SubHeading(text: "Name",size: 15),
                                  SizedBox(height: 10,),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                      ),
                                    ),
                                    onChanged: (val){
                                      name = val;
                                    },
                                  ),
                                  SizedBox(height: 20,),
                                  AppText.SubHeading(text: "Email",size: 15),
                                  SizedBox(height: 10,),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                      ),
                                    ),
                                    onChanged: (val){
                                      email = val;
                                    },
                                  ),
                                  SizedBox(height: 20,),
                                  AppText.SubHeading(text: "Contact Number",size: 15),
                                  SizedBox(height: 10,),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                      ),
                                    ),
                                    onChanged: (val){
                                      number = val;
                                    },
                                  ),
                                  SizedBox(height: 20,),
                                  AppText.SubHeading(text: "Reason for connecting",size: 15),
                                  SizedBox(height: 10,),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                      ),
                                    ),
                                    onChanged: (val){
                                      reason = val;
                                    },
                                  ),
                                  SizedBox(height: 20,),
                                 GestureDetector(
                                   onTap: (){
                                     //pageProvider.queryMail('darshans.theclimber@gmail.com', 'Ram', '2398579857', 'Call me');
                                   },
                                   child: Container(
                                     color: ThemeColors.highlightColor,
                                     child: Center(
                                     child: Padding(
                                     padding:  EdgeInsets.symmetric(vertical: 15),
                                     child: AppText.SubHeading(text: 'Submit', color: ThemeColors.whiteColor),
                                     ),
                                   ),
                                   ),
                                 )
                                ],
                              ),
                            ),
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width/2 - 40,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText.SubHeading(text: 'Why connect with us?', color: ThemeColors.blackColor, size: 30),
                                  SizedBox(height: 10,),
                                  AppText.Content(text: 'Are you someone with the same vision and passion as us? Get in touch right away!'),
                                  SizedBox(height: 30,),
                                  AppText.SubHeading(text: 'Become a writer', color: ThemeColors.blackColor, size: 18),
                                  SizedBox(height: 10,),
                                  AppText.Content(text: 'Are you someone who can put all the flowing passion into words? This is for you.'),
                                  SizedBox(height: 10,),
                                  AppText.SubHeading(text: 'Contribute to us', color: ThemeColors.blackColor, size: 18),
                                  SizedBox(height: 10,),
                                  AppText.Content(text: 'Are you someone/know someone who bleeds sports. Get in touch and we will spread the passion.'),
                                  SizedBox(height: 10,),
                                  AppText.SubHeading(text: 'Onboard your venue', color: ThemeColors.blackColor, size: 18),
                                  SizedBox(height: 10,),
                                  AppText.Content(text: 'Get in touch to onboard your venue on our app. Service will begin post lockdown.')
                                ],
                              )
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
              else return Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppText.SubHeading(text: 'Why connect with us?', color: ThemeColors.blackColor, size: 30),
                    SizedBox(height: 10,),
                    AppText.Content(text: 'Are you someone with the same vision and passion as us? Get in touch right away!'),
                    SizedBox(height: 30,),
                    AppText.SubHeading(text: 'Become a writer', color: ThemeColors.blackColor, size: 18),
                    SizedBox(height: 10,),
                    AppText.Content(text: 'Are you someone who can put all the flowing passion into words? This is for you.'),
                    SizedBox(height: 10,),
                    AppText.SubHeading(text: 'Contribute to us', color: ThemeColors.blackColor, size: 18),
                    SizedBox(height: 10,),
                    AppText.Content(text: 'Are you someone/know someone who bleeds sports. Get in touch and we will spread the passion.'),
                    SizedBox(height: 10,),
                    AppText.SubHeading(text: 'Onboard your venue', color: ThemeColors.blackColor, size: 18),
                    SizedBox(height: 10,),
                    AppText.Content(text: 'Get in touch to onboard your venue on our app. Service will begin post lockdown.'),
                    SizedBox(height: 30,),
                    AppText.SubHeading(text: "Get in touch",size: 24),
                    SizedBox(height: 20,),
                    AppText.SubHeading(text: "Name",size: 15),
                    SizedBox(height: 10,),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                        ),
                      ),
                      onChanged: (val){
                        name = val;
                      },
                    ),
                    SizedBox(height: 20,),
                    AppText.SubHeading(text: "Email",size: 15),
                    SizedBox(height: 10,),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                        ),
                      ),
                      onChanged: (val){
                        email = val;
                      },
                    ),
                    SizedBox(height: 20,),
                    AppText.SubHeading(text: "Contact Number",size: 15),
                    SizedBox(height: 10,),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                        ),
                      ),
                      onChanged: (val){
                        number = val;
                      },
                    ),
                    SizedBox(height: 20,),
                    AppText.SubHeading(text: "Reason for connecting",size: 15),
                    SizedBox(height: 10,),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                        ),
                      ),
                      onChanged: (val){
                        reason = val;
                      },
                    ),
                    SizedBox(height: 20,),
                    FlatButton(onPressed: (){

                    },
                        color: ThemeColors.highlightColor,

                        child: Center(
                          child: Padding(
                            padding:  EdgeInsets.symmetric(vertical: 15),
                            child: AppText.SubHeading(text: 'Submit', color: ThemeColors.whiteColor),
                          ),
                        ))
                  ],
                ),
              );
            }),
          ),
          Footer()
        ],
      ),
    );
  }
}
