## Changelog

### v4.0.1 Aug 29st, 2024

* Upgrade to Reader SDK 1.7.7 on Android.
* Support CompileSDK and targetSDK 34 on Android
* Fixed the [issue](https://github.com/square/reader-sdk-flutter-plugin/pull/116) with resuming the app after process is killed on Android.

### v4.0.0 Sep 1st, 2022

* Update package dependencies to latest versions for Null Safety support.
* Update example UI 
* Support Flutter 3
* Upgrade to Reader SDK 1.6.0 on iOS and 1.6.1 on Android.
* Support CompileSDK and targetSDK 30+ on Android

### v3.0.0 July 23rd, 2021

* Update package dependencies to latest versions for Null Safety support.
* Plugin and Example code migration to null safety.
* Dart version : 2.12

### v2.3.0 April 20, 2021

* Adding support for Reader SDK 1.4.4+ on both Android and iOS.
* On iOS, in Reader SDK 1.4.7+, the plugin now correctly handles the `SquareReaderSDK.xcframework` being downloaded

### v2.2.0 June 24, 2020

* Added support for v2 flutter embeddings (flutter 1.12+).

### v2.1.0 Oct 22, 2019

* Update Square Reader SDK minimum supported version to 1.3.3 in order to support iOS 13
* Now requires Xcode 10.2+

### v2.0.3 Sep 16, 2019
* add support for isAuthorizationInProgress

### v2.0.2 Aug 25, 2019

* Update Square Reader SDK minimum supported version to 1.3.1
* Add delay capture support

### v2.0.1 Mar 29, 2019

* Fix the bug on Android default Reader SDK version setting

### v2.0.0 Mar 29, 2019

* Support AndroidX.
* Upgrade to Square Reader SDK 1.2.1 (Android Only)

### v1.1.1 Mar 13, 2019

* add **store customer card** suport.

### v1.1.0 Mar 5, 2019

* remove `alwaysRequireSignature` and add `collectSignature` to checkout configuration.
* bump the minimum dependency to Reader SDK 1.1.1(iOS)/1.1.3(Android).
* this change **does NOT** include all new features introduced in Reader SDK 1.1.* such as **Store customer card**, see reader SDK [Change Log](https://docs.connect.squareup.com/changelog/mobile-logs/2019-02-13) for details.

### v1.0.3 Dec 5, 2018

* Documentation update.

### v1.0.2 Dec 4, 2018

* Initial release.
