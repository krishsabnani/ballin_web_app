
import 'package:ballin_web_app/modules/home/data/models/member_model.dart';
import 'package:ballin_web_app/utilities/tabs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PageProvider extends ChangeNotifier{


  int currentTabIndex = 0;
  Tabs currentTab = Tabs.Home;
  List<String> appBarOptions = ["Home","Shot Balls", "About","Ballin App","Get In Touch"];
  bool isLoading = true;
  bool isMembersLoading = true;
  dynamic aboutData = Map();
  List<MemberModel> members = [];


  changeTab(int index){
    currentTabIndex = index;
    switch(index){
      case 0 : currentTab = Tabs.Home;
      break;
      case 1 : currentTab = Tabs.Shot_Balls;
      break;
      case 2 : currentTab = Tabs.About;
      break;
      case 3 : currentTab = Tabs.Ballin_Team;
      break;
      case 4 : currentTab = Tabs.Get_in_Touch;
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

  getMembersContent([bool initial = false]) async {
    if(members.isEmpty){
      isMembersLoading = true;
      initial ?null:notifyListeners();
      
      await FirebaseFirestore.instance.collection("Info").doc("Ballin Team").collection("Members").orderBy('index').get()
      .then((snap){
        snap.docs.forEach((element) {
          members.add(MemberModel.fromJson(element.data()));
        });
      });
      await Future.delayed(Duration(seconds: 1),(){});
      isMembersLoading = false;
      notifyListeners();
    }
  }

  Future<bool> pushTouchInfo(Map<String,dynamic> data) async{
    try{
      await FirebaseFirestore.instance.collection("GetInTouch").add(data);
      return true;
    }
    catch(e){
      print(e);
      return false;
    }
  }



}