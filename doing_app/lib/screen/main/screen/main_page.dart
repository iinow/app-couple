import 'package:doing_app/screen/couse/screen/create_couse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "내가 만든 코스",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0.2,
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: _noneCouse(),
        ),
      ),
    );
  }

  Widget _couseHistory() {
    return Container(
      padding: EdgeInsets.fromLTRB(32, 0, 42, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "이번 주말 데이트코스를",
            style: TextStyle(fontSize: 24),
          ),
          Text(
            "직접 만들어보세요!",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "직접 데이트코스를 만들면 상대방에게 \n공유는 물론 다른 사람들이 만든 데이트 코스도 \n구경할 수 있어요!",
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          SizedBox(
            height: 42,
          ),
//          Image.asset("assets/images/main_base_img.png"),
          Container(
            child: InkResponse(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateCoursePage(),
                    ));
              },
              child: Center(child: Image.asset("assets/images/add_course.png")),
            ),
          ),
        ],
      ),
    );
  }
}

  Widget _noneCouse() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Image.asset("assets/images/main_base_img.png"),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: Color.fromRGBO(255, 75, 75, 1),
          ),
          width: 188,
          height: 64,
          child: InkResponse(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateCoursePage(),
                  ));
            },
            child: Center(
              child: Text(
                "+ 데이트 코스 만들기",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
