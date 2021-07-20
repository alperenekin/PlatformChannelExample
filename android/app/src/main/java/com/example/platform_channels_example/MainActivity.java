package com.example.platform_channels_example;

import android.os.Bundle;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.plugins.util.GeneratedPluginRegister;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "sampleChannel";
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(new FlutterEngine(this));
        MethodChannel channel = new MethodChannel(getFlutterEngine().getDartExecutor().getBinaryMessenger(), CHANNEL);

        channel.setMethodCallHandler(new MethodChannel.MethodCallHandler() {
            @Override
            public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
                if(methodCall.method.equals("isInputPalindrome")){
                    boolean isBreak = false;
                    String input = methodCall.argument("text");
                    if(input != null){
                        int i = 0, j = input.length() - 1;
                        while (i < j) {
                            if (input.charAt(i) != input.charAt(j)) {
                                result.success(false);
                                isBreak = true;
                                break;
                            }
                            i++;
                            j--;
                        }
                        if(!isBreak)
                            result.success(true);
                    }else{
                        result.error("UNAVAILABLE", "Paremeter is unavailable.", null);
                    }
                }else{
                    result.notImplemented();
                }
            }
        });
    }

}
