
import 'package:e_commerce_app/features/presentation/shop_main_layout/views/taps/home_tap/cubits/home_tap_cubit/home_tap_state.dart';
import 'package:e_commerce_app/features/presentation/shop_main_layout/views/taps/home_tap/model/home_ttap_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../../core/network/servecs/dioHelper.dart';

class HomeTapCubit extends Cubit<HomeTapState>
{
  HomeTapCubit():super(HomeTapInitialState());
  static HomeTapCubit get(context)=>BlocProvider.of(context);

  List<dynamic>banners=[];
  List<dynamic>products=[];
  getHomeTapItem()
  {
    if(banners.isEmpty&&products.isEmpty) {
      emit(HomeTapLoadingDataState());
      Diohelper.getData(url: 'home', token:'').then((val) {
        HomeTapModel model = HomeTapModel.fromJson(val.data);
        banners = model.data.banners;
        products = model.data.products;
        emit(HomeTapSuccessDataState(model: model));
      }).catchError((e) {
        print(e.toString());
        emit(HomeTapFailuerState(e: e));
      });
    }
  }
  int index=0;
  void indx(int ind)
  {
    index=ind;
    emit(ChangeSlider());
  }


}