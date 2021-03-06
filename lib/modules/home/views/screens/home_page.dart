import 'package:ballin_web_app/modules/home/data/models/blog_model.dart';
import 'package:ballin_web_app/modules/home/data/services/blogs_provider.dart';
import 'package:ballin_web_app/modules/home/views/screens/blog_page.dart';
import 'package:ballin_web_app/modules/home/views/widgets/blog_card.dart';
import 'package:ballin_web_app/modules/home/views/widgets/footer.dart';
import 'package:ballin_web_app/utilities/app_text.dart';
import 'package:ballin_web_app/utilities/colors.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    BlogsProvider blogsProvider = Provider.of<BlogsProvider>(context,listen: false);
    blogsProvider.getBlogs(true);
  }
  @override
  Widget build(BuildContext context) {
    BlogsProvider blogsProvider = Provider.of<BlogsProvider>(context);
    return Container(
      //padding: EdgeInsets.all(10),
      child: blogsProvider.isLoading ? Center(child: CircularProgressIndicator()):ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Container(
            height: 200,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: (){
                       // blogsProvider.pushBlog();
                      },
                      child: AppText.SubHeading(text: 'Welcome to Ballin!', color: ThemeColors.whiteColor, size: 25)),
                  SizedBox(height: 20,),
                  AppText.Content(text: 'Stay safe. Stay home.', color: ThemeColors.whiteColor, size: 15),
                ],
              ),
            ),
            color: ThemeColors.blackColor,
          ),
          SizedBox(height: 15,),
       blogsProvider.ballinBlogs.isEmpty ? Center() : Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisAlignment: MainAxisAlignment.start,
         children: [
           Padding(
             padding: const EdgeInsets.fromLTRB(25, 10, 10, 10),
             child: AppText.Heading(text: "Ballin Blogs",color: ThemeColors.blackColor,size: 24),
           ),
           Padding(
             padding: const EdgeInsets.all(20),
             child: LayoutBuilder(builder: (context,constraints){
               if(constraints.maxWidth > 700){
                 return buildBlogs(0,blogsProvider.ballinBlogs);
               }
               else
                 return buildBlogs(1,blogsProvider.ballinBlogs);
             }),
           ),
         ],
       ),
          SizedBox(height: 30,),
          blogsProvider.generalBlogs.isEmpty ? Center() : Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
             Padding(
               padding: const EdgeInsets.fromLTRB(25, 10, 10, 10),
               child: AppText.Heading(text: "General Blogs",color: ThemeColors.blackColor,size: 24),
             ),
             Padding(
               padding: const EdgeInsets.all(20),
               child: LayoutBuilder(builder: (context,constraints){
                 if(constraints.maxWidth > 700){
                   return buildBlogs(0,blogsProvider.generalBlogs);
                 }
                 else
                   return buildBlogs(1,blogsProvider.generalBlogs);
               }),
             ),
           ],
         ),
          SizedBox(height: 30,),
          blogsProvider.fitnessBlogs.isEmpty ? Center() : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 10, 10, 10),
                child: AppText.Heading(text: "Fitness Blogs",color: ThemeColors.blackColor,size: 24),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 10, 10, 10),
                child: LayoutBuilder(builder: (context,constraints){
                  if(constraints.maxWidth > 700){
                    return buildBlogs(0,blogsProvider.fitnessBlogs);
                  }
                  else
                    return buildBlogs(1,blogsProvider.fitnessBlogs);
                }),
              ),
            ],
          )
        ],
      )
    );
  }
  
  
  Widget buildBlogs(int type,List<BlogModel> blogs) {

      if(type == 0){
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(blogs.length, (index) => Padding(
              padding:  EdgeInsets.symmetric(horizontal: 40),
              child: GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, "/blog/${blogs[index].id}");
                  FirebaseAnalytics().logEvent(name: 'view_blog', parameters: {
                    'blog_name' : blogs[index].title,
                    'type' : blogs[index].type,
                    'date' : DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY).format(DateTime.now())
                  });
                },
                  child: BlogCard(blogs[index])),
            )),
          ),
        );
      }
    else
      return ListView.separated(
        itemCount: blogs.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: (context,index){
            return GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, "/blog/${blogs[index].id}");
                  FirebaseAnalytics().logEvent(name: 'view_blog', parameters: {
                    'blog_name' : blogs[index].title,
                    'type' : blogs[index].type,
                    'date' : DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY).format(DateTime.now())
                  });
                },
                child: BlogCard(blogs[index]));
      },
      separatorBuilder: (context,index){
          return SizedBox(height: 40,);
      },);
  }
}
