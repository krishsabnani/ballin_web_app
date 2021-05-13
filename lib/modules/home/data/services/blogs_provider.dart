import 'package:ballin_web_app/modules/home/data/models/blog_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BlogsProvider extends ChangeNotifier {


  List<BlogModel> generalBlogs = [];
  List<BlogModel> ballinBlogs = [];
  List<BlogModel> fitnessBlogs = [];

  bool isLoading = true;

  getBlogs([bool initial = false]) async {
    isLoading = true;
    initial ?null :notifyListeners();
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
    isLoading = false;
    notifyListeners();

  }

}