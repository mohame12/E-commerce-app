import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce_app/core/widgets/banner_card.dart';
import 'package:e_commerce_app/core/widgets/category_tab_bar_item.dart';
import 'package:e_commerce_app/features/presentation/shop_main_layout/views/taps/categors_tap/cubits/category_tap_cubit.dart';
import 'package:e_commerce_app/features/presentation/shop_main_layout/views/taps/categors_tap/cubits/category_tap_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../../../../style/colors.dart';

class CategorisTap extends StatelessWidget {
  const CategorisTap({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryTapCubit, CategoryTapState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        CategoryTapCubit cubit = CategoryTapCubit.get(context);
        return DefaultTabController(
          length: cubit.categoryDataList.length,
          child: Scaffold(
              appBar: AppBar(
                title: Text(
                  'Categors',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              body: cubit.categoryDataList.isNotEmpty
                  ? Column(
                      children: [
                        CarouselSlider(
                            items: cubit.categoryDataList.map((category) {
                              return BannerCard(image: category.image);
                            }).toList(),
                            options: CarouselOptions(
                              autoPlay: true,
                              enlargeCenterPage: true,
                              scrollPhysics: BouncingScrollPhysics(),
                              onPageChanged: (index, reason) {
                                cubit.changeSliderIndecator(index);
                              },
                            )),
                        DotsIndicator(
                          dotsCount: cubit.categoryDataList.length,
                          position: cubit.indx,
                          decorator: DotsDecorator(
                            activeColor: defColor,
                            size: const Size.square(5.0),
                            activeSize: const Size(10.0, 4.0),
                            activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3.0)),
                          ),
                        ),
                        TabBar(
                            physics: BouncingScrollPhysics(),
                            labelPadding: EdgeInsets.all(5),
                            overlayColor: WidgetStateColor.transparent,
                            labelColor: defColor,
                            tabAlignment: TabAlignment.start,
                            isScrollable: true,
                            indicatorColor: Colors.transparent,
                            dividerColor: Colors.transparent,
                            tabs: cubit.categoryDataList.map((e) {
                              return CategoryTabBarItem(text: e.name);
                            }).toList()),
                        
                        
                        Expanded(
                          child: GridView.count(crossAxisCount: 2,
                          children:
                          List.generate(cubit.categoryDataList.length, (index) => CategoryCardList(image: cubit.categoryDataList[index].image, text: cubit.categoryDataList[index].name),)
                          ),
                        )
                      ],
                    )
                  : Center(
                      child: LoadingAnimationWidget.staggeredDotsWave(
                          color: defColor, size: 20))),
        );
      },
    );
  }
}

class CategoryCardList extends StatelessWidget {
  const CategoryCardList({
    super.key, required this.image, required this.text,
  });

  final String image;
  final String text;
  

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.white,
      child: Column(
        children: [
          Image(image: NetworkImage(image),height: 150,width:200,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text,style: TextStyle(color: defColor),),
          )
        ],
      ),
    );
  }
}
