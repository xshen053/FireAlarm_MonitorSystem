import 'package:demo01/document/warninglist4b.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';

class RemoMonitor extends StatefulWidget {
  final int type;
  RemoMonitor({Key key, @required this.type}) : super(key: key);
  @override
  _RemoMonitorState createState() => _RemoMonitorState();
}

class _RemoMonitorState extends State<RemoMonitor>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  List<Widget> _list = [
    Text("远程监控系统",
        style: TextStyle(
          fontSize: 20.0, // 文字大小
          color: Colors.black, // 文字颜色
        )),
    Text("燃气监测系统",
        style: TextStyle(
          fontSize: 20.0, // 文字大小
          color: Colors.black, // 文字颜色
        )),
    Text("智慧用水系统",
        style: TextStyle(
          fontSize: 20.0, // 文字大小
          color: Colors.black, // 文字颜色
        )),
    Text("智能电桩系统",
        style: TextStyle(
          fontSize: 20.0, // 文字大小
          color: Colors.black, // 文字颜色
        )),
    Text("智慧用电系统",
        style: TextStyle(
          fontSize: 20.0, // 文字大小
          color: Colors.black, // 文字颜色
        )),
    Text("智能疏散系统",
        style: TextStyle(
          fontSize: 20.0, // 文字大小
          color: Colors.black, // 文字颜色
        )),
    Text("智能预警系统",
        style: TextStyle(
          fontSize: 20.0, // 文字大小
          color: Colors.black, // 文字颜色
        )),
    Text("视频监控系统",
        style: TextStyle(
          fontSize: 20.0, // 文字大小
          color: Colors.black, // 文字颜色
        )),
  ];
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //修改按钮颜色
        ),
        automaticallyImplyLeading: true,
        title: _list[widget.type - 1],
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: _warningList(),
    );
  }

  Widget _warningList() {
    return ListView(
      children: <Widget>[
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
          return Warnlist();
        }));
      },
      child: Container(
        margin: EdgeInsets.all(5),
        height: ScreenUtil().setHeight(100),
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
                            'images/6.png',
                            fit: BoxFit.fill,
                            width: 70,
                            height: 60,
                          )
                          // child: Image.network(
                          //   'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=131002701,515519821&fm=26&gp=0.jpg',
                          //   fit: BoxFit.fill,
                          //   width: ScreenUtil().setWidth(100),
                          //   height: ScreenUtil().setHeight(30),
                          // ),
                          ),

                      ///
                      Padding(
                        padding: EdgeInsets.fromLTRB(1, 20, 1, 1),
                        child: Center(
                            child: Container(
                                height: ScreenUtil().setHeight(10),
                                width: ScreenUtil().setWidth(56),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                      BorderRadius.circular((8.0)), // 圆角度
                                ),
                                child: Center(
                                  child: Text(
                                    '远程',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ))),
                      ),
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
                          '义乌市星乐工艺品有限公司',
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
                          '报警位置：杭州电子科技大学',
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
                            Padding(
                              padding: EdgeInsets.only(bottom: 5),
                              child: Container(
                                width: ScreenUtil().setWidth(20),
                                height: ScreenUtil().setHeight(10),
                                child: Image.network(
                                  'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1286618850,756091839&fm=26&gp=0.jpg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                child: Text('地点：杭州电子科技大学',
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
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular((8.0)), // 圆角度
                        ),
                        child: Center(
                          child: Text(
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
