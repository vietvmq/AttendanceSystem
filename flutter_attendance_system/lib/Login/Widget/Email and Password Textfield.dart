import 'package:flutter/material.dart';
import 'package:flutterattendancesystem/Login/LoginScreenModel.dart';
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
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<String>(
          stream: widget.loginScreenModel.emailStream,
          builder: (context, snapshot) {
        return TextFormField(
          controller: emailController,
        );
      }),
    );
  }
}
