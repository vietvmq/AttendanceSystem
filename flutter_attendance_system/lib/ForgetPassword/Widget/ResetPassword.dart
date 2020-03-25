import 'package:flutter/material.dart';
import 'package:flutterattendancesystem/ForgetPassword/ForgetPasswordView.dart';

class ResetPasswordTextField extends StatefulWidget {
  @override
  _ResetPasswordTextFieldState createState() => _ResetPasswordTextFieldState();
}

class _ResetPasswordTextFieldState extends State<ResetPasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(labelText: 'Mật khẩu mới', border: OutlineInputBorder()),
      ),
    );
  }
}


class ValidationPassword extends StatefulWidget {
  @override
  _ValidationPasswordState createState() => _ValidationPasswordState();
}

class _ValidationPasswordState extends State<ValidationPassword> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(labelText: 'Nhập lại mật khẩu', border: OutlineInputBorder()),
      ),
    );
  }
}

class ResetButton extends StatefulWidget {
  @override
  _ResetButtonState createState() => _ResetButtonState();
}

class _ResetButtonState extends State<ResetButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 181,
      child: RaisedButton(
        color: Colors.lightBlueAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Text('Đặt lại mật khẩu',style: TextStyle(color: Colors.white),),
        onPressed: (){},
      ),
    );
  }
}


class ResetPasswordView extends StatefulWidget {
  @override
  _ResetPasswordViewState createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
          Navigator.of(context).popUntil((route) => route.isFirst);
        }),
        title: Container(margin: EdgeInsets.only(left: widthScreen / 7.3),child: Text('Nhập lại mật khẩu')),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10, top: 15),
                child: ResetPasswordTextField(),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: ValidationPassword(),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: ResetButton(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
