import 'package:demo01/login/test5.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:demo01/document/alarmmessage.dart'; //自定义页面 对应MessageTabs(),
import 'package:demo01/document/member.dart'; //自定义页面 对应  MemberPage(),

import 'package:demo01/document/statisevaluation.dart'; //自定义页面 对应 StatisEvaluation(),
import 'package:demo01/document/Jiance_Center4.dart'; //自定义页面 对应 StatisEvaluation(),

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(520, 360),
        allowFontScaling: false,
        builder: () => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: '',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: LoginPage(),
            ));
  }
}

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  PageController _pageController;
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
        icon: Icon(Icons.notifications_active), title: Text('报警信息')),
    BottomNavigationBarItem(icon: Icon(Icons.security), title: Text('统计评估')),
    BottomNavigationBarItem(icon: Icon(Icons.computer), title: Text('监测中心')),
    BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('个人中心')),
  ];
  final List<Widget> tabBodies = [
    MessageTabs(),
    StatisEvaluation(),
    Monitor(),
    MemberPage(),
  ];

  int currentIndex = 0;
  var currentPage;
  @override
  void initState() {
    currentPage = tabBodies[currentIndex];
    _pageController = new PageController()
      ..addListener(() {
        if (currentPage != _pageController.page.round()) {
          setState(() {
            currentPage = _pageController.page.round();
          });
        }
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          items: bottomTabs,
          onTap: (index) {
            setState(() {
              currentIndex = index;
              currentPage = tabBodies[currentIndex];
            });
          },
        ),
        body: IndexedStack(index: currentIndex, children: tabBodies));
  }
}
