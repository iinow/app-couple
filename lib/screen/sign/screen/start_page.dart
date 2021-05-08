import 'package:doing_app/common/widgets/hex_color.dart';
import 'package:doing_app/screen/sign/screen/sign_up_page.dart';
import 'package:emojis/emojis.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _startPageState();
}

class _startPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //헤더 설명
            Container(
              padding: EdgeInsets.only(top: 83, bottom: 32),
              child: Column(
                children: [
                  textSpace(text: "간편한 회원가입으로"),
                  textSpace(
                      text: "인기 데이트 코스를 한 눈에!",
                      color: Color.fromRGBO(255, 48, 48, 1)),
                  textSpace(
                      text: "직접 만든 코스를 기록",
                      fontWeight: FontWeight.bold,
                      textWidget: textSpace(text: "하고")),
                  textSpace(text: "공유해보세요!"),
                ],
              ),
            ),
            //일러스트
            Semantics(
              child: Container(
                padding: EdgeInsets.only(bottom: 48),
                child: SvgPicture.asset("assets/svgs/start_illust.svg"),
              ),
            ),
            //회원가입 Provider 리스트
            Container(
              margin: EdgeInsets.only(bottom: 14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  btnProvider(
                      svgPath: "assets/svgs/start_sign_up_google.svg",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<SignUpPage>(
                              builder: (BuildContext context) => SignUpPage()),
                        );
                      }),
                  btnProvider(
                      svgPath: "assets/svgs/start_sign_up_kakao.svg",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<SignUpPage>(
                              builder: (BuildContext context) => SignUpPage()),
                        );
                      }),
                ],
              ),
            ),
            //바텀 설명
            Container(
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      "assets/svgs/start_desc.svg",
                      alignment: Alignment.center,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      bottom: 11,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "${Emojis.smilingFace} 3초만에 빠른 회원가입!",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget btnProvider({String svgPath, Function onTap}) {
    return InkResponse(
      onTap: onTap,
      child: Container(
        width: 64,
        height: 64,
        margin: EdgeInsets.only(right: 8, left: 8),
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: HexColor.fromHex("#19000000"),
              spreadRadius: 0,
              blurRadius: 20,
              offset: Offset(0, 3),
            )
          ],
        ),
        child: SvgPicture.asset(svgPath),
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
                  height: 1.4,
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
