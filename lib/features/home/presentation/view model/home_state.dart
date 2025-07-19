import 'package:reservation/features/home/data/model/seats_available_model.dart';
import 'package:reservation/features/home/data/model/trips_model.dart';

import '../../data/model/single_trip_model.dart';

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

//get single trip
class IsloadingGetSingleTrip extends HomeState{}
class SuccessGetSingleTrip extends HomeState{
  SingleTripModel? dataSingleTrips;
  SuccessGetSingleTrip({required this.dataSingleTrips});
}
class FailureGetSingleTrips extends HomeState{
  String? errorMessage;
  FailureGetSingleTrips({this.errorMessage});
}

//available seats
class IsloadingSeats extends HomeState{}
class SuccessSeats extends HomeState{
  SeatsModel? seatsData;
  SuccessSeats({this.seatsData});
}
class FailureSeats extends HomeState{
  String? errorMessage;
  FailureSeats({this.errorMessage});
}