import 'package:demo01/document/complist4c.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';

class Warnlist extends StatefulWidget {
  @override
  _WarnlistState createState() => _WarnlistState();
}

class _WarnlistState extends State<Warnlist>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.fingerprint,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return Complist();
                }));
              },
            )
          ],
          iconTheme: IconThemeData(
            color: Colors.black, //修改按钮颜色
          ),
          automaticallyImplyLeading: true,
          title:
              Text("报警列表", style: TextStyle(fontSize: 20, color: Colors.black)),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: _warnnlist());
  }

  Widget _warnnlist() {
    return ListView(
      children: <Widget>[
        //sizedbox每一个都是一个组件
        SizedBox(
          height: ScreenUtil().setHeight(90),
          child: _selectedSystemList(),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(90),
          child: _selectedSystemList(),
        )
      ],
    );
  }

  Widget _selectedSystemList() {
    return InkWell(
      //处理点击事件
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return Complist();
        }));
      },
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
                          padding: EdgeInsets.fromLTRB(0, 30, 0, 3),
                          child: Image.asset(
                            'images/5.jpg',
                            fit: BoxFit.fill,
                            width: 70,
                            height: 60,
                          )),
                    ],
                  )),

              ///
              Padding(
                padding: EdgeInsets.fromLTRB(10, 7, 5, 2),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Container(
                        width: ScreenUtil().setWidth(300),
                        height: ScreenUtil().setHeight(15),
                        child: Text(
                          '义乌市晨霞日用品厂',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(20),
                              color: Colors.black),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Container(
                        width: ScreenUtil().setWidth(300),
                        height: ScreenUtil().setHeight(15),
                        child: Text(
                          // '报警位置：${systemSelectedList[index].alarmSite}',
                          '报警地点：上溪镇金塘路88号',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(20),
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),

                    ///
                    Padding(
                      padding: EdgeInsets.only(bottom: 0),
                      child: Container(
                        width: ScreenUtil().setWidth(300),
                        height: ScreenUtil().setHeight(20),
                        child: Text(
                          // '报警时间：${systemSelectedList[index].alarmTime}',
                          '报警时间：2021年5月23日',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(20),
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),

                    ///
                    Padding(
                      padding: EdgeInsets.only(bottom: 0),
                      child: Container(
                        width: ScreenUtil().setWidth(300),
                        height: ScreenUtil().setHeight(10),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                child: Text(
                                    // '地点：${systemSelectedList[index].unitAddress}',
                                    '报警类型：火警',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(20),
                                      color: Colors.black54,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              ///
              Padding(
                padding: EdgeInsets.all(0),
                child: Center(
                    child: Container(
                        height: ScreenUtil().setHeight(20),
                        width: ScreenUtil().setWidth(50),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular((8.0)), // 圆角度
                        ),
                        child: Center(
                          child: Text(
                            // '${systemSelectedList[index].alarmTitle}',
                            '火警',
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(18),
                                color: Colors.white),
                          ),
                        ))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
