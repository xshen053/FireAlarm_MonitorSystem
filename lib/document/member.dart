import 'package:demo01/login/test5.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';

class MemberPage extends StatefulWidget {
  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title:
              Text("个人中心", style: TextStyle(fontSize: 20, color: Colors.black)),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: ListView(
          children: <Widget>[
            SizedBox(
                height: ScreenUtil().setHeight(110),
                child: Column(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.all(0),
                        height: ScreenUtil().setHeight(100),
                        width: ScreenUtil().setWidth(600),
                        padding: EdgeInsets.all(5),
                        alignment: Alignment(0, 0),
                        decoration: BoxDecoration(
                            color: Colors.yellow,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.blueGrey[50],
                                blurRadius: 8.0,
                                spreadRadius: 8.0,
                                offset: Offset(-1.0, 1.0),
                              ),
                            ]),

                        ///
                        ///
                        child: ClipOval(
                          child: Image.asset('images/4.jpg',
                              fit: BoxFit.cover, width: 150, height: 150),
                          // child: Image.network(
                          //     'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=131002701,515519821&fm=26&gp=0.jpg',
                          //     fit: BoxFit.cover,
                          //     width: 150,
                          //     height: 150),
                        )),
                  ],
                )),
            SizedBox(
              height: ScreenUtil().setHeight(100),
              child: Container(
                  margin: EdgeInsets.all(5),
                  height: ScreenUtil().setHeight(100),
                  width: ScreenUtil().setWidth(200),
                  padding: EdgeInsets.all(5),
                  alignment: Alignment(0, 0),
                  decoration:
                      BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.blueGrey[50],
                      blurRadius: 8.0,
                      spreadRadius: 8.0,
                      offset: Offset(-1.0, 1.0),
                    ),
                  ]),
                  child: Row(children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
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
                                '用户名：鼎仁网络',
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
                                '联网日期：2021年5月28日',
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
                                '联系方式：未知',
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
                                '邮箱：未知',
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
                  ])),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(40),
              child: Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  height: ScreenUtil().setHeight(100),
                  width: ScreenUtil().setWidth(200),
                  padding: EdgeInsets.all(5),
                  alignment: Alignment(0, 0),
                  decoration:
                      BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.blueGrey[50],
                      blurRadius: 8.0,
                      spreadRadius: 8.0,
                      offset: Offset(-1.0, 1.0),
                    ),
                  ]),
                  child: Row(
                    children: <Widget>[
                      Spacer(),
                      Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) {
                                return LoginPage();
                              }), (check) => false);
                            },
                            child: Center(
                                child: Container(
                                    height: ScreenUtil().setHeight(20),
                                    width: ScreenUtil().setWidth(50),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius:
                                          BorderRadius.circular((8.0)), // 圆角度
                                    ),
                                    child: Center(
                                      child: Text(
                                        // '${systemSelectedList[index].alarmTitle}',
                                        '退出',
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            fontSize: ScreenUtil().setSp(18),
                                            color: Colors.white),
                                      ),
                                    ))),
                          )),
                    ],
                  )),
            )
          ],
        ));
  }
}
