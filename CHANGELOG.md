## Changelog

### v2.4.0 July 23rd, 2021

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
