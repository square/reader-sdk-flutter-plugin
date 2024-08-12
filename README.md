# Flutter plugin for Reader SDK

[![build](https://github.com/square/reader-sdk-flutter-plugin/actions/workflows/build.yml/badge.svg)](https://github.com/square/reader-sdk-flutter-plugin/actions/workflows/build.yml)
[![Pub](https://img.shields.io/pub/v/square_reader_sdk)](https://pub.dev/packages/square_reader_sdk)

Square [Reader SDK] lets developers embed the [Square] checkout flow and accept
in-person payments in custom apps using Square Readers. The SDK supports
authorization, transaction processing, and Reader management.

Use Square's official Flutter plugin for Reader SDK to build in-person payment
solutions on Android and iOS.

## Migration from 3.x to 4.x

Remove initialize method from `onCreate` method in your application class in Android portion

```diff
package <YOUR_PACKAGE_NAME>;

- import com.squareup.sdk.reader.ReaderSdk;   
import io.flutter.app.FlutterApplication;

public class MainApplication extends FlutterApplication {

 @Override
 public void onCreate() {
   super.onCreate();
-   ReaderSdk.initialize(this);
 }   
}
```

### If you targeting SDK 31 and above
Go to your app and add code to request `BLUETOOTH_SCAN` and `BLUETOOTH_CONNECT` permissions before
you invoke any of Reader plugin method.

## How to use

The Flutter plugin for Reader SDK acts as a wrapper on the native SDKs and is
currently compatible with the following native Reader SDK versions:

  * iOS: 1.7.2 and above
  * Android: 1.7.5 and above

Try the [sample app] to see the plugin in action or follow the instructions in
the [getting started guide] to build a custom solution from scratch.


### Additional documentation

In addition to this README, the following is available in the
[flutter plugin GitHub repo]:

* [Getting Started]
* [Technical Reference]
* [Troubleshooting]
* [`doc`] - Root directory for all documentation
* [`example`] - Root directory of the Flutter sample app (with walkthrough).


## Build requirements

### Flutter

* Flutter version 2.0 or higher
* Dart version 2.12 or higher
   
### Android

* minSdkVersion is API 24 or higher.
* Android SDK platform: API 31.
* Android SDK build tools: 28.0.2
* Android Gradle Plugin: 3.0.0 or greater.
* Support library: 26.0.2
* Google Play Services: 16.0.1
* Google APIs Intel x86 Atom_64 System Image

### iOS

* Xcode version: 10.2 or greater.
* iOS Base SDK: 11.1 or greater.
* Deployment target: iOS 11.0 or greater.


## Reader SDK requirements and limitations

* Reader SDK is only available for accounts based in the United States.
  Authorization requests for accounts based outside the United States return an
  error.
* Reader SDK may not be used for unattended terminals. Using Reader SDK to
  implement payment solutions in unattended terminals or kiosks (for example,
  vending machines) is strictly prohibited.
* Reader SDK requires an authorization token from the [Mobile Authorization API]
  to connect Square Readers and accept payments.
* Reader SDK only supports on-screen tipping. Digital receipts and tips can be
  configured in Reader SDK. Tipping on printed receipts is not supported at this
  time.
* Reader SDK cannot issue refunds. Refunds can be issued programmatically using
  the Refunds API or manually in the [Square Dashboard].
* Reader SDK is not supported in the Square sandbox. See [Testing Mobile Apps]
  for testing recommendations.
* Your version of Reader SDK must adhere to the Square SDK update policy. To
  limit risk to developers and their users, Square enforces an
  [update policy for Reader SDK] that requires developers to keep their version
  of Reader SDK current.


## License

```
Copyright 2022 Square Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```


[//]: # "Link anchor definitions"
[Mobile Authorization API]: https://developer.squareup.com/docs/mobile-authz/build-with-mobile-authz
[Reader SDK]: https://developer.squareup.com/docs/reader-sdk/what-it-does
[Square Dashboard]: https://squareup.com/dashboard/
[Square]: https://squareup.com
[update policy for Reader SDK]: https://developer.squareup.com/docs/reader-sdk/what-it-does#reader-sdk-update-policy
[Testing Mobile Apps]: https://developer.squareup.com/docs/testing/mobile
[`doc`]: https://github.com/square/reader-sdk-flutter-plugin/tree/master/doc
[`example`]: https://github.com/square/reader-sdk-flutter-plugin/tree/master/example
[Getting Started]: https://github.com/square/reader-sdk-flutter-plugin/tree/master/doc/get-started.md
[Technical Reference]: https://github.com/square/reader-sdk-flutter-plugin/tree/master/doc/reference.md
[Troubleshooting]: https://github.com/square/reader-sdk-flutter-plugin/tree/master/doc/troubleshooting.md
[sample app]: https://github.com/square/reader-sdk-flutter-plugin/tree/master/example/README.md
[getting started guide]: https://github.com/square/reader-sdk-flutter-plugin/tree/master/doc/get-started.md
[flutter plugin GitHub repo]: https://github.com/square/reader-sdk-flutter-plugin/tree/master
