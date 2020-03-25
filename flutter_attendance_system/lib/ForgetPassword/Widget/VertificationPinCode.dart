import 'package:flutter/material.dart';
import 'package:flutterattendancesystem/ForgetPassword/ForgetPasswordView.dart';
import 'package:flutterattendancesystem/ForgetPassword/Widget/ResetPassword.dart';
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

class VertificationButton extends StatefulWidget {
  @override
  _VertificationButtonState createState() => _VertificationButtonState();
}

class _VertificationButtonState extends State<VertificationButton> {
  @override
  Widget build(BuildContext context) {
    return Container();
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
          appBar: AppBar(
            title: Container(margin: EdgeInsets.only(left: widthSrceen / 7.3),child: Text('Quên mật khẩu')),
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
                        child: VertificationTextField(forgetPasswordViewModel: model,),
                      ),
                      SizedBox(height: 10,),
                      VertificationButton()
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