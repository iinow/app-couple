import 'package:date_time_picker/date_time_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_tag_editor/tag_editor.dart';

class CreateCoursePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _createCoursePageState();
}

class _createCoursePageState extends State<CreateCoursePage> {
  TextEditingController _textEditingControllerCourseName =
      TextEditingController();
  TextEditingController _textEditingControllerDateTime =
      TextEditingController();
  DateTime _selectedTime;
  String _dateTimeTest = "";

  List<String> _tagList = List<String>();

//  TextEditingController _textEditingControllerCourseName = TextEditingController();
//  TextEditingController _textEditingControllerCourseName = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tagList.add("맛");
    _tagList.add("맛집");
    _tagList.add("맛집입");
    _tagList.add("맛집입니");
    _tagList.add("맛집입니다");
    _tagList.add("카페");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          InkResponse(
            child: Container(
              width: 24,
              height: 24,
              child: Image.asset("assets/images/icon_home.png"),
            ),
          ),
          SizedBox(
            width: 16,
          )
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Center(
          child: Text(
            "코스만들기",
            style: TextStyle(color: Colors.black),
          ),
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
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              child: Container(
                padding: EdgeInsets.only(left: 24, top: 32, bottom: 18),
                child: TextField(
                  controller: _textEditingControllerCourseName,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "데이트코스 이름을 입력해주세요.",
                      hintStyle:
                          TextStyle(fontSize: 16, color: Colors.black12)),
                ),
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
            SizedBox(
              height: 5,
            ),
            emptyCalendarBox("날짜를 입력해주세요."),
            SizedBox(
              height: 11,
            ),
            Container(
              padding: EdgeInsets.only(left: 24),
              child: Text(
                "소요시간",
                style: TextStyle(fontSize: 14),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            viewTimeRequiredWidget(),
            SizedBox(
              height: 11,
            ),
            Container(
              padding: EdgeInsets.only(left: 24),
              child: Text(
                "소요비용",
                style: TextStyle(fontSize: 14),
              ),
            ),
            addAPrice(),
            SizedBox(
              height: 24,
            ),
            addTag(),
            SizedBox(
              height: 48,
            ),
          ],
        ),
      ),
      bottomNavigationBar: addButton(),
    );
  }

  Widget addButton() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 24),
      height: 64,
      width: 320,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.black,
          border: Border.all(color: Colors.black12)),
      child: InkResponse(
        onTap: () {},
        child: Container(
          child: Center(
            child: Text(
              "등록하기",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Widget addAPrice() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          border: Border.all(color: Colors.black12)),
      width: MediaQuery.of(context).size.width * 1.0,
      height: 40,
      margin: EdgeInsets.only(left: 24, right: 24),
      child: Container(
        padding: EdgeInsets.only(left: 12, right: 12, top: 9, bottom: 11),
        child: Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.3, top: 23),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontSize: 14, color: Colors.black12),
                  ),
                ),
              ),
            ),
            Text(
              "원",
              style: TextStyle(fontSize: 14, color: Colors.black12),
            ),
          ],
        ),
      ),
    );
  }

  //_values = List<String> 타입으로 정의.
  _onDelete(index) {
    setState(() {
      _tagList.removeAt(index);
    });
  }

  Future<List<String>> testii() async {
//    _tagList = await
    _tagList.add("맛");
    _tagList.add("맛집");
    _tagList.add("맛집입");
    _tagList.add("맛집입니");
    _tagList.add("맛집입니다");
    _tagList.add("카페");
  }

  Widget addTag() {
    return Container(
      padding: EdgeInsets.only(left: 24),
      child: TagEditor(
        resetTextOnSubmitted: false,
        hasAddButton: false,
        length: _tagList.length,
        tagBuilder: (context, index) => _Chip(
          index: index,
          label: _tagList[index],
//        onDeleted: _onDelete(index),
        ),
//              onTagChanged: () {
//                setState(() {
//                  _tagList.add("");
//                });
//              },
      ),
    );
  }

//    return TagEditor(
//        length: 10,
//        tagBuilder: (context, index) => _Chip(
//              index: index,
//              label: _values[index],
//              onDeleted: _onDelete,
//            ),
//        onTagChanged: () {
//          setState(() {
//            _values.add(newValue);
//          });
//        });
//  }

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

  Widget viewTimeRequiredWidget() {
    return Container(
      margin: EdgeInsets.only(left: 24),
      child: Row(
        children: [
          Container(
              padding: EdgeInsets.only(left: 12, top: 9, bottom: 9, right: 12),
              width: 152,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  border: Border.all(color: Colors.black12)),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 45, top: 23),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle:
                              TextStyle(fontSize: 14, color: Colors.black12),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "시간",
                    style: TextStyle(color: Colors.black12, fontSize: 14),
                  ),
                ],
              )),
          SizedBox(
            width: 8,
          ),
          Container(
              padding: EdgeInsets.only(left: 12, top: 9, bottom: 9, right: 12),
              width: 152,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  border: Border.all(color: Colors.black12)),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 45, top: 23),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle:
                              TextStyle(fontSize: 14, color: Colors.black12),
                        ),
                      ),
                    ),
                  ),
                  Text("분",
                      style: TextStyle(color: Colors.black12, fontSize: 14)),
                ],
              )),
        ],
      ),
    );
  }

  Widget emptyCalendarBox(String hintText,
      {TextEditingController textEditingController}) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          border: Border.all(color: Colors.black12)),
      width: MediaQuery.of(context).size.width * 1.0,
      height: 40,
      margin: EdgeInsets.only(left: 24, right: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              padding: _dateTimeTest == ""
                  ? EdgeInsets.only(left: 9)
                  : EdgeInsets.only(left: 90),
              child: Text(
                _dateTimeTest == "" ? hintText : _dateTimeTest,
                style: _dateTimeTest == ""
                    ? TextStyle(fontSize: 16, color: Colors.black12)
                    : TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ),
          InkResponse(
            onTap: () {
              Future<DateTime> selece = showDatePicker(
//                  locale:"",
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2018),
                  lastDate: DateTime(2030));

              selece.then((value) {
                setState(() {
//                  _selectedTime = value;
                  _dateTimeTest = value.toString().substring(0, 10);
//                  _textEditingControllerDateTime.text =
//                      value.toString().substring(0, 10);
                });
              });
            },
            child: Container(
              margin: EdgeInsets.only(right: 7),
              width: 20,
              height: 20,
              child: Image.asset("assets/images/calendar_calendar_plus.png"),
            ),
          )
        ],
      ),
    );
  }

  Widget emptyBox(String hintText) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          border: Border.all(color: Colors.black12)),
      width: 312,
      height: 40,
      margin: EdgeInsets.only(left: 24, right: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 9, top: 10),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: TextStyle(fontSize: 16, color: Colors.black12),
                ),
              ),
            ),
          ),
        ],
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

class _Chip extends StatelessWidget {
  const _Chip({
    @required this.label,
    @required this.onDeleted,
    @required this.index,
  });

  final String label;
  final ValueChanged<int> onDeleted;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: const EdgeInsets.only(left: 8.0),
      label: Text(label),
      deleteIcon: const Icon(
        Icons.close,
        size: 18,
      ),
      onDeleted: () {
        onDeleted(index);
      },
    );
  }
}
