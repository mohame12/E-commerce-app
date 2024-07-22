import 'package:dio/dio.dart';

class Diohelper
{
  static  Dio? dio;

  static inint()
  {
    dio=Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
      )
    );
  }

  static Future<Response> postData({required String url,required Map<String,dynamic>data})
  async {
    dio!.options.headers={
      'lang':'ar',
      'Content-Type':'application/json',
    };
  return  await dio!.post(url,data: data);
}


  static Future<Response> getData({required String url, required String token})
  async {
    dio!.options.headers={
      'lang':'en',
      'Content-Type':'application/json',
      'Authorization':token??''
    };
    return await dio!.get(url,);
  }

}



