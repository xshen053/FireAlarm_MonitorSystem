import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_easyrefresh/easy_refresh.dart'; //需要导入插件，这里可以不用
// import 'package:zhxf/config/service_method.dart'; //模型
// import '../config/service_method.dart'; //模型
// import '../model/home_alarm_model.dart'; //模型
import 'package:flutter/cupertino.dart';

import 'AlarmMessDetail.dart'; //Cupertino组件需要的插件，这里也可以不用了

class MessagesTab {
  Widget text;
  AlarmMessage newsList;
  MessagesTab(this.text, this.newsList);
}

class MessageTabs extends StatefulWidget {
  @override
  _MessageTabsState createState() => _MessageTabsState();
}

class _MessageTabsState extends State<MessageTabs>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  TabController _tabController;
  List systemSelectedList = [];
  int page = 1;

  final List<MessagesTab> myTabs = <MessagesTab>[
    MessagesTab(
        Text(
          '所有信息',
          style: TextStyle(fontSize: ScreenUtil().setSp(30)),
        ),
        AlarmMessage(
          tabindex: 1,
        )),
    MessagesTab(
        Text(
          '已处理',
          style: TextStyle(fontSize: ScreenUtil().setSp(30)),
        ),
        AlarmMessage(
          tabindex: 2,
        )),
    MessagesTab(
        Text(
          '未处理',
          style: TextStyle(fontSize: ScreenUtil().setSp(30)),
        ),
        AlarmMessage(
          tabindex: 3,
        )),
  ];
  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF40E0D0),
          title: Text(
            '报警信息',
          ),
          centerTitle: true,
          bottom: TabBar(
            labelPadding: EdgeInsets.fromLTRB(0, 0, 0, 15),
            controller: _tabController,
            labelColor: Colors.yellowAccent,
            unselectedLabelColor: Colors.black,
            tabs: myTabs.map((MessagesTab item) {
              return Tab(child: item.text);
            }).toList(),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: myTabs.map((item) {
            return item.newsList;
          }).toList(),
        ));
  }
}

class AlarmMessage extends StatefulWidget {
  final int tabindex;
  AlarmMessage({Key key, this.tabindex}) : super(key: key);
  @override
  _AlarmMessageState createState() => _AlarmMessageState();
}

class _AlarmMessageState extends State<AlarmMessage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController _tabController2;
  ScrollController _scrollController;

  List systemSelectedList = [];
  int page = 1;
  final List<Tab> myTabs2 = <Tab>[
    Tab(
      child: Text(
        '全部',
        style: TextStyle(fontSize: ScreenUtil().setSp(15)),
      ),
    ),
    Tab(
      child: Text(
        '监控',
        style: TextStyle(fontSize: ScreenUtil().setSp(15)),
      ),
    ),
    Tab(
      child: Text(
        '用水',
        style: TextStyle(fontSize: ScreenUtil().setSp(15)),
      ),
    ),
    Tab(
      child: Text(
        '用电',
        style: TextStyle(fontSize: ScreenUtil().setSp(15)),
      ),
    ),
    Tab(
      child: Text(
        '预警',
        style: TextStyle(fontSize: ScreenUtil().setSp(15)),
      ),
    ),
    Tab(
      child: Text(
        '燃气',
        style: TextStyle(fontSize: ScreenUtil().setSp(15)),
      ),
    ),
    Tab(
      child: Text(
        '电桩',
        style: TextStyle(fontSize: ScreenUtil().setSp(15)),
      ),
    ),
    Tab(
      child: Text(
        '疏散',
        style: TextStyle(fontSize: ScreenUtil().setSp(15)),
      ),
    ),
    Tab(
      child: Text(
        '视频',
        style: TextStyle(fontSize: ScreenUtil().setSp(15)),
      ),
    ),
  ];
  @override
  bool get wantKeepAlive => true;
  int _currentIndex = 0;
  _onTabChanged() {
    if (_tabController2.index.toInt() == _tabController2.animation.value) {
      //赋值 并更新数据
      this.setState(() {
        _currentIndex = _tabController2.index;
      });
      _selected(_currentIndex, widget.tabindex);
    }
  }

  @override
  void initState() {
    _selected(_currentIndex, widget.tabindex);
    _tabController2 = TabController(vsync: this, length: 9);
    _tabController2.addListener(() => _onTabChanged());
    _scrollController = ScrollController(keepScrollOffset: true);
    super.initState();
  }

  @override
  void dispose() {
    _tabController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(body: _allMessage());
  }

  Widget _allMessage() {
    return ListView(
      children: <Widget>[
        SizedBox(
          height: ScreenUtil().setHeight(40),
          child: TabBar(
            isScrollable: true,
            labelPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            controller: _tabController2,
            labelColor: Colors.yellowAccent,
            unselectedLabelColor: Colors.black,
            tabs: myTabs2,
            onTap: (item) {
              _scrollController.jumpTo(0.0);
            },
          ),
        ),
        //sizedbox每一个都是一个组件
        SizedBox(
          height: ScreenUtil().setHeight(90), //sizedbox非常重要
          child: _selectedSystemList(),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(90), //sizedbox非常重要
          child: _selectedSystemList(),
        ),
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

  void _selected(int selectitem, int index) async {
    var data = {
      'pageNum': 1,
      'roleType': 0,
      'unitId': 55,
      'status': index == null ? 1 : index,
      'type': selectitem == null ? 0 : selectitem
    };
  }

  Widget _selectedSystemList() {
    return InkWell(
      //处理点击事件
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return AlarmMessDetail();
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
                          'images/4.jpg',
                          fit: BoxFit.fill,
                          width: ScreenUtil().setWidth(100),
                          height: ScreenUtil().setHeight(30),
                        ),
                        // Image.network(
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
                          // '${systemSelectedList[index].unitName}',
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
                            Padding(
                              padding: EdgeInsets.only(bottom: 5),
                              child: Container(
                                  width: ScreenUtil().setWidth(20),
                                  height: ScreenUtil().setHeight(10),
                                  child: Image.asset(
                                    "images/locate.png",
                                    fit: BoxFit.fill,
                                  )
                                  // child: Image.network(
                                  //   'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1286618850,756091839&fm=26&gp=0.jpg',
                                  //   fit: BoxFit.fill,
                                  // ),
                                  ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                child: Text(
                                    // '地点：${systemSelectedList[index].unitAddress}',
                                    '地点：杭州电子科技大学',
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
