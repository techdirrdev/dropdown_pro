import 'dart:async';

import 'package:flutter/services.dart';

class DropdownPro {
  static const MethodChannel _channel = MethodChannel('dropdown_pro');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
