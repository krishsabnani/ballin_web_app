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
    initial ? null : notifyListeners();
    if (_allBlogs.isEmpty)
      await FirebaseFirestore.instance.collection("Blog").get().then((snap) {
        snap.docs.forEach((element) {
          if (element.data()['type'] == 'Ballin') {
            ballinBlogs.add(BlogModel.fromJson(element.data()));
          } else if (element.data()['type'] == 'General') {
            generalBlogs.add(BlogModel.fromJson(element.data()));
          } else if (element.data()['type'] == 'Fitness') {
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
    if (_allBlogs.isEmpty) {
      await getBlogs(true);
      if (_allBlogs.indexWhere((element) => element.id == id) != -1)
        currentBlog = _allBlogs.firstWhere((element) => element.id == id);
    } else {
      if (_allBlogs.indexWhere((element) => element.id == id) != -1)
        currentBlog = _allBlogs.firstWhere((element) => element.id == id);
      await Future.delayed(Duration(seconds: 2), () {});
    }

    blogLoading = false;
    notifyListeners();
  }

  pushBlog() async {
    var id = FirebaseFirestore.instance.collection("Blog").doc().id;
    var data = {
      "id": id,
      "type": "Ballin",
      "title": "When lockdown ended, I wanted to be ready",
      "desc": "An Interview with Sainath Arjun",
      "imgUrl":
          "https://firebasestorage.googleapis.com/v0/b/ballin-1478.appspot.com/o/Blogs%2FBlog2%2FBlog2_1.jpeg?alt=media&token=99195261-3fad-4e16-9",
      "likes": 10,
      "timeStamp": DateTime.now().millisecondsSinceEpoch,
      "author": "Anantaajith Ra",
      "readTime": 5,
      "content": [
        {
          "type": "image",
          "data":
              "https://firebasestorage.googleapis.com/v0/b/ballin-1478.appspot.com/o/Blogs%2FBlog2%2FBlog2_1.jpeg?alt=media&token=99195261-3fad-4e16-9"
        },
        {"type": "space", "data": "big"},
        {
          "type": "para",
          "data":
              "The COVID-19 pandemic continues to ravage the world in May 2021, with India specifically facing the brunt of the impact in an unprecedented second wave. With the country spontaneously entering and exiting lockdowns since March 2020, the public have been forced to continue all their activity within four walls. This shift has particularly been difficult for young athletes who, after sweating it out regularly on the field and in the gym, suddenly found themselves stuck at home. Apart from figuring out ways to continue their workouts in their bedrooms, the struggle to stay motivated and retain the fire within to excel in their arena are also very real problems they encountered."
        },
        {"type": "space", "data": "small"},
        {"type": "para", "data": "We spoke to Sainath Arjun, a dedicated football player and third-year student from SRM University, Chennai about his experiences from the last two years to unravel some of these struggles."},
        {"type": "space", "data": "big"},
        {"type": "sub", "data": "Physically and emotionally, what would you say were some of the biggest challenges you’ve faced due to COVID-19?"},
        {"type": "space", "data": "small"},
        {
          "type": "para",
          "data":"“Last year, I trained for 4-5 months by myself. It felt like I was going crazy! It’s already difficult to train individually as a football player, but during the lockdown, you tend to lose motivation and it becomes very mundane. Once the restrictions were loosened, it became better. But you do go through these periods where you lack that drive from within – you just have to keep finding a way to get out of bed and push yourself.”"
        },
        {"type": "space", "data": "big"},
        {"type": "sub", "data": "In such cases, how do you really motivate yourself?"},
        {"type": "space", "data": "small"},
        {
          "type": "para",
          "data": "“I just constantly looked forward to the future because I was sure I wasn’t the only one going through this. When lockdown ended, I wanted to be ready and be better than the rest.”"
        },
        {"type": "space", "data": "big"},
        {"type": "sub", "data": "With classes transitioning online, did you feel balancing academics and fitness became a bit easier or has it personally not changed much for you?"},
        {"type": "space", "data": "small"},
        {
          "type": "para",
          "data" : "“I think online classes have definitely been more beneficial. With offline classes, I used to wake up at 4:30 am, attend practice and then go to college at 8:30, which would mean missing the first hour. But now, I can get a little more rest and I just log in to the class and then practice alone in the ground. That’s what allowed me to go to Delhi for a camp as well, because I don’t think it would have been possible with offline classes.”"
        },
        {"type": "space", "data": "big"},
        {
          "type": "image",
          "data":
              "https://firebasestorage.googleapis.com/v0/b/ballin-1478.appspot.com/o/Blogs%2FBlog2%2FBlog2_2.jpeg?alt=media&token=beaed74c-0374-46d1-bd2b-13c1bac8c923"
        },
        {"type": "space", "data": "big"},
        {"type": "sub", "data": "How would you describe the trials you attended at Delhi? Were there any significant differences given that the camp took place during a pandemic?"},
        {"type": "space", "data": "small"},
        {
          "type": "para",
          "data" : "“I went for the camp in February 2021, so there weren’t very strict restrictions except having to wear our mask most of the time. I don’t think there were many differences because we trained as usual, though I felt I wasn’t fully prepared for the camp’s intensity levels. I struggled a bit for the first few days, but then I somehow adapted to the situation and managed to play well. It also helped that many others faced the same issues because many of them trained alone. But some people from places like Manipur and Philippines, were able to play with their teams for much longer due to less stricter lockdowns. All of us went through very different scenarios before meeting at the camp.”"
        },
        {"type": "space", "data": "big"},
        {"type": "sub", "data": "In the last year or so, we’ve just been repeatedly going into lockdowns and exiting them. From your experiences, what would you say are some of the learning curves you’ve picked up during the COVID-19 pandemic?"},
        {"type": "space", "data": "small"},
        {
          "type": "para",
          "data" : "“I think, as an athlete, I would just say pull yourself through no matter what. Constantly push yourself to be better than everyone else because you never know when an opportunity will present itself.”"
        },
        {"type": "space", "data": "big"},
        {
          "type": "para",
          "data" : "Sainath’s learning experiences can also be guidelines we should follow as we continue to battle the COVID-19 pandemic. Strive to excel and never lose faith in your abilities. When opportunities eventually arrive, you’ll grasp it with both hands even if the odds are stacked against you!"
        },
        {"type": "space", "data": "big"},
      ]
    };

    await FirebaseFirestore.instance.collection("Blog").doc(id).set(data);
    print("Done");
  }
}
