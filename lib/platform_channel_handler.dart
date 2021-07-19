import 'package:flutter/services.dart';

class PlatformChannelHandler{
  static PlatformChannelHandler _instance = PlatformChannelHandler._init();

  static PlatformChannelHandler get instance => _instance;

  PlatformChannelHandler._init();

  static const platform = const MethodChannel('sampleChannel');

  Future<bool> isInputTextPalindrome(String text) async {
    bool isPalindrome;
    try {
      isPalindrome = await platform.invokeMethod('isInputPalindrome',{"text": text});

    } on PlatformException catch (e) {
      isPalindrome = null;
    }
    return isPalindrome;
  }

}