import 'package:e_commerce_app/core/network/servecs/dioHelper.dart';
import 'package:e_commerce_app/features/presentation/shop_main_layout/views/taps/categors_tap/cubits/category_tap_state.dart';
import 'package:e_commerce_app/features/presentation/shop_main_layout/views/taps/categors_tap/model/category_data_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryTapCubit extends Cubit<CategoryTapState>
{
  CategoryTapCubit():super(CategoryTapInitialState());
  static CategoryTapCubit get(context)=>BlocProvider.of(context);


  List<dynamic> categoryDataList=[];

  getCategoryData()
  {
    if(categoryDataList.isEmpty) {
      emit(CategoryTapLoadingDataState());
      Diohelper.getData(url: 'categories', token: '').then((val) {
        CategoryTapModel categoryData = CategoryTapModel.fromJson(val.data);
        categoryDataList = categoryData.data.data;
        print(categoryDataList);
        emit(CategoryTapSuccessDataState());
      }).catchError((e) {
        print(e.toString());
        emit(CategoryTapFailuerState(e: e));
      });
    }
  }

  int indx=0;
  changeSliderIndecator(index)
  {
    indx=index;
    emit(ChangeSliderCategoryState());
  }
}