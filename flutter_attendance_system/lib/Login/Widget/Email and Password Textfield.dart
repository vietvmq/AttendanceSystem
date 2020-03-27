import 'package:flutter/material.dart';
import 'package:flutterattendancesystem/Login/LoginViewModel.dart';
import 'package:scoped_model/scoped_model.dart';

class EmailTextField extends StatefulWidget {
  LoginScreenModel loginScreenModel;

  EmailTextField({Key key, this.loginScreenModel}) : super(key: key);

  @override
  _EmailTextFieldState createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  TextEditingController emailController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController.addListener((){
      widget.loginScreenModel.emailSink.add(emailController.text);
    });
    emailController.text = "nhoxsieuquay@gmail.com";
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.loginScreenModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<String>(
          stream: widget.loginScreenModel.emailStream,
          builder: (context, snapshot) {
        return TextFormField(
          controller: emailController,
          style: TextStyle(
            fontSize: 20,
            color: Colors.lightBlueAccent,
          ),
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(labelText: "E-mail", border: OutlineInputBorder(), errorText: snapshot.data),
        );
      }),
    );
  }
}


class PasswordTextField extends StatefulWidget {
  LoginScreenModel loginScreenModel;

  PasswordTextField({Key key, this.loginScreenModel}) : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  TextEditingController passController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passController.addListener((){
      widget.loginScreenModel.passSink.add(passController.text);
    });
    passController.text = "123456";
  }

  @override
  void dispose() {
    // TODO: implement dispose
      super.dispose();
      widget.loginScreenModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<String>(
          stream: widget.loginScreenModel.passStream,
          builder: (context, snapshot) {
            return TextFormField(
              obscureText: true,
              controller: passController,
              style: TextStyle(
                fontSize: 20,
                color: Colors.lightBlueAccent,
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: "Mật khẩu", border: OutlineInputBorder(), errorText: snapshot.data),
            );
          }),
    );
  }
}
