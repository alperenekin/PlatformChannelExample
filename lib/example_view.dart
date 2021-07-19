import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_channels_example/platform_channel_handler.dart';

class ExampleView extends StatefulWidget {
  @override
  _ExampleViewState createState() => _ExampleViewState();
}

class _ExampleViewState extends State<ExampleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('blabla')),
      body: ElevatedButton(
        child: Text('press'),
        onPressed: () async {
          bool result = await PlatformChannelHandler.instance.isInputTextPalindrome('abbbba');
          print(result);
        },
      ),
    );
  }
}
