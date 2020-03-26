import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:scoped_model/scoped_model.dart';


class ForgetPasswordViewModel extends Model {
  final _emailSubject = BehaviorSubject<String>();
  final _codeSubject = BehaviorSubject<String>();
  final _btnSubject = BehaviorSubject<bool>();
  final _colorSubject = BehaviorSubject<bool>();
  final _passSubject = BehaviorSubject<String>();
  final _confirmPassSubject = BehaviorSubject<String>();
  final _btnConfirmSubject = BehaviorSubject<bool>();


  var emailValidation = StreamTransformer<String, String>.fromHandlers(
      handleData: (email, sink) {
        sink.add(Vadidation.validateEmail(email));
      });

  var codeValidation = StreamTransformer<String, String>.fromHandlers(
      handleData: (code, sink) {
        sink.add(Vadidation.validateCode(code));
      });

  var passValidation = StreamTransformer<String, String>.fromHandlers(
      handleData: (pass, sink) {
        sink.add(Vadidation.validatePass(pass));
      });

  var confirmValidation = StreamTransformer<String, String>.fromHandlers(
      handleData: (confirm, sink) {
        sink.add(Vadidation.validatePass(confirm));
      });

  Stream<String> get emailStream => _emailSubject.stream.transform(emailValidation).skip(2);
  Sink<String> get emailSink => _emailSubject.sink;

  Stream<String> get codeStream => _codeSubject.stream.transform(codeValidation).skip(2);
  Sink<String> get codeSink => _codeSubject.sink;

  Stream<bool> get btnStream => _btnSubject.stream;
  Sink<bool> get btnSink => _btnSubject.sink;

  Stream<bool> get colorStream => _colorSubject.stream;
  Sink<bool> get colorSink => _colorSubject.sink;

  Stream<String> get passStream => _passSubject.stream.transform(passValidation).skip(2);
  Sink<String> get passSink => _passSubject.sink;

  Stream<String> get confirmPassStream => _confirmPassSubject.stream.transform(confirmValidation).skip(1);
  Sink<String> get confirmPassSink => _confirmPassSubject.sink;

  Stream<bool> get btnConfirmStream => _btnConfirmSubject.stream;
  Sink<bool> get btnConfirmSink => _btnConfirmSubject.sink;


  ForgetPasswordViewModel() {
    Rx.combineLatest([_emailSubject],(email){
      return Vadidation.validateEmail(email[0]) == null;
    }).listen((enable){
      btnSink.add(enable);
    });

    Rx.combineLatest([_codeSubject],(code){
      return Vadidation.validatePass(code[0]) == null;
    }).listen((enable){
      colorSink.add(enable);
    });

    Rx.combineLatest2(_passSubject, _confirmPassSubject, (pass, confirm){
      return Vadidation.validatePass(pass) == null && Vadidation.validatePass(confirm) == null;}).listen((enable) {
        btnConfirmSink.add(enable);
    });
  }
  dispose(){
    _emailSubject.close();
    _codeSubject .close();
    _btnSubject.close();
    _colorSubject.close();
    _passSubject.close();
    _confirmPassSubject.close();
    _btnConfirmSubject.close();
  }

}


class Vadidation {
  static String validateCode(String pass){
    if(pass == null)
    {
      return 'false';
    }

    if(pass.length < 6)
    {
      return 'false';
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

  static String confirmPass(String pass, String confirm){
    if(pass == null)
    {
      return "Chưa nhập mật khẩu";
    }

    if(pass.length < 6)
    {
      return "Mật khẩu phải có ít nhất 6 ký tự";
    }

    if(pass != confirm){
      return "Mật khẩu không khớp";
    }
    return null;
  }
}