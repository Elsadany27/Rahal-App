abstract class AuthState {}
class InitialState extends AuthState{}

class VisibleState extends AuthState{}
class UnVisibleState extends AuthState{}

//register
class IsloadingRegisterState extends AuthState{}
class SuccessRegisterState extends AuthState{
  String? succesMessage;

  SuccessRegisterState({required this.succesMessage});
}
class FailureRegisterState extends AuthState{
  String? errorMessage;
  FailureRegisterState({this.errorMessage});
}