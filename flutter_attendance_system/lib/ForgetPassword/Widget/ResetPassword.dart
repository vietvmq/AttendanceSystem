import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterattendancesystem/ForgetPassword/ForgetPasswordView.dart';
import 'package:flutterattendancesystem/ForgetPassword/ForgetPasswordViewModel.dart';
import 'package:scoped_model/scoped_model.dart';

//class ResetPasswordTextField extends StatefulWidget {
//  ForgetPasswordViewModel forgetPasswordViewModel;
//
//  GlobalKey<FormFieldState> passkey;
//
//  ResetPasswordTextField({Key key, this.passkey}) : super(key: key);
//
//  @override
//  _ResetPasswordTextFieldState createState() => _ResetPasswordTextFieldState();
//}
//
//class _ResetPasswordTextFieldState extends State<ResetPasswordTextField> {
//  TextEditingController passController = new TextEditingController();
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//        child: TextFormField(
//          key: widget.passkey,
//      controller: passController,
//      autofocus: true,
//      obscureText: true,
//      textInputAction: TextInputAction.next,
//      decoration: InputDecoration(
//        labelText: 'Mật khẩu mới',
//        border: OutlineInputBorder(),
//      ),
//    ));
//  }
//}
//
//class ValidationPassword extends StatefulWidget {
//  ForgetPasswordViewModel forgetPasswordViewModel;
//
//  GlobalKey<FormFieldState> passkey;
//
//  ValidationPassword({Key key, this.passkey}) : super(key: key);
//
//  @override
//  _ValidationPasswordState createState() => _ValidationPasswordState();
//}
//
//class _ValidationPasswordState extends State<ValidationPassword> {
//  TextEditingController confirmController = new TextEditingController();
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//        child: TextFormField(
//      validator: (confirmation) {
//        var password = widget.passkey.currentState.value;
//        print("password is: " + password);
//        return confirmation == password
//            ? null
//            : "Confirm Password should match password";
//      },
//      controller: confirmController,
//      obscureText: true,
//      textInputAction: TextInputAction.next,
//      decoration: InputDecoration(
//        labelText: 'Nhập lại mật khẩu',
//        border: OutlineInputBorder(),
//      ),
//    ));
//  }
//}
//
//class ResetButton extends StatefulWidget {
//  ForgetPasswordViewModel forgetPasswordViewModel;
//
//  GlobalKey<FormState> passkey = GlobalKey<FormState>();
//
//  ResetButton({Key key, this.passkey}) : super(key: key);
//
//  @override
//  _ResetButtonState createState() => _ResetButtonState();
//}
//
//class _ResetButtonState extends State<ResetButton> {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//            height: 48,
//            width: 181,
//            child: RaisedButton(
//              color: Colors.lightBlueAccent,
//              shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.all(Radius.circular(50))),
//              child: Text(
//                'Đặt lại mật khẩu',
//                style: TextStyle(color: Colors.white),
//              ),
//              onPressed: (){
//                if(widget.passkey.currentState.validate())
//                  {
//                    Scaffold.of(context)
//                        .showSnackBar(SnackBar(content: Text('Processing Data')));
//                  }
//              },
//            ),
//          );
//  }
//}

class ResetPasswordView extends StatefulWidget {
  @override
  _ResetPasswordViewState createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  GlobalKey<FormFieldState> passKey = GlobalKey<FormFieldState>();
  final _globalkey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> passFormKey = GlobalKey<FormState>();

  TextEditingController passController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.black,
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              }),
          title: Container(
              margin: EdgeInsets.only(left: widthScreen / 7.3),
              child: Text('Nhập lại mật khẩu')),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: passFormKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      height: 140,
                      width: 140,
                      child: Image.asset('images/resetpassword.png'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      child: Text('Nhập mật khẩu mới',
                          style: TextStyle(fontSize: 28)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      child: Center(
                          child: Text(
                        'Nhập mật khẩu mới để tiến hành đổi mật khẩu',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
                    child: Container(
                        child: TextFormField(
                          key: passKey,
                          controller: passController,
                          autofocus: true,
                          obscureText: true,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            labelText: 'Mật khẩu mới',
                            border: OutlineInputBorder(),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                        child: TextFormField(
                          validator: (confirmation) {
                            var password = passKey.currentState.value;
                            return confirmation == password
                                ? null
                                : "Confirm Password should match password";
                          },
                          controller: confirmController,
                          obscureText: true,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            labelText: 'Nhập lại mật khẩu',
                            border: OutlineInputBorder(),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    height: 48,
                    width: 181,
                    child: RaisedButton(
                      color: Colors.lightBlueAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: Text(
                        'Đặt lại mật khẩu',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: (){
                        if(passFormKey.currentState.validate())
                        {
                          showDialog(context: context,builder: (BuildContext context) => AlertDialog(content: Text("Đổi mật khẩu thành công"),));
                        }
                      },
                    ),
                  ),
                )
                ],
              ),
            ),
          ),
        ));
  }
}
