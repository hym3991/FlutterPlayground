import 'package:flutter/material.dart';
import 'dart:ui' as ui show window, PointerDataPacket;
class AutoScreenUtil{

  static AutoScreenUtil instance = new AutoScreenUtil();

  double width;
  double height;

  static MediaQueryData _mediaQueryData;
  static double _screenWidth;
  static double _screenHeight;

  AutoScreenUtil({
    this.width = 750,
    this.height = 1920,
  });

  static AutoScreenUtil getInstance() {
    return instance;
  }

  void init() {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    _mediaQueryData = mediaQuery;
    _screenWidth = ui.window.physicalSize.width;
    _screenHeight = ui.window.physicalSize.height;
    print("width:$_screenWidth");
    print("width:$_screenHeight");
    print("ued width:$width");
    print("ued width:$height");
  }

  static MediaQueryData get mediaQueryData => _mediaQueryData;

  getAdapterRatio() {
    return ui.window.physicalSize.width / width;
  }

  getAdapterRatioRatio() {
    return getAdapterRatio() / ui.window.devicePixelRatio;
  }

  getScreenAdapterSize() {
    return Size(width, ui.window.physicalSize.height / getAdapterRatio());
  }
}