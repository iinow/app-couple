import 'package:doing_app/screen/sign/screen/sign_up_page.dart';
import 'package:doing_app/screen/sign/screen/start_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: InkResponse(
          onTap: () {
//            Navigator.push(
//              context,
//              MaterialPageRoute<StartPage>(
//                  builder: (BuildContext context) => StartPage()),
//            );
            Navigator.push(
              context,
              MaterialPageRoute<StartPage>(
                  builder: (BuildContext context) => SignUpPage()),
            );
          },//SignUpPage
          child: Text("ㅇㄴㅁ"),
        ),
      ),
    );
  }
}
