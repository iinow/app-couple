import 'package:artemis/artemis.dart';
import 'package:doing_app/common/constants/environment_config.dart';
import 'package:doing_app/common/widgets/hex_color.dart';
import 'package:doing_app/graphql/generated/doing.query.dart';
import 'package:doing_app/screen/sign/screen/sign_up_succes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
      backgroundColor: HexColor.fromHex("#f7f7f8"),
      body: Container(
        child: SingleChildScrollView(
          child: main(),
        ),
      ),
    );
  }

  Widget main() {
    return Container(
      alignment: Alignment.center,
      child: Container(
        width: 312,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            formProfileImage(),
            formDuplicateUserNickName(),
            SizedBox(
              height: 24,
            ),
            // allAgree(),
            // Center(
            //   child: Container(
            //     width: MediaQuery.of(context).size.width * 1,
            //     margin: EdgeInsets.only(left: 24, right: 24),
            //     color: Colors.black,
            //     height: 1,
            //   ),
            // ),
            // checkAgree(checkAge, "[필수] 만 14세 이상입니다."),
            // checkAgree(checkTermsAndConditions, "[필수] 이용 약관 동의"),
            // checkAgree(checkCollectPersonalInformation, "[필수] 개인정보 수집 및 이용 동의"),
            // checkAgree(checkMarketingUtilization, "[필수] 마케팅 이용 수신 동의"),
            // registrationButton(),
          ],
        ),
      ),
    );
  }

  Widget formProfileImage() {
    return Container(
      padding: EdgeInsets.only(top: 133, bottom: 47),
      child: LayoutBuilder(
        builder: (context, contraints) {
          return Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.center,
            children: [
              Center(
                child: Container(
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: HexColor.fromHex("#19000000"),
                        spreadRadius: 0,
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      )
                    ],
                  ),
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    "assets/svgs/sign_up/img_profile_large_default.svg",
                    height: 80,
                    width: 80,
                  ),
                ),
              ),
              Positioned(
                // bottom: 0,
                right: contraints.constrainWidth() / 2 - 80,
                top: 50,
                // left: 59.7,
                child: Container(
                  child: Image.asset("assets/images/ico_camera.png"),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget formDuplicateUserNickName() {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: 24,
            child: Text(
              "사용자 닉네임",
              style: TextStyle(
                fontSize: 14,
                color: HexColor.fromHex("#242424"),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          btnDuplicateNickName(),
        ],
      ),
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

  Widget btnDuplicateNickName() {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
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
                  hintStyle: TextStyle(
                    color: HexColor.fromHex("#bbbbbb"),
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: HexColor.fromHex("#110f24"),
                ),
                padding: EdgeInsets.only(top: 6, left: 7, bottom: 6, right: 7),
              ),
              onPressed: () async {
                var client = ArtemisClient(EnvironmentConfig.url);
                final res = await client.execute(
                  ExistNickNameQuery(
                    variables: ExistNickNameArguments(
                      existNickNameInput: ExistNickNameInput(
                        nickName: nickNameTextEditingController.text,
                      ),
                    ),
                  ),
                );
                print(res.data.existNickName.exist);
              },
              child: Text(
                "중복확인",
                style: TextStyle(
                  fontSize: 14,
                  color: HexColor.fromHex("#110f24"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
