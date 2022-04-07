import 'dart:convert';

import 'package:crypto/crypto.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class Md5Util {
  static get hex => null;

  /// md5 加密
  static String generateMd5(String data) {
    var content = new Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    // 这里其实就是 digest.toString()
    return hex.encode(digest.bytes);
  }
}

class LoginPage extends StatefulWidget {
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController controller = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  //焦点
  FocusNode _focusNodeUserName = new FocusNode(); //点击按钮时聚焦文本框
  FocusNode _focusNodePassWord = new FocusNode();

  bool check = false; //检查记住密码的按钮是否被选择

  var _isObscure = false; //是否以密文形式显示密码
  var userName;
  var userPass;
  String account;
  String password;
  var _isShowClear = false; //是否显示清楚内容的按钮
  @override
  void initState() {
    _focusNodeUserName.addListener(_focusNodeListener);
    _focusNodePassWord.addListener(_focusNodeListener);
    // 监听文本框输入变化，当有内容的时候，显示尾部清除按钮，否则不显示
    if (controller.text.length >= 0) {
      _isShowClear = true;
    } else {
      _isShowClear = false;
    }
    _incrementGetUser();
    super.initState();
  }

  @override
  void dispose() {
    _focusNodeUserName.removeListener(_focusNodeListener);
    _focusNodePassWord.removeListener(_focusNodeListener);
    controller.dispose();
    controller2.dispose();
    super.dispose();
  }

  String validateUserName(value) {
    if (value == null) {
      return '账号不能为空';
    }
    return null;
  }

  String validatePassWord(value) {
    if (value == null) {
      return '密码不能为空';
    }
    return null;
  }

  // 监听焦点
  Future _focusNodeListener() async {
    if (_focusNodeUserName.hasFocus) {
      print("用户名框获取焦点");
      // 取消密码框的焦点状态
      _focusNodePassWord.unfocus();
    }
    if (_focusNodePassWord.hasFocus) {
      print("密码框获取焦点");
      // 取消用户名框焦点状态
      _focusNodeUserName.unfocus();
    }
  }

  //脚手架
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[500],
      //GestureDetector监听函数——详情百度
      body: new GestureDetector(
        onTap: () {
          // 点击空白区域，回收键盘
          print("点击了空白区域");
          _focusNodePassWord.unfocus();
          _focusNodeUserName.unfocus();
        },
        //ScreenUtil屏幕适配
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: ScreenUtil().setHeight(50), //顶部到图片下面的距离
            ),
            _topHeader(),
            _loginInterface(),
          ],
        ),
      ),
    );
  }

  //topHeader函数
  Widget _topHeader() {
    return Container(
      height: ScreenUtil().setHeight(150), //图片下面到框的距离
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 5),
            child: ClipOval(
                child: Image.asset('images/3.jpg', width: 100, height: 100)),
          ),
        ],
      ),
    );
  }

  //loginInterface()函数
  Widget _loginInterface() {
    return SizedBox(
      height: ScreenUtil().setHeight(200), //登陆界面可以下拉多少
      child: Container(
        color: Colors.white,
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: Column(
            children: <Widget>[
              //第一个padding是输入用户名
              Padding(
                padding: EdgeInsets.fromLTRB(30, 25, 30, 0),
                child: TextFormField(
                  focusNode: _focusNodeUserName,
                  controller: controller,
                  maxLines: 1,
                  obscureText: false,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.black,
                  enabled: true,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(30),
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 10),
                    prefixIcon: Icon(Icons.person),
                    suffixIcon: (_isShowClear)
                        ? IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              // 清空输入框内容
                              controller.clear();
                            },
                          )
                        : null,
                    hintText: '请输入用户名',
                    hintStyle: TextStyle(
                        fontSize: ScreenUtil().setSp(30),
                        color: Colors.black12),
                  ),
                  validator: validateUserName,
                ),
              ),
              //第二个padding输入密码
              Padding(
                padding: EdgeInsets.fromLTRB(10, 25, 30, 0),
                child: TextFormField(
                  focusNode: _focusNodePassWord,
                  controller: controller2,
                  maxLines: 1,
                  obscureText: !_isObscure,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.black,
                  enabled: true,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(30),
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 10),
                    prefixIcon: Icon(Icons.lock),
                    hintText: '   请输入密码',
                    hintStyle: TextStyle(
                        fontSize: ScreenUtil().setSp(30),
                        color: Colors.black12),
                    suffixIcon: IconButton(
                        icon: Icon((_isObscure)
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        }),
                  ),
                  validator: validatePassWord,
                ),
              ),
              //第三个padding 记住密码
              Padding(
                  padding: EdgeInsets.fromLTRB(30, 25, 30, 0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 50, 0),
                          child: Text(
                            '记住密码',
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(30),
                            ),
                          ),
                        ),
                      ),
                      CupertinoSwitch(
                        value: check,
                        onChanged: (bool newValue) {
                          setState(() {
                            this.check = newValue;
                          });
                        },
                      ),
                    ],
                  )),
              //登录按钮
              Padding(
                padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: Container(
                  width: ScreenUtil().setWidth(700),
                  height: ScreenUtil().setHeight(50),
                  child: RaisedButton(
                    color: Colors.green,
                    onPressed: () {
                      _focusNodePassWord.unfocus();
                      _focusNodeUserName.unfocus();
                      if (_formKey.currentState.validate()) {
                        _postLogin(controller.text, controller2.text);
                      }

                      if (this.check == true) {
                        _incrementSaveUser();
                      } else {
                        _incrementClear();
                      }
                      _incrementSaveCheck();
                      //   dismiss(context);
                      // });
                    },
                    child: Text(
                      '登录',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(30),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //loading函数
  Widget _loading() {
    return Stack(
      children: <Widget>[
        Padding(
          padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 35.0),
          child: new Center(
            child: SpinKitFadingCircle(
              color: Colors.black,
              size: ScreenUtil().setSp(70.0),
            ),
          ),
        ),
      ],
    );
  }

  //提交登录，账号密码输的对不对，两种情况
  _postLogin(String userName, String userPassword) async {
    if (userName.isNotEmpty && userPassword.isNotEmpty) {
      var data = {
        'account': userName,
        'password': userPassword,
      };
      //用户密码正确
      if (userName == '1234' && userPassword == '1234') {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) {
            return IndexPage();
          }),
          (route) => route == null,
        );
        //用户密码输错
      } else {
        showDialog<Null>(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  '温馨提示',
                  style: new TextStyle(
                    color: Colors.black54,
                    fontSize: ScreenUtil().setSp(30),
                  ),
                ),
                content: new Text('请输入正确的用户名或密码'),
                actions: <Widget>[
                  new FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: new Text('确定')),
                ],
              );
            });
      }
    } else {
      debugPrint("the res is null");
    }
  }

  //记住密码的模块
  _incrementSaveCheck() async {
    print('即将保存的check状态: $check');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('check', check);
  }

  _incrementSaveUser() async {
    print('即将保存的账号:${controller.value.text.toString()}');
    print('即将保存的密码:${controller2.value.text.toString()}');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('account', controller.value.text.toString());
    await prefs.setString('password', controller2.value.text.toString());
  }

  _incrementGetUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final nickName = prefs.getString('account');
    final nickPass = prefs.getString('password');
    final check = prefs.getBool('check');
    setState(() {
      controller.text = (nickName == null ? "" : nickName);
      controller2.text = (nickPass == null ? "" : nickPass);
      this.check = (check == null ? false : check);
    });
    print('上一次保存的账号：${controller.value.text.toString()}');
    print('上一次保存的密码: ${controller2.value.text.toString()}');
    print('上一次保存的check状态: $check');
  }

  _incrementClear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
