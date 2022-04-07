import 'package:flutter/material.dart';

class AlarmMessDetail extends StatefulWidget {
  @override
  _AlarmMessDetailState createState() => _AlarmMessDetailState();
}

class _AlarmMessDetailState extends State<AlarmMessDetail>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
        ),
        home: Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: Colors.black, //修改按钮颜色
              ),
              centerTitle: true,
              automaticallyImplyLeading: true,
              title: Text("报警详情"), //标题
              leading: new IconButton(
                //这是图标长按会出现的提示信息，返回按钮这么常用，应该不需要吧
                //tooltip: '返回上一页',
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                  //_nextPage(-1);
                },
              ),

              backgroundColor: Colors.white,
            ),
            body: Center(
              child: new ListView(
                children: <Widget>[
                  ///
                  Padding(
                    padding: EdgeInsets.all(5),
                  ),

                  ///
                  Card(
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(30, 0, 5, 20),
                          child: Text('单位名称：义乌市星乐工艺品有限公司',
                              style: new TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.0)))),

                  ///
                  Card(
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(30, 0, 5, 20),
                          child: Text('类型：火警告警',
                              style: new TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.0)))),

                  ///
                  Card(
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(30, 0, 5, 20),
                          child: Text('报警描述：火警告警',
                              style: new TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.0)))),

                  ///
                  Card(
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(30, 0, 5, 20),
                          child: Text('报警分类：未定义',
                              style: new TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.0)))),
                  Card(
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(30, 0, 5, 20),
                          child: Text('时间：2021年5月23日',
                              style: new TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.0)))),
                  Card(
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(30, 0, 5, 20),
                          child: Text('地点：四通路63号上溪四通西路63号',
                              style: new TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.0)))),
                  Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Text("平面图", style: TextStyle(fontSize: 15)))
                ],
              ),
            ),
            floatingActionButton: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 200),
              child: Container(
                // margin: EdgeInsets.only(left: 0, top: 30),
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                // alignment: Alignment(30, 0),
                height: 30,
                width: 50,
                decoration: new BoxDecoration(
                  color: Colors.white,
                  //设置四周圆角 角度
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  //设置四周边框
                  border:
                      new Border.all(width: 1, color: Colors.tealAccent[700]),
                ),
                child: Center(
                    child: Text(
                  "打开",
                  style: TextStyle(fontSize: 13),
                )),
              ),
            )));
  }
}
