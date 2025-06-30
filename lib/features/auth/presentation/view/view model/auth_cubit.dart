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
  signupMethodCubit({String? email,String? password,required BuildContext context})async{
    String? messageRegister;
    emit(IsloadingRegisterState());
    try{
      messageRegister =await _authDatasource.registerMethod(email: email,password: password);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$messageRegister")));
      emit(SuccessRegisterState(succesMessage: messageRegister));
      print("تم");
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$messageRegister")));
      print(e);
      emit(FailureRegisterState(errorMessage: e.toString()));
    }
  }
}