import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'AlarmMessDetail.dart';

class Detail extends StatefulWidget {
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> with AutomaticKeepAliveClientMixin {
  bool _isOffstage = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //修改按钮颜色
          ),
          automaticallyImplyLeading: true,
          title:
              Text("设备详情", style: TextStyle(fontSize: 20, color: Colors.black)),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: _warnnlist(_isOffstage),
        floatingActionButton: InkWell(
          child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 310),
              child: IconButton(
                  alignment: Alignment(0, 0),
                  icon: Icon(Icons.keyboard_arrow_down),
                  iconSize: 30,
                  onPressed: () {
                    setState(() {
                      _isOffstage = !_isOffstage;
                    });
                  })),
        ));
  }

  @override
  bool get wantKeepAlive => true;
  Widget _warnnlist(bool temp1) {
    bool temp = temp1;
    return ListView(
      children: <Widget>[
        //sizedbox每一个都是一个组件
        SizedBox(
          height: ScreenUtil().setHeight(200), //sizedbox非常重要
          child: _selectedSystemList(),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(200), //sizedbox非常重要
          child: _selectedSystemList2(temp),
        )
      ],
    );
  }

  Widget _selectedSystemList() {
    return InkWell(
      //处理点击事件
      // onTap: () {
      //   Navigator.of(context)
      //       .push(MaterialPageRoute(builder: (BuildContext context) {
      //     return Complist();
      //   }));
      // },
      child: Container(
        margin: EdgeInsets.all(5),
        height: ScreenUtil().setHeight(80),
        width: ScreenUtil().setWidth(200),
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
          child: Column(
            children: <Widget>[
              ///
              Container(
                margin: EdgeInsets.only(left: 0, top: 30),
                alignment: Alignment(0, 0),
                height: 50,
                width: 300,
                decoration: new BoxDecoration(
                  color: Colors.white,
                  //设置四周圆角 角度

                  //设置四周边框
                  border: new Border.all(width: 4, color: Colors.yellow[900]),
                ),
                child: Text(
                  "海湾1000",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(200, 30, 0, 0),
                child: Container(
                  width: ScreenUtil().setWidth(300),
                  height: ScreenUtil().setHeight(15),
                  child: Text(
                    // '报警位置：${systemSelectedList[index].alarmSite}',
                    '型号： 思迪500',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(20),
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),

              ///
              ///
              Row(children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          width: ScreenUtil().setWidth(300),
                          height: ScreenUtil().setHeight(15),
                          child: Text(
                            // '${systemSelectedList[index].unitName}',
                            '设备联网状态：',
                            textAlign: TextAlign.start,

                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(20),
                                color: Colors.black),
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Container(
                          width: ScreenUtil().setWidth(300),
                          height: ScreenUtil().setHeight(15),
                          child: Text(
                            // '报警位置：${systemSelectedList[index].alarmSite}',
                            '设备运行状态：故障',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(20),
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Container(
                          width: ScreenUtil().setWidth(300),
                          height: ScreenUtil().setHeight(15),
                          child: Text(
                            // '报警位置：${systemSelectedList[index].alarmSite}',
                            '设备地点：',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(20),
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Container(
                          width: ScreenUtil().setWidth(300),
                          height: ScreenUtil().setHeight(15),
                          child: Text(
                            // '报警位置：${systemSelectedList[index].alarmSite}',
                            '上次故障时间：2021年5月28日',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(20),
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),

                      ///
                    ],
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _selectedSystemList2(bool aa) {
    bool _isOffstage = aa;
    return InkWell(
      //处理点击事件
      // onTap: () {
      //   Navigator.of(context)
      //       .push(MaterialPageRoute(builder: (BuildContext context) {
      //     return Complist();
      //   }));
      // },
      child: Container(
        margin: EdgeInsets.all(5),
        height: ScreenUtil().setHeight(80),
        width: ScreenUtil().setWidth(200),
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

        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 7, 5, 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Container(
                  //   margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  //   height: ScreenUtil().setHeight(20),
                  //   width: ScreenUtil().setWidth(480),
                  //   padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  //   decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       boxShadow: <BoxShadow>[
                  //         BoxShadow(
                  //           color: Colors.blueGrey[50],
                  //           blurRadius: 8.0,
                  //           spreadRadius: 8.0,
                  //           offset: Offset(-1.0, 1.0),
                  //         ),
                  //       ]),
                  //   child:
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            // '报警位置：${systemSelectedList[index].alarmSite}',
                            '最近报警列表：',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(20),
                              color: Colors.black,
                            ),
                          ),
                          // Padding(
                          //     padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          //     child: IconButton(
                          //         alignment: Alignment(230, 0),
                          //         icon: Icon(Icons.keyboard_arrow_down),
                          //         iconSize: 30,
                          //         onPressed: () {
                          //           setState(() {
                          //             _isOffstage = !_isOffstage;
                          //           });
                          //         })),
                        ],
                      )
                      // child: Container(
                      //   width: ScreenUtil().setWidth(300),
                      //   height: ScreenUtil().setHeight(10),
                      //   child: Text(
                      //     // '报警位置：${systemSelectedList[index].alarmSite}',
                      //     '最近报警列表：',
                      //     textAlign: TextAlign.start,
                      //     style: TextStyle(
                      //       fontSize: ScreenUtil().setSp(20),
                      //       color: Colors.black,
                      //     ),
                      //   ),
                      // ),
                      ),

                  // ),
                  Offstage(
                      offstage: !_isOffstage,
                      child: Column(
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              height: ScreenUtil().setHeight(45),
                              width: ScreenUtil().setWidth(480),
                              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: Colors.blueGrey[50],
                                      blurRadius: 8.0,
                                      spreadRadius: 8.0,
                                      offset: Offset(-1.0, 1.0),
                                    ),
                                  ]),
                              child: Row(
                                children: <Widget>[
                                  Column(children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Container(
                                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        width: ScreenUtil().setWidth(300),
                                        height: ScreenUtil().setHeight(15),
                                        child: Text(
                                          // '${systemSelectedList[index].unitName}',
                                          '报警地点',
                                          textAlign: TextAlign.start,

                                          style: TextStyle(
                                              fontSize: ScreenUtil().setSp(15),
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
                                          // '报警位置：${systemSelectedList[index].alarmSite}',
                                          '报警类型：火警告警',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: ScreenUtil().setSp(15),
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(builder:
                                                (BuildContext context) {
                                          return AlarmMessDetail();
                                        }));
                                      },
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Container(
                                          width: ScreenUtil().setWidth(300),
                                          height: ScreenUtil().setHeight(15),
                                          child: Text(
                                            // '报警位置：${systemSelectedList[index].alarmSite}',
                                            '报警事件：2021年5月28日',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontSize: ScreenUtil().setSp(15),
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )

                                    ///
                                  ])
                                ],
                              )),
                          Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              height: ScreenUtil().setHeight(45),
                              width: ScreenUtil().setWidth(480),
                              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: Colors.blueGrey[50],
                                      blurRadius: 8.0,
                                      spreadRadius: 8.0,
                                      offset: Offset(-1.0, 1.0),
                                    ),
                                  ]),
                              child: Row(
                                children: <Widget>[
                                  Column(children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Container(
                                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        width: ScreenUtil().setWidth(300),
                                        height: ScreenUtil().setHeight(15),
                                        child: Text(
                                          // '${systemSelectedList[index].unitName}',
                                          '报警地点',
                                          textAlign: TextAlign.start,

                                          style: TextStyle(
                                              fontSize: ScreenUtil().setSp(15),
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
                                          // '报警位置：${systemSelectedList[index].alarmSite}',
                                          '报警类型：火警',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: ScreenUtil().setSp(15),
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Container(
                                        width: ScreenUtil().setWidth(300),
                                        height: ScreenUtil().setHeight(15),
                                        child: Text(
                                          // '报警位置：${systemSelectedList[index].alarmSite}',
                                          '报警事件：2021年5月28日',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: ScreenUtil().setSp(15),
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),

                                    ///
                                  ])
                                ],
                              )),
                        ],
                      )),

                  // Column(
                  //   children: <Widget>[
                  //     new Offstage(
                  //       offstage: _isOffstage,
                  //       child: Container(color: Colors.green, height: 100.0),
                  //     ),
                  //     new IconButton(
                  //       icon: Text("点击切换显示"),
                  //       onPressed: () {
                  //         setState(() {
                  //           _isOffstage = !_isOffstage;
                  //         });
                  //       },
                  //     ),
                  //   ],
                  // ),

                  // Padding(
                  //   padding: EdgeInsets.only(bottom: 5),
                  //   child: Container(
                  //     width: ScreenUtil().setWidth(300),
                  //     height: ScreenUtil().setHeight(15),
                  //     child: Text(
                  //       // '报警位置：${systemSelectedList[index].alarmSite}',
                  //       '设备地点：上溪镇金塘路88号',
                  //       textAlign: TextAlign.start,
                  //       style: TextStyle(
                  //         fontSize: ScreenUtil().setSp(20),
                  //         color: Colors.black54,
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  ///
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
