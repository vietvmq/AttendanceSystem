import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterattendancesystem/ForgetPassword/ForgetPasswordView.dart';
import 'package:flutterattendancesystem/ForgetPassword/ForgetPasswordViewModel.dart';
import 'package:scoped_model/scoped_model.dart';

class ResetPasswordTextField extends StatefulWidget {

  ForgetPasswordViewModel forgetPasswordViewModel;

  ResetPasswordTextField({Key key,this.forgetPasswordViewModel}) : super(key: key);

  @override
  _ResetPasswordTextFieldState createState() => _ResetPasswordTextFieldState();
}

class _ResetPasswordTextFieldState extends State<ResetPasswordTextField> {

  TextEditingController passController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passController.addListener((){
      widget.forgetPasswordViewModel.passSink.add(passController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<String>(
        stream: widget.forgetPasswordViewModel.passStream,
        builder: (context, snapshot) {
          return TextFormField(
            controller: passController,
            autofocus: true,
            obscureText: true,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                labelText: 'Mật khẩu mới', border: OutlineInputBorder(),errorText: snapshot.data),
          );
        }
      ),
    );
  }
}

class ValidationPassword extends StatefulWidget {

  ForgetPasswordViewModel forgetPasswordViewModel ;

  ValidationPassword({Key key, this.forgetPasswordViewModel}) : super(key: key);

  @override
  _ValidationPasswordState createState() => _ValidationPasswordState();
}

class _ValidationPasswordState extends State<ValidationPassword> {

  TextEditingController confirmController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    confirmController.addListener((){
      widget.forgetPasswordViewModel.confirmPassSink.add(confirmController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<String>(
        stream: widget.forgetPasswordViewModel.confirmPassStream,
        builder: (context, snapshot) {
          return TextFormField(
            controller: confirmController,
            obscureText: true,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                labelText: 'Nhập lại mật khẩu',
                border: OutlineInputBorder(),
              errorText: snapshot.data
               ),
          );
        }
      ),
    );
  }
}

class ResetButton extends StatefulWidget {

  ForgetPasswordViewModel forgetPasswordViewModel;

  ResetButton({Key key, this.forgetPasswordViewModel}) : super(key: key);

  @override
  _ResetButtonState createState() => _ResetButtonState();
}

class _ResetButtonState extends State<ResetButton> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: widget.forgetPasswordViewModel.btnConfirmStream,
      builder: (context, snapshot) {
        return Container(
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
            onPressed: snapshot.data ? () {} : null,
          ),
        );
      }
    );
  }
}

class ResetPasswordView extends StatefulWidget {
  @override
  _ResetPasswordViewState createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  GlobalKey<FormFieldState> passKey;
  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    return ScopedModel(
      model: ForgetPasswordViewModel(),
      child: Scaffold(
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
        body: ScopedModelDescendant<ForgetPasswordViewModel>(
          builder: (context, child, model){
           return Center(
              child: SingleChildScrollView(
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
                        child:
                        Text('Nhập mật khẩu mới', style: TextStyle(fontSize: 28)),
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
                      child: ResetPasswordTextField(forgetPasswordViewModel: model,),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: ValidationPassword(forgetPasswordViewModel: model,),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: ResetButton(forgetPasswordViewModel: model,),
                    )
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
