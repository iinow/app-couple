import 'package:doing_app/screen/sign/screen/sign_up_succes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nickNameTextEditingController = TextEditingController();
  bool checkTest = false;
  bool checkAge = false;
  bool checkTermsAndConditions = false;
  bool checkCollectPersonalInformation = false;
  bool checkMarketingUtilization = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
//      appBar: AppBar(),
      body: Container(
        child: SingleChildScrollView(child: test()),
      ),
    );
  }

  Widget test() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 130,
        ),
        Stack(
//        alignment = AlignmentDirectional.topStart,
          alignment: AlignmentDirectional.center,
          children: [
            Center(
//              child: Image.asset(""),
              child: Container(
                width: 80,
                height: 80,
                color: Colors.black,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 80, top: 80),
              color: Colors.redAccent,
              height: 40,
              width: 40,
            ),
          ],
        ),
        SizedBox(
          height: 47,
        ),
        Container(
          padding: EdgeInsets.only(left: 24),
          child: Text(
            "사용자 닉네임",
            style: TextStyle(fontSize: 14),
          ),
        ),
        checkNickName(),
        SizedBox(
          height: 24,
        ),
        Container(
          color: Colors.black,
          height: 1,
        ),
        SizedBox(
          height: 24,
        ),
        allAgree(),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 1,
            margin: EdgeInsets.only(left: 24, right: 24),
            color: Colors.black,
            height: 1,
          ),
        ),
        checkAgree(checkAge, "[필수] 만 14세 이상입니다."),
        checkAgree(checkTermsAndConditions, "[필수] 이용 약관 동의"),
        checkAgree(checkCollectPersonalInformation, "[필수] 개인정보 수집 및 이용 동의"),
        checkAgree(checkMarketingUtilization, "[필수] 마케팅 이용 수신 동의"),
        registrationButton(),
      ],
    );
  }

  Widget registrationButton() {
    return Container(
//      height: MediaQuery.of(context).size.height * 0.1,
      height: 64,
      margin: EdgeInsets.only(left: 12, right: 12, top: 44, bottom: 40),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkResponse(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute<SignUpSucces>(
                builder: (BuildContext context) => SignUpSucces()),
          );
        },
        child: Center(
          child: Text(
            "가입완료",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }

  Widget checkAgree(bool checkCondition, String text) {
    return Container(
      margin: EdgeInsets.only(left: 12),
      child: Row(
        children: [
          Checkbox(
              value: checkCondition,
              onChanged: (bool value) {
                setState(() {
                  print(value);
                  checkCondition = value;
                });
              }),
          Text(text),
          Expanded(child: Container()),
          Container(
              margin: EdgeInsets.only(right: 24),
              child: InkResponse(
                child: Text(
                  "보기",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
                onTap: () {},
              )),
        ],
      ),
    );
  }

  Widget allAgree() {
    return Container(
      margin: EdgeInsets.only(
        left: 12,
      ),
      child: Row(
        children: [
          Checkbox(
              value: checkTest,
              onChanged: (bool value) {
                setState(() {
                  checkTest = value;
                  checkAge = value;
                  checkTermsAndConditions = value;
                  checkCollectPersonalInformation = value;
                  checkMarketingUtilization = value;
                });
              }),
          Container(
            child: Text("모두 동의하기"),
          ),
        ],
      ),
    );
  }

  Widget checkNickName() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
//            color: Colors.black
      ),
//          color: Colors.black,
      margin: EdgeInsets.only(left: 24, right: 24),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 24),
              child: TextField(
                controller: nickNameTextEditingController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "2자 ~ 10자로 입력해주세요.",
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 8),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(width: 1.5, color: Colors.black),
              ),
              onPressed: () {},
              child: Text(
                "중복확인",
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
