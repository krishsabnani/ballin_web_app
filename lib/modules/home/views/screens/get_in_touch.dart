import 'package:ballin_web_app/modules/home/views/widgets/ballin_app_bar.dart';
import 'package:ballin_web_app/modules/home/views/widgets/footer.dart';
import 'package:ballin_web_app/modules/home/views/widgets/side_drawer.dart';
import 'package:flutter/material.dart';

class GetInTouch extends StatefulWidget {
  @override
  _GetInTouchState createState() => _GetInTouchState();
}

class _GetInTouchState extends State<GetInTouch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: SideDrawer(),
      appBar: PreferredSize(
        child: BallinAppBar(
          popFunc: () {
            Navigator.pop(context);
          },
        ),
        preferredSize: Size.fromHeight(100),
      ),
      body: ListView(
        children: [
          Footer()
        ],
      ),
    );
  }
}
