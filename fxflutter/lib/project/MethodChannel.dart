import 'dart:async';
import 'package:flutter/services.dart';

const MethodChannel _chnnel = const MethodChannel("com.sankuai.waimai/network");
Future<Map<String,dynamic>> post(String path,[Map<String,dynamic> form]) async{

  return _chnnel.invokeMethod("post",{"path":"baidu"}).then((result){
    return new Map<String , dynamic>.from(result);
  }).catchError((_)=>null);

  }