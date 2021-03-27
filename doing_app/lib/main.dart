import 'package:doing_app/screen/community/screen/community_page.dart';
import 'package:doing_app/screen/main/screen/main_page.dart';
import 'package:doing_app/screen/recommend/screen/recommend_page.dart';
import 'package:doing_app/screen/setting/screen/setting_page.dart';
import 'package:doing_app/screen/sign/screen/start_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluttericon/web_symbols_icons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('ko', 'KR')],
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StartPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;
  int prevPageIndex = 0;

  PageStorageBucket bucket = PageStorageBucket();

  get pages => [MainPage(), RecommendPage(), CommunityPage(), SettingPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: pages[currentPageIndex],
        bucket: bucket,
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 46,
          decoration: const BoxDecoration(boxShadow: [
            const BoxShadow(
                offset: const Offset(0, -3),
                blurRadius: 2,
                color: const Color.fromRGBO(0, 0, 0, 0.03))
          ]),
          child: Scaffold(
            backgroundColor: const Color(0x00000000),
            bottomNavigationBar: BottomNavigationBar(
//              fixedColor: Colors.purpleAccent,
//              unselectedItemColor: Colors.deepOrangeAccent,
              showUnselectedLabels: true,
              elevation: 0.0,
              onTap: (int pageIndex) {
                setState(() {
                  currentPageIndex = pageIndex;
                });
                prevPageIndex = pageIndex;
              },
              currentIndex: currentPageIndex,
//              unselectedItemColor: CustomTheme.getKey(context) == ThemeKeys.DARK
//                  ? const Color.fromRGBO(105, 105, 105, 1)
//                  : const Color.fromRGBO(144, 144, 144, 1),
//              unselectedItemColor: const Color.fromRGBO(105, 105, 105, 1),
//              selectedItemColor: const Color.fromRGBO(144, 144, 144, 1),
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.black,
//                  CustomTheme.of(context).textTheme.bodyText1.color,
              unselectedFontSize: 10,
              selectedFontSize: 10,
              items: [
                BottomNavigationBarItem(
                  icon: Container(
                    height: 20,
                    child: OverflowBox(
                      minWidth: 0,
                      minHeight: 0,
                      maxWidth: MediaQuery.of(context).size.width,
                      maxHeight: 1000,
                      child: const Icon(Icons.home, size: 28),
                    ),
                  ),
                  title: Text(
                    "",
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    height: 20,
                    child: OverflowBox(
                      minWidth: 0,
                      minHeight: 0,
                      maxWidth: MediaQuery.of(context).size.width,
                      maxHeight: 1000,
                      child: const Icon(Icons.star_border, size: 28),
                    ),
                  ),
                  title: Text(
                    "",
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    height: 20,
                    child: OverflowBox(
                      minWidth: 0,
                      minHeight: 0,
                      maxWidth: MediaQuery.of(context).size.width,
                      maxHeight: 1000,
                      child: const Icon(WebSymbols.comment, size: 28),
                    ),
                  ),
                  title: Text(
                    "",
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    height: 20,
                    child: OverflowBox(
                      minWidth: 0,
                      minHeight: 0,
                      maxWidth: MediaQuery.of(context).size.width,
                      maxHeight: 1000,
                      child: const Icon(Icons.settings, size: 28),
                    ),
                  ),
                  title: Text(
                    "",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
