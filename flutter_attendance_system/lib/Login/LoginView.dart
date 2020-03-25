import 'package:flutter/material.dart';
import 'package:flutterattendancesystem/Login/LoginViewModel.dart';
import 'package:flutterattendancesystem/Login/Widget/ButtonLogin.dart';
import 'package:flutterattendancesystem/Login/Widget/ForgetPassword.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutterattendancesystem/Login/Widget/Email and Password Textfield.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: LoginScreenModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Đăng nhập'),
          ),
        ),
        body: ScopedModelDescendant<LoginScreenModel>(
          builder: (context, child, model){
            return Center(
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 100,
                        width: 100,
                        margin: const EdgeInsets.only(bottom: 14, left: 10, right: 10),
                        decoration: BoxDecoration(border: Border.all()),
                        child: Center(child: Text('Logo here')),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 14,left: 10, right: 10),
                      child: EmailTextField(loginScreenModel: model,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 14,left: 10, right: 10),
                      child: PasswordTextField(loginScreenModel: model,),
                    ),
                    Padding(padding: const EdgeInsets.only(bottom: 14, left: 10, right: 10),
                    child: ButtonLogin(loginScreenModel: model,),),
                    Padding(padding: const EdgeInsets.only(bottom: 14, left: 10, right: 10),
                      child: ForgetPassword(),),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}