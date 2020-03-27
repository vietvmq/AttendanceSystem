import 'package:flutter/material.dart';
import 'package:flutterattendancesystem/Login/LoginViewModel.dart';

class ButtonLogin extends StatefulWidget {
  LoginScreenModel loginScreenModel;

  ButtonLogin({Key key, this.loginScreenModel}) : super(key: key);

  @override
  _ButtonLoginState createState() => _ButtonLoginState();
}

class _ButtonLoginState extends State<ButtonLogin> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: widget.loginScreenModel.btnStream,
      builder: (context, snapshot) {
        return Container(
          height: 48,
          width: 434,
          child: RaisedButton(
            color: Colors.black,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Text('Đăng nhập', style: TextStyle(fontSize: 16, color: Colors.white),),
            onPressed: snapshot.data == true ? (){
              Navigator.of(context).pushReplacementNamed('/home');
            } : null,
          ),
        );
      }
    );
  }
}
