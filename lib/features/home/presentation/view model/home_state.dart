import 'package:reservation/features/home/data/model/trips_model.dart';

abstract class HomeState {}
class InitialState extends HomeState{}

//get trips
class IsloadingGetTrips extends HomeState{}
class SuccessGetTrips extends HomeState{
  List<TripsModel> dataTrips;
  SuccessGetTrips({required this.dataTrips});
}
class FailureGetTrips extends HomeState{
  String? errorMessage;
  FailureGetTrips({this.errorMessage});
}