import 'package:demo01/document/RemoMonitor4a.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:badges/badges.dart';

class Monitor extends StatefulWidget {
  @override
  _MonitorState createState() => _MonitorState();
}

class _MonitorState extends State<Monitor> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
        body: Center(
            child:
                ListView(children: <Widget>[_deviceGraph(), _topNavigator()])));
  }

  Widget _deviceGraph() {
    return Container(
      // padding: EdgeInsets.all(300),
      height: ScreenUtil().setHeight(220),
      width: ScreenUtil().setWidth(1200),
      color: Color(0xFFBC8F8F),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Container(
              height: ScreenUtil().setHeight(150),
              width: ScreenUtil().setWidth(500),
              child: SfCircularChart(
                  annotations: <CircularChartAnnotation>[
                    CircularChartAnnotation(
                      widget: Row(
                        children: <Widget>[
                          Text(
                            '100',
                            style: TextStyle(
                                // color: Color(0XFF4527A0),
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(30)),
                          ),
                          Text(
                            '|',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(30)),
                          ),
                          Text(
                            '70',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(30)),
                          ),
                        ],
                      ),
                      height: '20%',
                      width: '60%',
                      //radius: '50%',
                    ),
                  ],
                  palette: [Color(0XFFFFA500), Color(0XFFFFD700)],
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <RadialBarSeries<SalesData, String>>[
                    RadialBarSeries<SalesData, String>(
                      dataSource: <SalesData>[
                        SalesData('在线设备', 20), //palette 第一个值
                        SalesData('在线单位', 30), //palette 第二个值
                      ],
                      xValueMapper: (SalesData sales, _) => sales.onLineName,
                      yValueMapper: (SalesData sales, _) => sales.onLineNum,
                      maximumValue: 100.toDouble(),
                    )
                  ]),
            ),
          ),

          //////
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 2, 10, 0),
                  child: Container(
                    height: ScreenUtil().setHeight(50),
                    width: ScreenUtil().setWidth(220),
                    child: Column(
                      children: <Widget>[
                        Text(
                          '在线设备',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: ScreenUtil().setSp(30)),
                        ),
                        Text(
                          '20|100',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: ScreenUtil().setSp(30)),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(13, 2, 0, 2),
                  child: Container(
                    height: ScreenUtil().setHeight(50),
                    width: ScreenUtil().setWidth(220),
                    child: Column(
                      children: <Widget>[
                        Text(
                          '在线单位',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: ScreenUtil().setSp(30)),
                        ),
                        Text(
                          '30|70',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: ScreenUtil().setSp(30)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _topNavigator() {
    //灵感只在一瞬间，少了个return，就不行了
    return SizedBox(
        height: ScreenUtil().setHeight(100),
        child: Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Row(children: <Widget>[
              Padding(
                padding: EdgeInsets.all(25),
                child: Column(children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                              return RemoMonitor(
                                type: 1,
                              );
                            }),
                          );
                        },
                        child: Badge(
                            badgeContent: Text("110"),
                            child: buildButtonColumn(
                              Icons.laptop_chromebook,
                              '远程监控',
                            )),
                      )),
                  Padding(
                      padding: EdgeInsets.all(0),
                      child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return _blankList();
                              }),
                            );
                          },
                          child: buildButtonColumn(
                            Icons.laptop_chromebook,
                            '燃气检测',
                          ))),
                ]),
              ),
              Padding(
                padding: EdgeInsets.all(25),
                child: Column(children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                              return RemoMonitor(
                                type: 3,
                              );
                            }),
                          );
                        },
                        child: Badge(
                            badgeContent: Text("11"),
                            child: buildButtonColumn(
                              Icons.laptop_chromebook,
                              '智能用水',
                            )),
                      )),
                  Padding(
                      padding: EdgeInsets.all(0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                              return _blankList();
                            }),
                          );
                        },
                        child: buildButtonColumn(
                          Icons.laptop_chromebook,
                          '智能电桩',
                        ),
                      )),
                ]),
              ),
              Padding(
                padding: EdgeInsets.all(25),
                child: Column(children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                              return RemoMonitor(
                                type: 5,
                              );
                            }),
                          );
                        },
                        child: Badge(
                            badgeContent: Text("11"),
                            child: buildButtonColumn(
                              Icons.laptop_chromebook,
                              '智能用电',
                            )),
                      )),
                  Padding(
                      padding: EdgeInsets.all(0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                              return _blankList();
                            }),
                          );
                        },
                        child: buildButtonColumn(
                          Icons.laptop_chromebook,
                          '智能疏散',
                        ),
                      )),
                ]),
              ),
              Padding(
                padding: EdgeInsets.all(25),
                child: Column(children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                              return RemoMonitor(
                                type: 7,
                              );
                            }),
                          );
                        },
                        child: Badge(
                            badgeContent: Text("1241"),
                            child: buildButtonColumn(
                              Icons.laptop_chromebook,
                              '智能预警',
                            )),
                      )),
                  Padding(
                      padding: EdgeInsets.all(0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                              return _blankList();
                            }),
                          );
                        },
                        child: buildButtonColumn(
                          Icons.laptop_chromebook,
                          '视频监控',
                        ),
                      )),
                ]),
              ),
            ])));
  }
}

Widget _blankList() {
  return Container(
    margin: EdgeInsets.all(5),
    height: ScreenUtil().setHeight(800),
    width: ScreenUtil().setWidth(1200),
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
      BoxShadow(
        color: Colors.blueGrey[50],
        blurRadius: 8.0,
        spreadRadius: 8.0,
        offset: Offset(-1.0, 1.0),
      ),
    ]),
    child: Center(
      child: Text(
        '暂无数据',
        style: TextStyle(fontSize: ScreenUtil().setSp(65), color: Colors.red),
      ),
    ),
  );
}

class SalesData {
  SalesData(this.onLineName, this.onLineNum);
  final String onLineName;
  final int onLineNum;
}

Column buildButtonColumn(
  IconData icon,
  String label,
) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Container(
        decoration: BoxDecoration(color: Color(0x00)),
        child: Icon(
          icon,
          color: Color(0xFF000000),
          size: 30.0,
        ),
      ),
      Container(
        margin: const EdgeInsets.all(2.0),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 10.0,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      )
    ],
  );
}
