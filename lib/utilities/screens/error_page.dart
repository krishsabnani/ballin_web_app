import 'package:flutter/material.dart';


class ErrorPage extends StatefulWidget {
  String error;
  ErrorPage(this.error);
  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
                child: Image.network("https://university.listenlights.com/wp-content/uploads/2017/08/70369302-error-wallpapers.jpeg")),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text("Refresh the page, or Try again Later...",style: TextStyle(color: Colors.white,
              fontSize: 20),),
            )
          ],
        ),
      ),
    );
  }
}
