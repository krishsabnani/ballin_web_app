import 'package:ballin_web_app/modules/home/data/models/blog_model.dart';
import 'package:ballin_web_app/modules/home/views/widgets/ballin_app_bar.dart';
import 'package:ballin_web_app/modules/home/views/widgets/footer.dart';
import 'package:ballin_web_app/modules/home/views/widgets/side_drawer.dart';
import 'package:ballin_web_app/utilities/app_text.dart';
import 'package:ballin_web_app/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BlogPage extends StatefulWidget {
  BlogModel blogModel;
  BlogPage(this.blogModel);
  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: SideDrawer(),
      appBar: PreferredSize(
        child: BallinAppBar(popFunc: (){
          Navigator.pop(context);
        },),
        preferredSize: Size.fromHeight(100),
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            LayoutBuilder(builder: (context,constraint){
              if(constraint.maxWidth > 700){
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppText.Heading(text: widget.blogModel.title,size: 40,textAlign: TextAlign.center),
                    SizedBox(height: 15,),
                    AppText.Content(text: widget.blogModel.desc,size: 13,textAlign: TextAlign.center,color: ThemeColors.subSecondaryColor),
                    SizedBox(height: 15,),
                    AppText.Content(text: "Written By "+ widget.blogModel.author,size: 13,textAlign: TextAlign.center),
                    SizedBox(height: 15,),
                    AppText.Content(text: DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY).
                    format(DateTime.fromMillisecondsSinceEpoch(widget.blogModel.timeStamp)),size: 13,textAlign: TextAlign.center,color: ThemeColors.subSecondaryColor),
                  ],
                );
              }
              else return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppText.Heading(text: widget.blogModel.title,size: 28,textAlign: TextAlign.center),
                  SizedBox(height: 15,),
                  AppText.Content(text: widget.blogModel.desc,size: 13,textAlign: TextAlign.center,color: ThemeColors.subSecondaryColor),
                  SizedBox(height: 15,),
                  AppText.Content(text: "Written By "+ widget.blogModel.author,size: 13,textAlign: TextAlign.center),
                  SizedBox(height: 15,),
                  AppText.Content(text: DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY).
                  format(DateTime.fromMillisecondsSinceEpoch(widget.blogModel.timeStamp)),size: 13,textAlign: TextAlign.center,color: ThemeColors.subSecondaryColor),
                ],
              );
            }),
            SizedBox(height: 15,),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(widget.blogModel.content.length, (index) => Padding(
                padding:  EdgeInsets.symmetric(horizontal: 30),
                child: buildContent(widget.blogModel.content[index]),
              ))

            ),
            SizedBox(height: 15,),
            Footer()
          ],
        ),
      ),
    );
  }

  Widget buildContent(Content content){
    switch(content.type){
      case "image" :  return Image.network(content.data,fit: BoxFit.contain,);
        break;
      case "para" :   return AppText.Blog(text: content.data,size: 16,textAlign: TextAlign.left);
        break;
      case "sub" :    return AppText.SubHeading(text: content.data,size: 22,textAlign: TextAlign.left);
        break;
      case "space" :  switch(content.data){
        case "small" : return SizedBox(height: 20,);
        break;
        case "big" : return SizedBox(height: 40,);
        break;
        default: return SizedBox(height: 20,);
        break;
      }
        break;
      default: return SizedBox(height: 20,);
        break;
    }
  }

}
