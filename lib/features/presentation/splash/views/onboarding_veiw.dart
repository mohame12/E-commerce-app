import 'package:e_commerce_app/core/sharedpref/shared_pref.dart';
import 'package:e_commerce_app/features/presentation/login/views/login.dart';
import 'package:e_commerce_app/core/widgets/onboard_itemBuilder_widget.dart';
import 'package:e_commerce_app/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../model/page_view_model.dart';

class OnboardingVeiw extends StatefulWidget {
  static const String id='Onboarding';
   OnboardingVeiw({super.key});


  @override
  State<OnboardingVeiw> createState() => _OnboardingVeiwState();
}

class _OnboardingVeiwState extends State<OnboardingVeiw> {
  PageController pageController=PageController();



  List<PageViewModel> pages=[
    PageViewModel(image: 'assets/images/Dark Blue and Orange Online Shop Logo.png',title: '1'),
    PageViewModel(image: 'assets/images/تصميم بدون عنوان.png',title: '2'),
    PageViewModel(image: 'assets/images/2.png',title: '3'),
  ];
  bool last =false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [Padding(
          padding: const EdgeInsetsDirectional.only(end: 8),
          child: TextButton(onPressed: (){

            buildPushReplacementNamed(context);


          }, child: Text('S K I P',style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: defColor
          ))),
        )],
      ),
      body:
      Padding(
        padding:  const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                physics: const BouncingScrollPhysics(),
                onPageChanged: (int index)
                {
                  last=(index==pages.length-1);
                },
                itemCount: pages.length,
                itemBuilder: (context, index) => OnboardItembuilderWidget(model: pages[index],),),
            ),
            Row(
              children: [
                SmoothPageIndicator(
                    effect:const ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      activeDotColor: defColor,
                      dotHeight: 10,
                      dotWidth: 10,
                      spacing: 6

                    ) ,
                    controller:pageController , count: 3),

                const Spacer(flex: 1,),
                FloatingActionButton(
                  backgroundColor: defColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),
                  onPressed: (){
                    if(last)
                      {
                        buildPushReplacementNamed(context);
                      }
                    else
                      {
                        pageController.nextPage(duration: const Duration(milliseconds: 800), curve: Curves.fastLinearToSlowEaseIn);
                      }
    },
                  child: const Icon(Icons.arrow_forward_ios,color: Colors.white,),)
              ],
            )
          ],
        ),
      ) ,

    );
  }

   buildPushReplacementNamed(BuildContext context)
   {

     UserDataFromStorage.setOnBoardingOpened(true);
     Navigator.pushReplacementNamed(context, LoginView.id);
   }
}
