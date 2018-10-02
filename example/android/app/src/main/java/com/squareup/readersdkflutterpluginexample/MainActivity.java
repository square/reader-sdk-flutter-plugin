package com.squareup.readersdkflutterpluginexample;

import android.os.Bundle;
import com.squareup.sdk.reader.ReaderSdk;
import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
    ReaderSdk.initialize(this.getApplication());
  }
}
