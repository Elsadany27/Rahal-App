import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation/features/auth/presentation/view/view%20model/auth_state.dart';

class AuthCubit extends Cubit<AuthState>{
  AuthCubit():super(InitialState());
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
}