import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation/features/home/data/datasource/home_datasource.dart';
import 'package:reservation/features/home/data/model/trips_model.dart';
import 'package:reservation/features/home/presentation/view%20model/home_state.dart';

import '../../data/model/single_trip_model.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit():super(InitialState());
  HomeDatasource _homeDatasource=HomeDatasource();
  //get trips
  getTripsCubit({context})async{
    List<TripsModel>? dataTripss;
    emit(IsloadingGetTrips());
    try{
      dataTripss =await _homeDatasource.getTrips(context: context);
      emit(SuccessGetTrips(dataTrips: dataTripss!));
    }catch(e){
      emit(FailureGetTrips(errorMessage: e.toString()));
    }
  }

  //get trips
  getSingleTripCubit({context,int? id})async{
    SingleTripModel? dataSingleTrip;
    emit(IsloadingGetSingleTrip());
    try{
      dataSingleTrip =await _homeDatasource.getSingleTrips(context: context,id: id);
      emit(SuccessGetSingleTrip(dataSingleTrips: dataSingleTrip!));
    }catch(e){
      emit(FailureGetSingleTrips(errorMessage: e.toString()));
    }
  }

}