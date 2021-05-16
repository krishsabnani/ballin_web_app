import 'package:ballin_web_app/modules/home/data/models/blog_model.dart';
import 'package:ballin_web_app/modules/home/data/services/blogs_provider.dart';
import 'package:ballin_web_app/modules/home/views/widgets/ballin_app_bar.dart';
import 'package:ballin_web_app/modules/home/views/widgets/footer.dart';
import 'package:ballin_web_app/modules/home/views/widgets/side_drawer.dart';
import 'package:ballin_web_app/utilities/app_text.dart';
import 'package:ballin_web_app/utilities/colors.dart';
import 'package:ballin_web_app/utilities/screens/error_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BlogPage extends StatefulWidget {
  String blogId;
  BlogPage(this.blogId);
  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {


  @override
  void initState() {
    super.initState();
    BlogsProvider blogsProvider = Provider.of(context,listen: false);
    blogsProvider.getSingleBlog(widget.blogId);
  }

  @override
  Widget build(BuildContext context) {
    BlogsProvider blogsProvider = Provider.of(context);
    return Scaffold(
      endDrawer: SideDrawer(popFunc: (){
        Navigator.pop(context);
      },),
      appBar: PreferredSize(
        child: BallinAppBar(popFunc: (){
          Navigator.pop(context);
        },),
        preferredSize: Size.fromHeight(100),
      ),
      body: Container(
        child: blogsProvider.blogLoading ?Center(child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(ThemeColors.highlightColor),
        )):blogsProvider.currentBlog.id == null ?ErrorPage("Error 404"):ListView(
          padding: EdgeInsets.all(20),
          children: [
            LayoutBuilder(builder: (context,constraint){
              if(constraint.maxWidth > 700){
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 30,),
                    AppText.Heading(text: blogsProvider.currentBlog.title,size: 40,textAlign: TextAlign.center),
                    SizedBox(height: 15,),
                    AppText.Content(text: blogsProvider.currentBlog.desc,size: 13,textAlign: TextAlign.center,color: ThemeColors.subSecondaryColor),
                    SizedBox(height: 15,),
                    AppText.Content(text: "Written By "+ blogsProvider.currentBlog.author,size: 13,textAlign: TextAlign.center),
                    SizedBox(height: 15,),
                    AppText.Content(text: DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY).
                    format(DateTime.fromMillisecondsSinceEpoch(blogsProvider.currentBlog.timeStamp)),size: 13,textAlign: TextAlign.center,color: ThemeColors.subSecondaryColor),
                  ],
                );
              }
              else return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 20,),
                  AppText.Heading(text: blogsProvider.currentBlog.title,size: 28,textAlign: TextAlign.center),
                  SizedBox(height: 15,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10),
                    child: AppText.Content(text: blogsProvider.currentBlog.desc,size: 13,textAlign: TextAlign.center,color: ThemeColors.subSecondaryColor),
                  ),
                  SizedBox(height: 15,),
                  AppText.Content(text: "Written By "+ blogsProvider.currentBlog.author,size: 13,textAlign: TextAlign.center),
                  SizedBox(height: 15,),
                  AppText.Content(text: DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY).
                  format(DateTime.fromMillisecondsSinceEpoch(blogsProvider.currentBlog.timeStamp)),size: 13,textAlign: TextAlign.center,color: ThemeColors.subSecondaryColor),
                ],
              );
            }),
            SizedBox(height: 15,),
            LayoutBuilder(builder:(context,constraint){
              if(constraint.maxWidth > 700){
                return  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(blogsProvider.currentBlog.content.length, (index) => Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 105),
                      child: buildContent(blogsProvider.currentBlog.content[index]),
                    ))

                );
              }
              else return  Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(blogsProvider.currentBlog.content.length, (index) => Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 30),
                    child: buildContent(blogsProvider.currentBlog.content[index]),
                  ))

              );
            } ),
            SizedBox(height: 30,),
            Footer()
          ],
        ),
    ));
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
