import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_channels_example/platform_channel_handler.dart';

class ExampleView extends StatefulWidget {
  @override
  _ExampleViewState createState() => _ExampleViewState();
}

class _ExampleViewState extends State<ExampleView> {
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Palindrome Checker')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 150,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter a text'),
                controller: textController,
              ),
            ),
          ),
          ElevatedButton(
            child: Text('Check Palindrome'),
            onPressed: () async {
              bool result = await PlatformChannelHandler.instance
                  .isInputTextPalindrome(textController.text);
              if (result) {
                final snackBar = SnackBar(
                  content: Text('This text is plandrome'),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 1),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              } else {
                final snackBar = SnackBar(
                    content: Text('This text is not plandrome'),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 1));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
              textController.clear();
            },
          ),
        ],
      ),
    );
  }
}
