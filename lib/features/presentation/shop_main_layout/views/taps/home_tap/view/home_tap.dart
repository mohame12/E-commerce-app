import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce_app/features/presentation/shop_main_layout/views/taps/home_tap/cubits/home_tap_cubit/home_tap_cubit.dart';
import 'package:e_commerce_app/features/presentation/shop_main_layout/views/taps/home_tap/cubits/home_tap_cubit/home_tap_state.dart';
import 'package:e_commerce_app/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../core/widgets/banner_card.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../../../../core/widgets/grid_view_items.dart';
class HomeTap extends StatelessWidget {
  const HomeTap({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeTapCubit, HomeTapState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        HomeTapCubit cubit = HomeTapCubit.get(context);

        return Scaffold(
            appBar: AppBar(
              forceMaterialTransparency: true,
              centerTitle: false,
              backgroundColor: Colors.transparent,
              title: Text('M Y  S H O P E', style: Theme
                  .of(context)
                  .textTheme
                  .titleMedium,),
              actions: [
                IconButton(icon: const Icon(Icons.search), onPressed: () {},)
              ],
            ),
            body: cubit.banners.isNotEmpty ?
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  CarouselSlider(
                      items: cubit.banners.map((banner) {
                        return BannerCard(image: banner.image);
                      }).toList(), options: CarouselOptions(
                    enlargeCenterPage: true,
                    autoPlay: true,
                    scrollPhysics: const BouncingScrollPhysics(),
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    onPageChanged: (index, reason) {
                      cubit.indx(index);
                    },
                  )),
                  DotsIndicator(
                    dotsCount: cubit.banners.length,
                    position: cubit.index,
                    decorator: DotsDecorator(
                      activeColor: defColor,
                      size: const Size.square(5.0),
                      activeSize: const Size(10.0, 4.0),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0)),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Products...',textAlign: TextAlign.start,style: TextStyle(color: Colors.grey),),
                      )),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top:5 ),
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount:2 ,

                      children:
                        List.generate(cubit.products.length,(index) => GridViewItemBulder(image: cubit.products[index].image, name: cubit.products[index].name,
                          price: cubit.products[index].price, old_price: cubit.products[index].oldPrice, discount: cubit.products[index].discount, favorit: cubit.products[index].inFavorites,
                        ), ),
                      ),
                  )
              
                ],
              ),
            ) : Center(child: LoadingAnimationWidget.staggeredDotsWave(color: defColor, size: 20))
        );
      },
    );
  }
}






