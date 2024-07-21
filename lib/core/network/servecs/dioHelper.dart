import 'package:dio/dio.dart';

class Diohelper
{
  static  Dio? dio;

  static inint()
  {
    dio=Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        headers: {'Content-Type':'application/json'},
        receiveDataWhenStatusError: true,
      )
    );
  }

  static Future<Response> postData({required String url,required Map<String,dynamic>data})
  async {
  return  await dio!.post(url,data: data);
}

}



