import 'package:ballin_web_app/modules/home/data/services/blogs_provider.dart';
import 'package:ballin_web_app/modules/home/data/services/page_provider.dart';
import 'package:ballin_web_app/modules/home/views/screens/blog_page.dart';
import 'package:ballin_web_app/modules/home/views/screens/home_page.dart';
import 'package:ballin_web_app/modules/home/views/screens/page_fork.dart';
import 'package:ballin_web_app/utilities/screens/error_page.dart';
import 'package:ballin_web_app/utilities/screens/loading_page.dart';
import 'package:ballin_web_app/utilities/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatefulWidget {
  // Create the initialization Future outside of `build`:
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PageProvider>(create: (_) => PageProvider()),
        ChangeNotifierProvider<BlogsProvider>(create: (_) => BlogsProvider())
      ],
      child: MaterialApp(
        title: "Ballin",
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings){
          List<String> appBarOptions = ["home","shotBalls", "about","ballinTeam"];
          var paths = settings.name.split("/");
          var basePath = '';
          var id = "";
          if(paths[1] == ""){
            basePath = "/";
          }
          else {
            basePath = paths[1];
            if(paths.length != 3){
              return MaterialPageRoute(settings: settings,builder: (_) => ErrorPage(""));
            }
            else id = paths[2];
          }

          print(settings.name);
          print(basePath);
          print(id);

          switch(basePath){
            case '/' : return MaterialPageRoute(settings: settings,builder: (_)=> PageFork());
            case 'blog' : return MaterialPageRoute(settings: settings,builder: (_) => BlogPage(id));
            default :
              Provider.of<PageProvider>(context,listen: false).changeTab(appBarOptions.indexOf(basePath));
              return MaterialPageRoute(settings: settings,builder: (_) => PageFork());
          }
        },
        home: FutureBuilder(
          // Initialize FlutterFire:
          future: _initialization,
          builder: (context, snapshot) {
            // Check for errors
            if (snapshot.hasError) {
              return ErrorPage("");
            }

            // Once complete, show your application
            if (snapshot.connectionState == ConnectionState.done) {
              return PageFork();
            }

            // Otherwise, show something whilst waiting for initialization to complete
            return LoadingPage();
          },
        ),
      ),
    );
  }
}