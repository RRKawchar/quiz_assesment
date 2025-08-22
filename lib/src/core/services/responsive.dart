
import 'package:flutter/material.dart';

enum DeviceType { mobile, tablet, web }


class Responsive{
  final BuildContext context;
  late final Size _size;
  late final DeviceType deviceType;

  Responsive(this.context) {
    _size = MediaQuery.of(context).size;

    if (_size.width >= 1024) {
      deviceType = DeviceType.web;
    } else if (_size.width >= 600) {
      deviceType = DeviceType.tablet;
    } else {
      deviceType = DeviceType.mobile;
    }
  }

  double scaleText(double size) {
    switch (deviceType) {
      case DeviceType.web:
        return size * 2.0;
      case DeviceType.tablet:
        return size * 1.5;
      case DeviceType.mobile:
      return size;
    }
  }

  double scaleWidth(double width) {
    switch (deviceType) {
      case DeviceType.web:
        return width * 2.0;
      case DeviceType.tablet:
        return width * 1.5;
      case DeviceType.mobile:
      return width;
    }
  }

  double scaleHeight(double height) {
    switch (deviceType) {
      case DeviceType.web:
        return height * 2.0;
      case DeviceType.tablet:
        return height * 1.5;
      case DeviceType.mobile:
      return height;
    }
  }

}