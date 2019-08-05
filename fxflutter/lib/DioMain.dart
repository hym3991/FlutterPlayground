import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() => runApp(FxAppRoot());

class FxAppRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          backgroundColor: Colors.blue
      ),
      home: FxAppRootHome(),
    );
    }
}

class FxAppRootHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void getHttp() async{
    Dio dio = new Dio();
    dio.options.baseUrl = "http://base";
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 3000;

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) async {
        // 在请求被发送之前做一些事情
        // 可进行一异步操作
        //...If no token, request token firstly.
        Response response = await dio.get("/token");
        //Set the token to headers
        options.headers["token"] = response.data["data"]["token"];
        //锁定解锁 实现串行化
        dio.interceptors.requestLock.lock();
        dio.interceptors.requestLock.unlock();
        return options;
      },
      onResponse:(Response response) {
        // 在返回响应数据之前做一些预处理
        return response; // continue
      },
      onError: (DioError e) {
        // 当请求失败时做一些预处理
        return e;//continue
      }
    ));
    dio.interceptors.add(LogInterceptor(responseBody: false));

    Response<String> response = await dio.get<String>("https://www.google.com");
  }
}


