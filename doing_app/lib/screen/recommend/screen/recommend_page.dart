import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecommendPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "코스만들기",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0.2,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.black12,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                    ),
                    height: 48,
//                    width: 282,
                    margin: EdgeInsets.only(left: 24, top: 87, right: 154),
                    child: Center(
                      child: Text(
                        "커버이미지를 등록해주세요!",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 143, left: 0),
                    height: 80,
                    width: 80,
                    child: InkResponse(
                      onTap: () {},
                      child: Image.asset("assets/images/ico_camera.png"),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 24, top: 32, bottom: 18),
              child: TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "데이트코스 이름을 입력해주세요.",
                    hintStyle: TextStyle(fontSize: 16, color: Colors.black12)),
              ),
            ),
//              Image.file(File("")
            Container(
              color: Colors.black12,
              width: MediaQuery.of(context).size.width * 1,
              height: 1,
            ),
            SizedBox(
              height: 24,
            ),
            addAPlaceFromAMap(),
            SizedBox(
              height: 12,
            ),
            addAPlaceFromAMap(),
            SizedBox(
              height: 12,
            ),
            addAPlace(),
            SizedBox(
              height: 32,
            ),
            Container(
              color: Colors.black12,
              width: MediaQuery.of(context).size.width * 1,
              height: 1,
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              padding: EdgeInsets.only(left: 24, top: 24),
              child: Text(
                "부가정보",
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
              ),
            ),
            SizedBox(
              height: 11,
            ),
            Container(
              padding: EdgeInsets.only(left: 24, top: 24),
              child: Text(
                "데이트날짜",
                style: TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget addAPlace() {
    return Container(
      padding: EdgeInsets.only(left: 24, right: 24),
      child: Container(
        color: Colors.white,
        height: 64,
        width: 312,
        child: DottedBorder(
          dashPattern: const <double>[4, 4],
          borderType: BorderType.RRect,
          radius: Radius.circular(15),
          color: Colors.black12,
          strokeWidth: 1.5,
          child: InkResponse(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.only(left: 116, top: 22),
              child: Text(
                "장소 추가하기",
                style: TextStyle(fontSize: 14, color: Colors.black12),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget addAPlaceFromAMap() {
    return Container(
      padding: EdgeInsets.only(left: 24, right: 24),
      child: Container(
        padding: EdgeInsets.only(left: 24, top: 20, bottom: 20),
        height: 64,
        width: 312,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            border: Border.all(color: Colors.black12)),
        child: InkResponse(
          onTap: () {},
          child: Row(
            children: [
              Image.asset(
                "assets/images/icon_map.png",
                width: 24,
                height: 24,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "지도에서 장소 추가하기",
                style: TextStyle(fontSize: 14, color: Colors.black12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
