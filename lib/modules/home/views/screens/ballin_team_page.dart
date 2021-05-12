import 'package:ballin_web_app/modules/home/data/services/page_provider.dart';
import 'package:ballin_web_app/modules/home/views/widgets/footer.dart';
import 'package:ballin_web_app/modules/home/views/widgets/memeber_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BallinTeamPage extends StatefulWidget {
  @override
  _BallinTeamPageState createState() => _BallinTeamPageState();
}

class _BallinTeamPageState extends State<BallinTeamPage> {

  @override
  void initState() {
    super.initState();
    PageProvider pageProvider = Provider.of<PageProvider>(context,listen: false);
    pageProvider.getMembersContent(true);
  }


  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);
    return Container(
      child: pageProvider.isMembersLoading ?
          CircularProgressIndicator():ListView(
        children: [
          Wrap(
                 spacing: 20,
                 runSpacing: 40,
                 children:  List.generate(pageProvider.members.length, (index) => MemberWidget(pageProvider.members[index])),
               ),
          Footer()
        ],
      ),
    );
  }
}
