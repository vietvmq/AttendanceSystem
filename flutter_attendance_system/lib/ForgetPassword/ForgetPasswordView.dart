import 'package:flutter/material.dart';
import 'package:flutterattendancesystem/ForgetPassword/ForgetPasswordViewModel.dart';
import 'package:flutterattendancesystem/ForgetPassword/Widget/VertificationEmail.dart';
import 'package:flutterattendancesystem/ForgetPassword/Widget/VertificationPinCode.dart';
import 'package:scoped_model/scoped_model.dart';


class ForgetPasswordView extends StatefulWidget {
  @override
  _ForgetPasswordViewState createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: ForgetPasswordViewModel(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Center(child: Text('Quên mật khẩu')),
        ),
        body: ScopedModelDescendant<ForgetPasswordViewModel>(
          builder: (context, child, model){
            return Center(
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: VertificationEmailTextField(forgetPasswordViewModel: model,),
                    ),
                    SizedBox(height: 10,),
                    VertificationEmailButton(forgetPasswordViewModel: model,)
                  ],
                ),
              ),
            );
          },
        )
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