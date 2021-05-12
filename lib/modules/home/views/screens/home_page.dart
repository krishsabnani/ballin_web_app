import 'package:ballin_web_app/modules/home/data/services/blogs_provider.dart';
import 'package:ballin_web_app/modules/home/views/screens/blog_page.dart';
import 'package:ballin_web_app/modules/home/views/widgets/blog_card.dart';
import 'package:ballin_web_app/modules/home/views/widgets/footer.dart';
import 'package:ballin_web_app/utilities/app_text.dart';
import 'package:ballin_web_app/utilities/colors.dart';
import 'package:flutter/material.dart';
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
      padding: EdgeInsets.all(10),
      child: blogsProvider.isLoading ? CircularProgressIndicator():ListView(
        shrinkWrap: true,
        children: [
          AppText.Heading(text: "BLOGS",color: ThemeColors.blackColor,size: 24),
          Padding(
            padding: const EdgeInsets.all(10),
            child: LayoutBuilder(builder: (context,constraints){
              if(constraints.maxWidth > 700){
                return buildBlogs(0,blogsProvider);
              }
              else
              return buildBlogs(1,blogsProvider);
            }),
          ),
          SizedBox(height: 30,),
          AppText.Heading(text: "BLOGS",color: ThemeColors.blackColor,size: 24),
          Padding(
            padding: const EdgeInsets.all(10),
            child: LayoutBuilder(builder: (context,constraints){
              if(constraints.maxWidth > 700){
                return buildBlogs(0,blogsProvider);
              }
              else
                return buildBlogs(1,blogsProvider);
            }),
          ),
        ],
      )
    );
  }
  
  
  Widget buildBlogs(int type,BlogsProvider blogsProvider) {

      if(type == 0){
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(blogsProvider.blogs.length, (index) => Padding(
              padding:  EdgeInsets.symmetric(horizontal: 40),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(settings: RouteSettings(
                    name: "/Blog/${blogsProvider.blogs[index].id}"
                  ),
                      builder: (context) => BlogPage(blogsProvider.blogs[index])));
                },
                  child: BlogCard(blogsProvider.blogs[index])),
            )),
          ),
        );
      }
    else
      return ListView.separated(
        itemCount: blogsProvider.blogs.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: (context,index){
            return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(settings: RouteSettings(
                      name: "/Blog/${blogsProvider.blogs[index].id}"
                  ),
                      builder: (context) => BlogPage(blogsProvider.blogs[index])));
                },
                child: BlogCard(blogsProvider.blogs[index]));
      },
      separatorBuilder: (context,index){
          return SizedBox(height: 40,);
      },);
  }
}
