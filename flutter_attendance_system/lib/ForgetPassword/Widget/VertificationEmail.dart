import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../ForgetPasswordViewModel.dart';
import 'VertificationPinCode.dart';

class VertificationEmailTextField extends StatefulWidget {
  ForgetPasswordViewModel forgetPasswordViewModel;

  VertificationEmailTextField({Key key, this.forgetPasswordViewModel}) : super(key: key);

  @override
  _VertificationEmailTextFieldState createState() => _VertificationEmailTextFieldState();
}

class _VertificationEmailTextFieldState extends State<VertificationEmailTextField> {
  TextEditingController emailController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController.addListener((){
      widget.forgetPasswordViewModel.emailSink.add(emailController.text);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.forgetPasswordViewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<String>(
          stream: widget.forgetPasswordViewModel.emailStream,
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


 class VertificationEmailButton extends StatefulWidget {

  ForgetPasswordViewModel forgetPasswordViewModel;

  VertificationEmailButton({Key key, this.forgetPasswordViewModel}) : super(key: key);

   @override
   _VertificationEmailButtonState createState() => _VertificationEmailButtonState();
 }

 class _VertificationEmailButtonState extends State<VertificationEmailButton> {

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    widget.forgetPasswordViewModel.btnSink.add(true);
  }

  @override
   Widget build(BuildContext context) {
     return StreamBuilder<bool>(
       stream: widget.forgetPasswordViewModel.btnStream,
       builder: (context, snapshot){
         return Container(
           alignment: Alignment.bottomCenter,
           height: 48,
           width: 400,
           child: RaisedButton(
             color: Colors.lightBlue,
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
             onPressed: snapshot.data == true ? () {
               Navigator.of(context).push(MaterialPageRoute(builder: (context) => PinCodeView()));
             } : null,
             child: Text('Gửi mã xác thực',style: TextStyle(fontSize: 14, color: Colors.white),),
           ),
         );
       },
     );
   }
 }

