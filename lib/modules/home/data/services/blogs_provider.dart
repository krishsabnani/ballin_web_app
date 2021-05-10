import 'package:ballin_web_app/modules/home/data/models/blog_model.dart';
import 'package:flutter/material.dart';

class BlogsProvider extends ChangeNotifier {


  List<BlogModel> blogs = [];

  bool isLoading = true;

  getBlogs([bool initial = false]) async {
    isLoading = true;
    initial ?null :notifyListeners();
    for(int i =0; i<7;i++){
      blogs.add(BlogModel.fromJson({
        "id": (i+1).toString(),
        "type": "Ballin",
        "title": "Coping up after Covid-19 in his prime",
        "desc": "The Earl of East founders have created a modern but cozy home with an understated, down-to-earth cool",
        "imgUrl": "https://ucsdnews.ucsd.edu/news_uploads/coping-with-coronavirus-stress.jpg",
        "likes": 10,
        "timeStamp": DateTime.now().millisecondsSinceEpoch,
        "author": "Darshan Srinivasan",
        "readTime": 5,
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
            "data": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras enim leo, eleifend at pharetra at, scelerisque at tortor. Quisque interdum imperdiet leo quis auctor. Cras vel dolor porta, dictum turpis at, vehicula ligula. Ut convallis, augue quis aliquam cursus, lectus sapien placerat justo, mattis vehicula justo augue nec ipsum. Cras nisl justo, blandit non varius id, pulvinar vitae diam. Cras nisi lacus, lobortis quis turpis in, ornare ornare tortor. Sed ultrices molestie felis, sed vestibulum ligula cursus eget. Donec vehicula magna in euismod accumsan. Vivamus ac magna orci. Aliquam euismod, nunc ac volutpat iaculis, nibh orci porta quam, sit amet elementum nisi odio vitae enim. Phasellus tempus mollis felis vel lacinia. Nulla ultrices tortor vitae varius tempor. Fusce eu nibh nec diam commodo rutrum."
          },
          {
            "type": "space",
            "data": "big"
          },
          {
            "type": "sub",
            "data": "Sub Title 1"
          },
          {
            "type": "space",
            "data": "small"
          },
          {
            "type": "para",
            "data": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras enim leo, eleifend at pharetra at, scelerisque at tortor. Quisque interdum imperdiet leo quis auctor. Cras vel dolor porta, dictum turpis at, vehicula ligula. Ut convallis, augue quis aliquam cursus, lectus sapien placerat justo, mattis vehicula justo augue nec ipsum. Cras nisl justo, blandit non varius id, pulvinar vitae diam. Cras nisi lacus, lobortis quis turpis in, ornare ornare tortor. Sed ultrices molestie felis, sed vestibulum ligula cursus eget. Donec vehicula magna in euismod accumsan. Vivamus ac magna orci. Aliquam euismod, nunc ac volutpat iaculis, nibh orci porta quam, sit amet elementum nisi odio vitae enim. Phasellus tempus mollis felis vel lacinia. Nulla ultrices tortor vitae varius tempor. Fusce eu nibh nec diam commodo rutrum."
          },
          {
            "type": "space",
            "data": "small"
          },
          {
            "type": "para",
            "data": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras enim leo, eleifend at pharetra at, scelerisque at tortor. Quisque interdum imperdiet leo quis auctor. Cras vel dolor porta, dictum turpis at, vehicula ligula. Ut convallis, augue quis aliquam cursus, lectus sapien placerat justo, mattis vehicula justo augue nec ipsum. Cras nisl justo, blandit non varius id, pulvinar vitae diam. Cras nisi lacus, lobortis quis turpis in, ornare ornare tortor. Sed ultrices molestie felis, sed vestibulum ligula cursus eget. Donec vehicula magna in euismod accumsan. Vivamus ac magna orci. Aliquam euismod, nunc ac volutpat iaculis, nibh orci porta quam, sit amet elementum nisi odio vitae enim. Phasellus tempus mollis felis vel lacinia. Nulla ultrices tortor vitae varius tempor. Fusce eu nibh nec diam commodo rutrum."
          },
        ]
      }));
    }
    await Future.delayed(Duration(seconds: 3),(){});

    isLoading = false;
    notifyListeners();

  }

}