import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/cupertino.dart';

import 'AlarmMessDetail.dart';

class StatisEvaluation extends StatefulWidget {
  @override
  _StatisEvalutionState createState() => _StatisEvalutionState();
}

class _StatisEvalutionState extends State<StatisEvaluation>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  List evalList = [];
  int page = 1;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          '统计评估',
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: _allMessage(),
    );
  }

  Widget _allMessage() {
    return ListView(
      children: <Widget>[
        SizedBox(
          height: ScreenUtil().setHeight(60),
          child: _selectedSystemList(),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(60),
          child: _selectedSystemList(),
        )
      ],
    );
  }

  Widget _selectedSystemList() {
    return InkWell(
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.blueGrey[50],
            blurRadius: 8.0,
            spreadRadius: 8.0,
            offset: Offset(-1.0, 1.0),
          ),
        ]),

        ///
        child: Container(
          padding: EdgeInsets.all(2),
          child: Row(
            children: <Widget>[
              ///
              Padding(
                  padding: EdgeInsets.all(1),
                  child: Column(
                    children: <Widget>[
                      ///
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Container(
                          width: ScreenUtil().setWidth(300),
                          height: ScreenUtil().setHeight(15),
                          child: Text(
                            '鼎仁测试',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(20),
                                color: Colors.black),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Container(
                          width: ScreenUtil().setWidth(300),
                          height: ScreenUtil().setHeight(15),
                          child: Text(
                            // '${systemSelectedList[index].unitName}',
                            '中兴路601号',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(20),
                                color: Colors.black54),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Container(
                          width: ScreenUtil().setWidth(300),
                          height: ScreenUtil().setHeight(15),
                          child: Text(
                            // '${systemSelectedList[index].unitName}',
                            '抽验率：0.0',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(20),
                                color: Colors.black54),
                          ),
                        ),
                      ),
                    ],
                  )),

              ///
              Padding(
                padding: EdgeInsets.fromLTRB(50, 50, 0, 0),
                child: Container(
                  width: ScreenUtil().setWidth(100),
                  height: ScreenUtil().setHeight(10),
                  child: Text(
                    // '${systemSelectedList[index].unitName}',
                    '完好率:0.0',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(20),
                        color: Colors.black54),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _evaluationList(int index) {
  return InkWell(
    child: Container(
      margin: EdgeInsets.all(5),
      height: ScreenUtil().setHeight(245),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.blueGrey[50],
          blurRadius: 8.0,
          spreadRadius: 8.0,
          offset: Offset(-1.0, 1.0),
        ),
      ]),
      child: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
              child: Container(
                alignment: Alignment.centerLeft,
                height: ScreenUtil().setHeight(75),
                child: Text(
                  '1',
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(47), color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 2),
              child: Container(
                alignment: Alignment.centerLeft,
                height: ScreenUtil().setHeight(47),
                child: Text(
                  '2',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(35),
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 2),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 100),
                      child: Container(
                        width: ScreenUtil().setWidth(280),
                        height: ScreenUtil().setHeight(47),
                        child: Text(
                          '抽检率：',
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(35),
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 55),
                      child: Container(
                        width: ScreenUtil().setWidth(280),
                        height: ScreenUtil().setHeight(47),
                        child: Text(
                          '完好率：',
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(35),
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    ),
  );
}
