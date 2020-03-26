import 'package:flutter/material.dart';
import 'package:flutterattendancesystem/ForgetPassword/ForgetPasswordView.dart';
import 'package:flutterattendancesystem/ForgetPassword/Widget/ResetPassword.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:scoped_model/scoped_model.dart';

import '../ForgetPasswordViewModel.dart';


class VertificationTextField extends StatefulWidget {
  ForgetPasswordViewModel forgetPasswordViewModel;

  VertificationTextField({Key key,this.forgetPasswordViewModel}) : super(key: key);

  @override
  _VertificationTextFieldState createState() => _VertificationTextFieldState();
}

class _VertificationTextFieldState extends State<VertificationTextField> {
  TextEditingController codeController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    codeController.addListener((){
      widget.forgetPasswordViewModel.codeSink.add(codeController.text);
    });
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: widget.forgetPasswordViewModel.colorStream,
      builder: (context, snapshot) {
        return PinInputTextField(
          controller: codeController,
          pinLength: 6,
          autoFocus: true,
          keyboardType: TextInputType.number,
          decoration: UnderlineDecoration(color: snapshot.data == true ? Colors.lightBlueAccent : Colors.red),
          onSubmit: (pincode){
            print(pincode);
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ResetPasswordView()));
          },
        );
      }
    );
  }
}

class ReSentPinCode extends StatefulWidget {
  @override
  _ReSentPinCodeState createState() => _ReSentPinCodeState();
}

class _ReSentPinCodeState extends State<ReSentPinCode> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        child: Text('Gửi lại mã xác thực', style: TextStyle(fontSize: 15,decoration: TextDecoration.underline),),
      ),
    );
  }
}


class PinCodeView extends StatefulWidget {
  @override
  _PinCodeViewState createState() => _PinCodeViewState();
}

class _PinCodeViewState extends State<PinCodeView> {
  @override
  Widget build(BuildContext context) {
    final widthSrceen = MediaQuery.of(context).size.width;
    return ScopedModel(
      model: ForgetPasswordViewModel(),
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(backgroundColor: Colors.white,elevation: 0,iconTheme: IconThemeData(color: Colors.black),),
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
                        child: Container(
                          height: 140,
                          width: 140,
                          child: Lottie.asset('images/verti.json'),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          child: Center(child: Text('Xác thực',style: TextStyle(fontSize: 28, color: Colors.black),)),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          child: Center(child: Text('Nhập mã xác thực bạn nhận được vào bên dưới',style: TextStyle(fontSize: 14),)),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: VertificationTextField(forgetPasswordViewModel: model,),
                      ),
                      SizedBox(height: 10,),
                      ReSentPinCode()
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