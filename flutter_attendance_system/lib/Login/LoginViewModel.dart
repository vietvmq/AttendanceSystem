import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:scoped_model/scoped_model.dart';


class LoginScreenModel extends Model {
  final _emailSubject = BehaviorSubject<String>();
  final _passSubject = BehaviorSubject<String>();
  final _btnSubject = BehaviorSubject<bool>();

  var emailValidation = StreamTransformer<String, String>.fromHandlers(
      handleData: (email, sink) {
        sink.add(Vadidation.validateEmail(email));
      });

  var passValidation = StreamTransformer<String, String>.fromHandlers(
      handleData: (pass, sink) {
        sink.add(Vadidation.validatePass(pass));
      });
  Stream<String> get emailStream => _emailSubject.stream.transform(emailValidation).skip(2);
  Sink<String> get emailSink => _emailSubject.sink;

  Stream<String> get passStream => _passSubject.stream.transform(passValidation).skip(2);
  Sink<String> get passSink => _passSubject.sink;

  Stream<bool> get btnStream => _btnSubject.stream;
  Sink<bool> get btnSink => _btnSubject.sink;

  LoginScreenModel() {
    Rx.combineLatest2(_emailSubject, _passSubject,(email,pass){
      return Vadidation.validatePass(pass) == null && Vadidation.validateEmail(email) == null;
    }).listen((enable){
      btnSink.add(enable);
    });
  }
  dispose(){
    _emailSubject.close();
    _passSubject.close();
    _btnSubject.close();
  }

}


class Vadidation {
  static String validatePass(String pass){
    if(pass == null)
    {
      return "Chưa nhập mật khẩu";
    }

    if(pass.length < 6)
    {
      return "Mật khẩu phải có ít nhất 6 ký tự";
    }
    return null;
  }

  static String validateEmail(String email){
    if(email == null)
    {
      return "Chưa nhập Email";
    }

    var isVal = RegExp(r"[a-zA-Z0-9.]+@[a-zA-Z0-9.]+\.[a-zA-Z]+").hasMatch(email);
    if(!isVal)
    {
      return "Email không khả dụng";
    }
    return null;
  }
}