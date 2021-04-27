import 'package:doing_app/screen/sign/screen/sign_up_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _startPageState();
}

class _startPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 83,
            ),
            textSpace(text: "간편한 회원가입으로"),
            textSpace(
                text: "인기 데이트 코스를 한 눈에!",
                color: Color.fromRGBO(255, 48, 48, 1)),
            textSpace(
                text: "직접 만든 코스를 기록",
                fontWeight: FontWeight.bold,
                textWidget: textSpace(text: "하고")),
            textSpace(text: "공유해보세요!"),
            SizedBox(
              height: 32,
            ),
            Image.asset("assets/images/img_illust.png"),
            SizedBox(
              height: 48,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkResponse(
                  child: Image.asset(
                    "assets/images/btn_icon_login_google.png",
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<SignUpPage>(
                          builder: (BuildContext context) => SignUpPage()),
                    );
                  },
                ),
                InkResponse(
                  child: Image.asset(
//                  "assets/images/group_2.png",
                    "assets/images/btn_icon_login_kakao.png",
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<SignUpPage>(
                          builder: (BuildContext context) => SignUpPage()),
                    );
                  },
                ),
              ],
            ),
            Container(
//              margin: EdgeInsets.only(top: 14),
              child: Center(
                child: InkResponse(
                  onTap: () {
                    print(1);
                  },
                  child: Image.asset(
                    "assets/images/pop.png",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textSpace(
      {String text, Color color, FontWeight fontWeight, Widget textWidget}) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              text ?? "",
              style: TextStyle(
                  fontSize: 20,
                  color: color ?? Colors.black,
                  fontWeight: fontWeight ?? FontWeight.normal),
            ),
          ),
          textWidget ?? Container(),
        ],
      ),
    );
  }
}
