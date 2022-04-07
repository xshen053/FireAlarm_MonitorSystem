import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';

class Offline extends StatefulWidget {
  @override
  _OfflineState createState() => _OfflineState();
}

class _OfflineState extends State<Offline> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //修改按钮颜色
          ),
          automaticallyImplyLeading: true,
          title: Text("公司离线设备列表",
              style: TextStyle(fontSize: 20, color: Colors.black)),
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
          height: ScreenUtil().setHeight(90), //sizedbox非常重要
          child: _selectedSystemList(),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(90), //sizedbox非常重要
          child: _selectedSystemList(),
        )
      ],
    );
  }

  Widget _selectedSystemList() {
    return InkWell(
      //处理点击事件
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
                            'images/7.jpg',
                            fit: BoxFit.fill,
                            width: 70,
                            height: 60,
                          )
                          // child: Image.network(
                          //   'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2468571161,3872634735&fm=26&gp=0.jpg',
                          //   fit: BoxFit.fill,
                          //   width: ScreenUtil().setWidth(100),
                          //   height: ScreenUtil().setHeight(30),
                          // ),
                          ),

                      ///
                    ],
                  )),

              ///
              Padding(
                padding: EdgeInsets.fromLTRB(10, 7, 5, 2),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                      child: Container(
                        width: ScreenUtil().setWidth(300),
                        height: ScreenUtil().setHeight(15),
                        child: Text(
                          // '${systemSelectedList[index].unitName}',
                          '设备名称：海湾500',
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
                          '设备地点：上溪镇金塘路88号',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(20),
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),

                    ///
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
                          borderRadius: BorderRadius.circular((0.0)), // 圆角度
                        ),
                        child: Center(
                          child: Text(
                            // '${systemSelectedList[index].alarmTitle}',
                            '故障',
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
