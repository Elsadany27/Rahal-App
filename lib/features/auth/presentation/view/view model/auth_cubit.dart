import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation/features/auth/data/datasource/auth_datasource.dart';
import 'package:reservation/features/auth/presentation/view/view%20model/auth_state.dart';

class AuthCubit extends Cubit<AuthState>{
  AuthCubit():super(InitialState());
  AuthDatasource _authDatasource=AuthDatasource();
  bool statee=true;

  changeState(){
    if(statee==false){
      statee=true;
      emit(UnVisibleState());
    }
    else{
      statee =false;
      emit(VisibleState());
    }
  }

  //register
  signupMethodCubit({String? email,String? password,context})async{
    // String? messageRegister;
    emit(IsloadingRegisterState());
    try{
      await _authDatasource.registerMethod(email: email,password: password,context: context);
      emit(SuccessRegisterState());
      print("تم");
    }catch(e){
      print(e);
      emit(FailureRegisterState(errorMessage: e.toString()));
    }
  }

  //login
  loginMethodCubit({String? email,String? password,context})async{
    emit(IsloadingLoginState());
    try{
      await _authDatasource.loginMethod(context: context,password: password,email: email);
      emit(SuccessLoginState());
    }catch(e){
      print(e);
      emit(FailureLoginState(errorMessage: e.toString()));
    }
  }

}