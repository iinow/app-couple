import 'package:artemis/artemis.dart';
import 'package:doing_app/common/constants/environment_config.dart';
import 'package:doing_app/common/widgets/do_check_box.dart';
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
  bool checkAll = false;
  bool checkAge = false;
  bool checkTermsAndConditions = false;
  bool checkCollectPersonalInformation = false;
  bool checkMarketingUtilization = false;
  bool checkNickName = false;

  @override
  void initState() {
    nickNameTextEditingController.addListener(() {
      print("value: ${nickNameTextEditingController.text}");
      setState(() {});
    });
    super.initState();
  }

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
            line(
              margin: EdgeInsets.only(top: 24),
              color: HexColor.fromHex("#eeeeee"),
            ),
            SizedBox(
              height: 24,
            ),
            formAgree(
                this.checkAll,
                this.checkAge,
                this.checkTermsAndConditions,
                this.checkCollectPersonalInformation,
                this.checkMarketingUtilization),
            SizedBox(
              height: 44,
            ),
            btnRegistration(onTap: () {
              print("dkdjkd");
            }),
            // checkAgree(checkAge, "[필수] 만 14세 이상입니다."),
            // checkAgree(checkTermsAndConditions, "[필수] 이용 약관 동의"),
            // checkAgree(checkCollectPersonalInformation, "[필수] 개인정보 수집 및 이용 동의"),
            // checkAgree(checkMarketingUtilization, "[필수] 마케팅 이용 수신 동의"),
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
                child: InkWell(
                  onTap: () {
                    print("앨범, 카메라 열기");
                  },
                  child: Container(
                    child: Image.asset("assets/images/ico_camera.png"),
                  ),
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
          inputDuplicateNickName(),
        ],
      ),
    );
  }

  Widget btnRegistration({Function onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: HexColor.fromHex("#2cff3c3c"),
              offset: Offset(0, 10),
              blurRadius: 15,
              spreadRadius: 3,
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [HexColor.fromHex("#ff4f4f"), HexColor.fromHex("#ff2f2f")],
          ),
        ),
        height: 64,
        child: Center(
          child: Text(
            "가입완료",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  // Widget registrationButton() {
  //   return Container(
  //     height: 64,
  //     margin: EdgeInsets.only(left: 12, right: 12, top: 44, bottom: 40),
  //     decoration: BoxDecoration(
  //       color: Colors.red,
  //       borderRadius: BorderRadius.circular(10),
  //     ),
  //     child: InkResponse(
  //       onTap: () {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute<SignUpSucces>(
  //               builder: (BuildContext context) => SignUpSucces()),
  //         );
  //       },
  //       child: Center(
  //         child: Text(
  //           "가입완료",
  //           style: TextStyle(color: Colors.white, fontSize: 16),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget checkAgree(bool checkCondition, String text) {
  //   return Container(
  //     margin: EdgeInsets.only(left: 12),
  //     child: Row(
  //       children: [
  //         Checkbox(
  //             value: checkCondition,
  //             onChanged: (bool value) {
  //               setState(() {
  //                 print(value);
  //                 checkCondition = value;
  //               });
  //             }),
  //         Text(text),
  //         Expanded(child: Container()),
  //         Container(
  //             margin: EdgeInsets.only(right: 24),
  //             child: InkResponse(
  //               child: Text(
  //                 "보기",
  //                 style: TextStyle(decoration: TextDecoration.underline),
  //               ),
  //               onTap: () {},
  //             )),
  //       ],
  //     ),
  //   );
  // }

  Widget formAgree(
    bool checkAll,
    bool checkAge,
    bool checkTermsAndConditions,
    bool checkCollectPersonalInfomation,
    bool checkMarketingUtilzation,
  ) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 16,
              bottom: 16,
            ),
            child: DoCheckbox(
              value: checkAll,
              child: Container(
                margin: EdgeInsets.only(
                  left: 8,
                ),
                child: Text(
                  "모두 동의하기",
                  style: TextStyle(
                    fontSize: 14,
                    color: HexColor.fromHex("#242424"),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          line(
            color: HexColor.fromHex("#222222"),
            margin: EdgeInsets.only(
              bottom: 8,
            ),
          ),
          agreeContentItem(
            value: checkAge,
            title: "[필수] 만 14세 이상입니다.",
          ),
          agreeContentItem(
            value: checkTermsAndConditions,
            title: "[필수] 이용약관 동의",
          ),
          agreeContentItem(
              value: checkCollectPersonalInfomation,
              title: "[필수] 개인정보수집 및 이용 동의"),
          agreeContentItem(
            value: checkMarketingUtilzation,
            title: "[선택] 마케팅 이용 수신 동의",
          ),
        ],
      ),
    );
  }

  Widget agreeContentItem({bool value, String title, String link}) {
    return Container(
      padding: EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DoCheckbox(
              value: value,
              selectImage:
                  "assets/svgs/sign_up/buttons_toggle_check_btn_check_selected.svg",
              unselectImage:
                  "assets/svgs/sign_up/buttons_toggle_check_btn_check_unselected.svg",
              child: Container(
                margin: EdgeInsets.only(left: 8),
                child: Text(
                  title,
                  style: TextStyle(
                    color: HexColor.fromHex("#666666"),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  print("클릭");
                },
                child: Text(
                  "보기",
                  style: TextStyle(
                    color: HexColor.fromHex("#666666"),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget line({Color color, EdgeInsetsGeometry margin}) {
    return Container(
      child: Center(
        child: Container(
          margin: margin,
          width: MediaQuery.of(context).size.width * 1,
          color: color,
          height: 1,
        ),
      ),
    );
  }

  Widget inputDuplicateNickName() {
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
            child: Row(
              children: [
                Container(
                  child: this.checkNickName
                      ? SvgPicture.asset(
                          "assets/svgs/sign_up/buttons_toggle_check_btn_check_selected.svg",
                        )
                      : null,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: HexColor.fromHex("#110f24"),
                      ),
                      padding:
                          EdgeInsets.only(top: 6, left: 7, bottom: 6, right: 7),
                    ),
                    onPressed: () async {
                      if (nickNameTextEditingController.text.isEmpty) {
                        return;
                      }
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
                      setState(() {
                        this.checkNickName = !res.data.existNickName.exist;
                      });
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
          ),
        ],
      ),
    );
  }
}
