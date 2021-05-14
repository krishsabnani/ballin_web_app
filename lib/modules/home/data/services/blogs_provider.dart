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

}