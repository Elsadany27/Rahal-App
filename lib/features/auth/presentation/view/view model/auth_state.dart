abstract class AuthState {}
class InitialState extends AuthState{}

class VisibleState extends AuthState{}
class UnVisibleState extends AuthState{}

//register
class IsloadingRegisterState extends AuthState{}
class SuccessRegisterState extends AuthState{}
class FailureRegisterState extends AuthState{
  String? errorMessage;
  FailureRegisterState({this.errorMessage});
}
//login
class IsloadingLoginState extends AuthState{}
class SuccessLoginState extends AuthState{}
class FailureLoginState extends AuthState{
  String? errorMessage;
  FailureLoginState({this.errorMessage});
}