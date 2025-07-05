import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation/core/widgets/custome_loading_indicator.dart';
import 'package:reservation/features/home/presentation/view%20model/home_cubit.dart';
import 'package:reservation/features/home/presentation/view%20model/home_state.dart';

class TripsPage extends StatelessWidget {
  const TripsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeCubit()..getTripsCubit(context: context),
        child: BlocBuilder<HomeCubit,HomeState>(builder: (context, state) {
          if(state is IsloadingGetTrips){
            return Center(child: CustomeLoadingIndicator());
          }
          else if(state is SuccessGetTrips){
            return ListView.builder(
                itemCount: state.dataTrips.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text("${state.dataTrips[index].fromArea}"),
                  subtitle: Text("${state.dataTrips[index].toArea}"),
                ),);
          }
          else if (state is FailureGetTrips){
            return Center(child: Text("خطا غير متوقع"));
          }
          else{
            return Center(child: Text("لا يوجد رحلات"));
          }
        },)
      ),
    );
  }
}
