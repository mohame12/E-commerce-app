import 'package:e_commerce_app/features/presentation/shop_main_layout/views/taps/home_tap/cubits/home_tap_cubit/home_tap_state.dart';
import 'package:e_commerce_app/features/presentation/shop_main_layout/views/taps/home_tap/model/home_ttap_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../../core/network/servecs/dioHelper.dart';
import '../../../favorits_tap/models/fav_tap_model.dart';
import '../../model/favorit_model.dart';

class HomeTapCubit extends Cubit<HomeTapState>
{
  HomeTapCubit():super(HomeTapInitialState());
  static HomeTapCubit get(context)=>BlocProvider.of(context);

  List<dynamic>banners=[];
  List<dynamic>products=[];
  Map<dynamic,bool>favorit={};
  getHomeTapItem()
  {

      emit(HomeTapLoadingDataState());
      Diohelper.getData(url: 'home', token: 'hi1XsRenOQHTtyYdlaKAmbCf907ZqGq18hIAbtw5jruRh6iOsHDkdiPVni6Fi0FCJW96oP').then((val) {
        HomeTapModel model = HomeTapModel.fromJson(val.data);
        banners = model.data.banners;
        products = model.data.products;
        for(var f in products)
          {
            favorit.addAll({
              f.id:f.inFavorites
            });
          }
        print(favorit);
        emit(HomeTapSuccessDataState(model: model));
      }).catchError((e) {
        print(e.toString());
        emit(HomeTapFailuerState(e: e));
      });

  }

  postfavorit({required int id})
  {
    favorit[id] = !favorit[id]!;
    emit(FavoritChangeState());
    Diohelper.postData(url: 'favorites', data: {'product_id':id}, token: 'hi1XsRenOQHTtyYdlaKAmbCf907ZqGq18hIAbtw5jruRh6iOsHDkdiPVni6Fi0FCJW96oP').then((val){
      print(val);
      print(favorit);
      Favorit favorits=Favorit.fromJson(val.data);
      if(!favorits.status)
        {
          favorit[id] = !favorit[id]!;
        }
      else
        {
          getfavorit();
        }
      emit(FavoritSuccessState(msg: favorits.message, state: favorits.status));
    }).catchError((e){
      favorit[id] = !favorit[id]!;
      emit(FavoritFailurState(e: e.toString()));
    });
  }


  int index=0;
  void indx(int ind)
  {
    index=ind;
    emit(ChangeSlider());
  }





  List<dynamic>data=[];
  getfavorit()
  {
    emit(FavoritLoadingState());
    Diohelper.getData(url:'favorites' , token: 'hi1XsRenOQHTtyYdlaKAmbCf907ZqGq18hIAbtw5jruRh6iOsHDkdiPVni6Fi0FCJW96oP').then((val){
      FavTapData favTapData=FavTapData.fromJson(val.data);
      data=favTapData.data.data;
      emit(FavoritSuccessdataState());

    }).catchError((e){
      print(e.toString());
      emit(FavoritFailuerdataState(e: e));

    });
  }

}