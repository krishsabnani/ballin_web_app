import 'package:ballin_web_app/modules/home/data/models/blog_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BlogsProvider extends ChangeNotifier {


  List<BlogModel> generalBlogs = [];
  List<BlogModel> ballinBlogs = [];
  List<BlogModel> fitnessBlogs = [];
  List<BlogModel> _allBlogs = [];

  BlogModel currentBlog = BlogModel();

  bool isLoading = true;
  bool blogLoading = true;

  getBlogs([bool initial = false]) async {
    isLoading = true;
    initial ?null :notifyListeners();
    if(_allBlogs.isEmpty)
    await FirebaseFirestore.instance.collection("Blog").get().then((snap){
      snap.docs.forEach((element) {
        if(element.data()['type'] == 'Ballin'){
          ballinBlogs.add(BlogModel.fromJson(element.data()));
        }
        else if(element.data()['type'] == 'General'){
          generalBlogs.add(BlogModel.fromJson(element.data()));
        }
        else if(element.data()['type'] == 'Fitness'){
          fitnessBlogs.add(BlogModel.fromJson(element.data()));
        }
      });
    });
    _allBlogs.addAll(ballinBlogs);
    _allBlogs.addAll(generalBlogs);
    _allBlogs.addAll(fitnessBlogs);
    isLoading = false;
    notifyListeners();

  }


  getSingleBlog(String id) async {
    blogLoading = true;
    currentBlog = BlogModel();
    if(_allBlogs.isEmpty){
      await getBlogs(true);
      if(_allBlogs.indexWhere((element) => element.id == id) != -1)
      currentBlog = _allBlogs.firstWhere((element) => element.id == id);
    }
    else {
      if(_allBlogs.indexWhere((element) => element.id == id) != -1)
        currentBlog = _allBlogs.firstWhere((element) => element.id == id);
      await Future.delayed(Duration(seconds: 2),(){});
    }

    blogLoading = false;
    notifyListeners();
  }

  pushBlog()async{
    var docId = FirebaseFirestore.instance.collection('Blog').doc().id;
    print('start');
    await FirebaseFirestore.instance.collection('Blog').doc(docId).set(
        {
          "id": docId,
          "type": "Ballin",
          "title": "Why we do, what we do.",
          "desc": "The next time you get out, it will be different because there’s a community of ardent sports lovers waiting to welcome you with open arms.",
          "imgUrl": "https://ucsdnews.ucsd.edu/news_uploads/coping-with-coronavirus-stress.jpg",
          "likes": 10,
          "timeStamp": DateTime.now().millisecondsSinceEpoch,
          "author": "Chandni Menda",
          "readTime": 4,
          "content": [
            {
              "type": "image",
              "data": "https://ucsdnews.ucsd.edu/news_uploads/coping-with-coronavirus-stress.jpg"
            },
            {
              "type": "space",
              "data": "big"
            },
            {
              "type": "para",
              "data": "Covid-19 has majorly impacted the way children and adults engage in sports. Many people missed their prime years of training or even entry into the sports community. On a more basic level, it has affected the number of outdoor activities we usually engaged in. For so many of us, a fun game of tennis or badminton, an exciting squash sesh, or a football evening with friends was all we had to relax or unwind after a long week."
            },
            {
              "type": "space",
              "data": "small"
            },
            {
              "type": "para",
              "data": "While grassroots sports have physical benefits, they also calm our mind and improve our overall mental well-being. Team sports, taking responsibility, and following structure help build confidence and self-respect. Recreational sports have always focused on inclusive participation which has been a major part of a child’s growth and plays a huge role in the sports community."
            },
            {
              "type": "space",
              "data": "small"
            },
            {
              "type": "para",
              "data": "The past year has been the hardest and we haven’t had sports to go back to. While games and tournaments found a way to continue, recreational sports activities came to a halt. The recent decline did give us a chance to go back out there, safely of course, and remember what sports meant to us."
            },
            {
              "type": "space",
              "data": "small"
            },
            {
              "type": "para",
              "data": "However, the next time you get out, it will be different because there’s a community of ardent sports lovers waiting to welcome you with open arms. Ballin is an attempt to rebuild the community, give the people something to look forward to, and provide them with a platform to engage in sports. "
            },
            {
              "type": "space",
              "data": "small"
            },
            {
              "type": "para",
              "data": "We want to enhance the sports community with our platform and while you wait for things to get back to normal, we will keep you in close touch with the spirit of sports with our opinion, pieces, relatable interviews and wellness blogs."
            },
            {
              "type": "space",
              "data": "small"
            },
          ]
        }
    );
    print('done');
  }

}