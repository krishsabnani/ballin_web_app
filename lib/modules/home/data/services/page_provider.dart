
import 'package:ballin_web_app/utilities/tabs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PageProvider extends ChangeNotifier{


  int currentTabIndex = 0;
  Tabs currentTab = Tabs.Home;
  List<String> appBarOptions = ["Home","Shot Balls", "About","Ballin App"];
  bool isLoading = true;
  dynamic aboutData = Map();


  changeTab(int index){
    currentTabIndex = index;
    switch(index){
      case 0 : currentTab = Tabs.Home;
      break;
      case 1 : currentTab = Tabs.Shot_Balls;
      break;
      case 2 : currentTab = Tabs.About;
      break;
      case 3 : currentTab = Tabs.Ballin_App;
      break;
      default: currentTab = Tabs.Home;
      break;
    }
    notifyListeners();
  }

  getAboutUsContent([bool initial = false]) async {
    print("reached");
    isLoading = true;
    print(aboutData);
      print("reached2");
      initial ? null :notifyListeners();
      await FirebaseFirestore.instance.collection("Info").doc("About Ballin").get().then((value){
        aboutData = value.data();
        print(value.data());
        print(aboutData);
      });
      print("reached3");
    isLoading = false;
    notifyListeners();
  }


}