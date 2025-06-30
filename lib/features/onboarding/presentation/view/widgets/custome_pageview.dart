import 'package:flutter/material.dart';
import 'package:reservation/core/routes/app_routes.dart';
import 'package:reservation/core/utils/app_image.dart';
import 'package:reservation/features/onboarding/data/static_data.dart';
import '../../../../../core/utils/app_color.dart';

class CustomePageview extends StatefulWidget {
  const CustomePageview({super.key});

  @override
  State<CustomePageview> createState() => _CustomePageviewState();
}

class _CustomePageviewState extends State<CustomePageview> {

  List<StaticData> data=[
    StaticData(image: Assets.on1Image,title: "حجز سريع وسهل",subtitle: "احجز تذكرتك فى ثوانى بخطوات بسيطه , دون الحاجه للانتظار"),
    StaticData(image: Assets.on2Image,title: "سائقك بين يديك",subtitle: "اطلَع على ملف السائق ,خبراته,وتقييمات الركاب لضمان رحله امنه ومريحه."),
    StaticData(image: Assets.on3Image,title: "تتبع الباص لحظياً",subtitle: "اعرف موقع الباص فى اى لحظه واحصل على اشعارات بوقت الوصول والتأخير"),
  ];
  int indexx=0;
  PageController _pageController=PageController();
  
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(top: screenSize.height*0.07,bottom: screenSize.height*0.08),
            height: screenSize.height*0.62,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  indexx=value;
                });
              },
              itemCount: 3,
              itemBuilder: (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(height: screenSize.height*0.5,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("${data[index].image}"),fit: BoxFit.fill)),),
                  Text("${data[index].title}",style: TextStyle(fontSize: screenSize.width*0.06,color: AppColor.blackLight,fontWeight: FontWeight.w700),textAlign: TextAlign.center,),SizedBox(height: screenSize.height*0.01,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Text("${data[index].subtitle}",style: TextStyle(fontSize: screenSize.width*0.033,color: AppColor.blackLight,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
                  ),
                ],
              ),)
        ),

        //points
        Row(
          children: [
            //button
            Container(
              margin: EdgeInsets.only(right: screenSize.width*0.6,left: screenSize.width*0.02),
              height: screenSize.height*0.07,
              width: screenSize.width*0.15,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),border: Border.all(color: AppColor.green,width: 2.5),),
              child: CircleAvatar(child: IconButton(onPressed: (){
                setState(() {
                  indexx==2?Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.registerScreen, (route) => false,):_pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
                });
              }, icon: Icon(Icons.arrow_back_ios_outlined,size: screenSize.height*0.02,),color: Colors.white,),backgroundColor: AppColor.green,),
            ),

          ...List.generate(3, (index) => AnimatedContainer(
            duration: Duration(milliseconds: 500),
            margin: EdgeInsets.symmetric(horizontal: screenSize.width*0.01),
            height:screenSize.height* 0.010,width:indexx==index?screenSize.width*0.065: screenSize.width*0.022,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color:indexx==index?AppColor.green:Color(0xffC1D7CA),),
          ),)
        ],)
      ],
    );
  }
}
