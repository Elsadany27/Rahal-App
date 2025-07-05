import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation/features/home/data/datasource/home_datasource.dart';
import 'package:reservation/features/home/data/model/trips_model.dart';
import 'package:reservation/features/home/presentation/view%20model/home_state.dart';

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

}