import 'package:doing_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpSucces extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 120,
            ),
            Center(
              child: Text(""),
            ),
            textSpace(text: "회원가입이 완료되었습니다.", color: Colors.red),
            textSpace(
              text: "이제 데이트는 두잉과 함께!",
            ),
            textSpace(
              text: "지금 바로 둘러볼까요?",
            ),
            SizedBox(
              height: 44,
            ),
            Container(
              margin: EdgeInsets.only(left: 70, right: 70),
              child: Stack(
                children: [
                  Image.asset("assets/images/img_illust_2.png"),
//                  registrationButton(context),
                ],
                //Image.asset("assets/images/main_base_img.png"),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: registrationButton(context),
    );
  }

  Widget registrationButton(BuildContext context) {
    return Container(
//      height: MediaQuery.of(context).size.height * 0.1,
      height: 64,
      margin: EdgeInsets.only(left: 12, right: 12, bottom: 40),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkResponse(
        onTap: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => MyHomePage()),
              (route) => false);
        },
        child: Center(
          child: Text(
            "시작하기",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
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
