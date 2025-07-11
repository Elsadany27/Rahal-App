import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/widgets/custome_loading_indicator.dart';
import '../../../view model/home_cubit.dart';
import '../../../view model/home_state.dart';

class CustomeDriverContainer extends StatelessWidget {
  const CustomeDriverContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;
    return BlocBuilder<HomeCubit,HomeState>(builder:(context, state) {
      final screenSize=MediaQuery.of(context).size;
      if(state is IsloadingGetSingleTrip){
        return Center(child: CustomeLoadingIndicator());
      }
      else if(state is SuccessGetSingleTrip){
        return Container(
            padding: EdgeInsets.symmetric(horizontal: screenSize.width*0.03),
            height: screenSize.height*0.07,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColor.greenLight
            ),
            child:Row(
              textDirection: TextDirection.rtl,
              children: [
                Icon(Icons.credit_card,color: AppColor.green,),SizedBox(width: screenSize.width*0.03,),
                Text("${state.dataSingleTrips!.driverName} السائق",style: TextStyle(color: AppColor.green,fontSize: screenSize.width*0.04,fontWeight: FontWeight.w800),textDirection: TextDirection.rtl,),
              ],
            )
        );
      }
      else if(state is FailureGetSingleTrips){
        return Center(child: Text("خطا فى تحميل البيانات"));
      }
      else {
        return Center(child: Text("غير متاح اسم السائق"));
      }
    },);
  }
}
