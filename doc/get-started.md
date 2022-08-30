# Getting Started with the Flutter Plugin for Reader SDK

This guide walks you through the process of setting up a new Flutter
project with Reader SDK. See the
[Flutter Reader SDK Technical Reference](reference.md)
for more detailed information about the methods available.


## Before you start

* You will need a Square account enabled for payment processing. If you have not
  enabled payment processing on your account (or you are not sure), visit
  [squareup.com/activate].
* Follow the **Install** instructions in the [Flutter Getting Started] guide to
  setup your Flutter development environment.


## Process overview

* [Step 1: Create a Flutter project](#step-1-create-a-flutter-project)
* [Step 2: Configure the Reader SDK dependency](#step-2-configure-the-reader-sdk-dependency)
* [Step 3: Request Reader SDK credentials](#step-3-request-reader-sdk-credentials)
* [Step 4: Configure Gradle for Reader SDK (Android)](#step-4-configure-gradle-for-reader-sdk-android)
* [Step 5: Configure Xcode for Reader SDK (iOS)](#step-5-configure-Xcode-for-reader-sdk-ios)
* [Step 6: Implement Reader SDK authorization](#step-6-implement-reader-sdk-authorization)
* [Step 7: Implement the Checkout flow](#step-7-implement-the-checkout-flow)
* [Step 8: Implement Mobile Authorization](#step-8-implement-mobile-authorization)

Optional steps:

* [Save a card on file](#save-a-card-on-file)
* [Support Contactless Readers](#support-contactless-readers)
* [Support Reader SDK deauthorization](#support-reader-sdk-deauthorization)


## Step 1: Create a Flutter project

The basic command is:

```bash
flutter create reader_sdk_flutter_app
```

See the **Create the app** step of the [Test Drive] section in Flutters getting
started guide for more detailed instructions.


## Step 2: Configure the Reader SDK dependency

Edit the `pubspec.yaml` file in your `reader_sdk_flutter_app` directory to
define the Reader SDK dependency:
```yaml
dependencies:

  ...

  square_reader_sdk: ^4.0.0
```


## Step 3: Request Reader SDK credentials

1. Open the [Square Application Dashboard].
1. Create a new Square application.
1. Click on the new application to bring up the Square application settings
   pages.
1. Open the **Reader SDK** page and click "Request Credentials" to generate your
   Reader SDK repository password.
1. You will need the **Application ID** and **Repository password** from the
   **Reader SDK** settings page to configure Reader SDK in the next steps.


## Step 4: Configure Gradle for Reader SDK (Android)

To use the Flutter plugin on Android devices, you need to configure Gradle so it
can download the Reader SDK package properly and make it available to the
Flutter library as a resource. The key installation steps are outlined below.

1. Change to the Android folder (`android`) at the root of your flutter
   project.
1. Update the `gradle.properties` file in the `android` folder of your project
   to increase the max heap size provided to the Gradle daemon and set variables
   for the Square application ID and repository password:
   ```
    SQUARE_READER_SDK_APPLICATION_ID=YOUR_SQUARE_READER_APP_ID
    SQUARE_READER_SDK_REPOSITORY_PASSWORD=YOUR_SQUARE_READER_REPOSITORY_PASSWORD
    org.gradle.jvmargs=-Xmx4g
   ```
1. Reader SDK and its dependencies contain more than 65k methods, so your build
   script must enable Multidex:
    ```
    android {
      defaultConfig {
        minSdkVersion 21
        targetSdkVersion 29
        multiDexEnabled true
      }
      ...
    }
    ```
1. Configure the Multidex options:
    ```
    android {
      ...
      dexOptions {
        // Ensures incremental builds remain fast
        preDexLibraries true
        // Required to build with Reader SDK
        jumboMode true
        // Required to build with Reader SDK
        keepRuntimeAnnotatedClasses false
      }
      ...
    }
    ```
1. Open the `MainApplication` class for your project. **Note that `MainApplication`
is not created by default through `flutter create <Project>`, so you may need to
create it**. Add code to extend the Flutter Application class
(`FlutterApplication`) that imports and initializes Reader SDK:

    ```java
    package <YOUR_PACKAGE_NAME>;

    import com.squareup.sdk.reader.ReaderSdk;   
    import io.flutter.app.FlutterApplication;
    import io.flutter.view.FlutterMain;
   
   
   public class MainApplication extends FlutterApplication {
   
     @Override
     public void onCreate() {
       super.onCreate();
       ReaderSdk.initialize(this);
       FlutterMain.startInitialization(this);
     }   
    }
    ```

1. If you create `MainApplication` class in above step, update `AndroidManifest.xml` in your project:
    ```xml
      <application
        <!-- use custom "MainApplication" class instead of "io.flutter.app.FlutterApplication" -->
        android:name=".MainApplication" 
        ... />
      </application>
    ```
1. If you are using any minor version of Flutter 1.12 you may need to add this method to your `MainActivity`.
 However, if you are using Flutter version 1.16+ you will not need the additional method below.   
    ```java
     import androidx.annotation.NonNull;
     
     import io.flutter.embedding.android.FlutterActivity;
     import io.flutter.embedding.engine.FlutterEngine;
     import io.flutter.plugins.GeneratedPluginRegistrant;
     
     public class MainActivity extends FlutterActivity {
     
         @Override
         public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
             GeneratedPluginRegistrant.registerWith(flutterEngine);
         }
     }
    ``` 

## Step 5: Configure Xcode for Reader SDK (iOS)

To use the Flutter plugin on iOS devices, you need to configure Xcode so it can
download the Reader SDK package properly and make it available to the Flutter
library as a resource. The key installation steps are outlined below. For more
information on installing Reader SDK for iOS, see the
[Reader SDK iOS Setup Guide].

**TIP**: You can find the minimum supported Reader SDK version for iOS in the
[root README] for this repo.

1. Change to the iOS folder (`ios`) at the root of your Flutter project.
1. Modify your `Podfile` and uncomment the platform configuration line (`platform :ios, '<version>'`) if it is commented out.
   **NOTE**: you must target iOS `11.1` or higher (i.e.: `platform :ios, '11.1'`).
1. Download and configure the latest version of `SquareReaderSDK.xcframework` in
   your project root by replacing `YOUR_SQUARE_READER_APP_ID` and
   `YOUR_SQUARE_READER_REPOSITORY_PASSWORD` with your Reader SDK credentials.
   
   The command below will download the framework into the current directory. **The framework must be in either the `ios` directory or the `ios/Frameworks` directory of your Flutter project.**
    ```bash
    ruby <(curl https://connect.squareup.com/readersdk-installer) install \
    --app-id YOUR_SQUARE_READER_APP_ID                                    \
    --repo-password YOUR_SQUARE_READER_REPOSITORY_PASSWORD
    ```
1. Add Reader SDK to your Xcode project:
   * Open `Runner.xcworkspace` in Xcode.
   * Open the **General** tab for your app target in Xcode.
   * Drag the newly downloaded `SquareReaderSDK.xcframework` into the
     **Embedded Binaries** section and click "Finish" in the modal that appears.
1. Add a Reader SDK build phase:
   * Open `Runner.xcworkspace` in Xcode.
   * In the **Build Phases** tab for your application target, click the **+**
      button (at the top of the pane).
   * Select **New Run Script Phase**.
   * Paste the following into the editor panel of the new run script:
      ```
      FRAMEWORKS="${BUILT_PRODUCTS_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      "${FRAMEWORKS}/SquareReaderSDK.framework/setup"
      ```
1. In Xcode, open the **General** tab for your app target and make sure the
   **Deployment Target** is set to 11.0+.
1. In Xcode, open the **General** tab for your app target and make sure the
   **Landscape Left** and **Landscape Right** device orientations are supported.
1. In Xcode, open the **Build Settings** tab for your app target and add **$(PROJECT_DIR)**
   to **Framework Search Paths**.
1. If you are on Xcode 10+, set build system to `Legacy Build System`
1. Update your Info.plist with the following key:value pairs in the **Info** tab
   for your application target to explain why your application requires these
   device permissions:
   * `NSLocationWhenInUseUsageDescription` : "This app integrates with Square
     for card processing. To protect buyers and sellers, Square requires your
     location to process payments."
   * `NSMicrophoneUsageDescription` : "This app integrates with Square for card
     processing. To swipe magnetic cards via the headphone jack, Square requires
     access to the microphone."
   * `NSBluetoothPeripheralUsageDescription` : This app integrates with Square
     for card processing. Square uses Bluetooth to connect your device to
     compatible hardware.
   * `NSCameraUsageDescription` : This app integrates with Square for card
      processing. Upload your account logo, feature photo and product images
      with the photos stored on your mobile device.
   * `NSPhotoLibraryUsageDescription` : This app integrates with Square for card
      processing. Upload your account logo, feature photo and product images
      with the photos stored on your mobile device.
1. Update the `application:didFinishLaunchingWithOptions:` method in your app
   delegate to initialize Reader SDK:
    ```objective-c
    #include "AppDelegate.h"
    #include "GeneratedPluginRegistrant.h"
    @import SquareReaderSDK;

    @implementation AppDelegate

    (BOOL)application:(UIApplication * )application didFinishLaunchingWithOptions:(NSDictionary * )launchOptions
    {

    ...

    [SQRDReaderSDK initializeWithApplicationLaunchOptions:launchOptions];
    return YES;
    }

    @end
    ```


## Step 6: Implement Reader SDK authorization

Add code to your Flutter project that authorizes Reader SDK:

```dart
import 'package:square_reader_sdk/models.dart';
import 'package:square_reader_sdk/reader_sdk.dart';

const _debug = !bool.fromEnvironment("dart.vm.product");
try {
  // authCode is a mobile authorization code from the Mobile Authorization API
  var location = await ReaderSdk.authorize(authCode);
  // Authorized and authorizedLocation is available
} on ReaderSdkException catch (e) {
  switch(e.code) {
    case ReaderSdk.authorizeErrorNoNetwork:
      // Remind connecting to network
    break;
    case ReaderSdk.usageError:
      var errorMessage = e.message;
      if (_debug) {
        errorMessage += '\n\nDebug Message: ${e.debugMessage}';
        print('${e.code}:${e.debugCode}:${e.debugMessage}');
      }
      displayErrorModal(context, errorMessage);
    break;
  }
}
```

---

> For iOS, you will also need to add code to your Flutter project to request
> location and microphone permissions.

---

## Step 7: Implement the Checkout flow

Add code to your Flutter project that starts the checkout flow and handles
the response. Reader SDK must be authorized before starting the checkout flow
and connecting a Reader is only required for card payments.

**Note**: You cannot start the checkout flow from a modal screen. To start
checkout, you must close the modal before calling `startCheckout`.

```dart
import 'package:square_reader_sdk/models.dart';
import 'package:square_reader_sdk/reader_sdk.dart';

const _debug = !bool.fromEnvironment("dart.vm.product");

// A checkout parameter is required for this checkout method
var builder = CheckoutParametersBuilder();
builder.amountMoney = MoneyBuilder()
  ..amount = 100
  ..currencyCode = 'USD'; // currencyCode is optional
// Optional for all following configuration
builder.skipReceipt = false;
builder.collectSignature = true;
builder.allowSplitTender = false;
builder.delayCapture = false;
builder.note = 'Hello 💳 💰 World!';
builder.additionalPaymentTypes =
    ListBuilder(['cash', 'manual_card_entry', 'other']);
builder.tipSettings = TipSettingsBuilder()
  ..showCustomTipField = true
  ..showSeparateTipScreen = false
  ..tipPercentages = ListBuilder([15, 20, 30]);

CheckoutParameters checkoutParameters = builder.build();

try {
  var checkoutResult = await ReaderSdk.startCheckout(checkoutParameters);
  // checkout finished successfully and checkoutResult is available
} on ReaderSdkException catch (e) {
  switch (e.code) {
    case ReaderSdk.checkoutErrorCanceled:
      // Handle canceled transaction here
      break;
    case ReaderSdk.checkoutErrorSdkNotAuthorized:
      // Handle sdk not authorized
      break;
    default:
      var errorMessage = e.message;
      if (_debug) {
        errorMessage += '\n\nDebug Message: ${e.debugMessage}';
        print('${e.code}:${e.debugCode}:${e.debugMessage}');
      }
      displayErrorModal(context, errorMessage);
  }
}
```

## Step 8: Implement Mobile Authorization

In the context of Reader SDK, authorization refers to using the SDK with a
mobile authorization code from the [Mobile Authorization API]. Mobile
authorization tokens allow custom mobile apps to process payments on Square
hardware on behalf of a specific Square account for a given location.

For early development, you can also generate a mobile authorization token from
the **Reader SDK** settings page in the [Square Application Dashboard]. See the
[Mobile Authorization API] documentation for help setting up a service to
generate mobile authorization tokens for production use.


## Optional steps

### Save a card on file

You can save cards on file with the Reader SDK Flutter plugin to create a
seamless purchase experience for returning customers and enable recurring
payments with Square APIs. It is important to note that while Reader SDK can
save card information, you must work with the Connect Payments API to
[charge a card on file].

The Reader SDK card on file workflow creates a customer card for an **existing**
[Customer profile]. **ALWAYS** ask customers for permission before saving their
card information. For example, include a checkbox in your purchase flow that the
customer can check to specify that they wish to save their card information for
future purchases. Linking cards on file without obtaining customer permission
may result in your application being disabled without notice.

The card on file workflow begins with an asynchronous call to Square servers,
which could be slow depending on network conditions. We recommend displaying a
spinner or loading indicator before starting the card on file workflow and
clearing it when you receive the result (success or failure) so users know that
work is being done in the background.

```dart
import 'package:square_reader_sdk/models.dart';
import 'package:square_reader_sdk/reader_sdk.dart';
...
// Get customer Id from Connect Customers API
const customerId = 'DRYKVK5Y6H5R4JH9ZPQB3XPZQC';
try {
  await ReaderSdk.startStoreCard(customerId);
  // Customer's card is stored successfully and card infomation is available
} on ReaderSdkException catch (e) {
  switch(e.code) {
    case ErrorCode.storeCustomerErrorCanceled:
      // Handle canceled
      break;
    case ErrorCode.storeCustomerErrorInvalidCustomerId:
      // Handle invalid customer id error
      break;
    case ErrorCode.storeCustomerErrorSdkNotAuthorized:
      // Handle no network error
      break;
    case ErrorCode.storeCustomerErrorNoNetwork:
      // Handle sdk not authorized
      break;
    default:
      var errorMessage = e.message;
      if (_debug) {
        errorMessage += '\n\nDebug Message: ${e.debugMessage}';
        print('${e.code}:${e.debugCode}:${e.debugMessage}');
      }
      displayErrorModal(context, errorMessage);
  }
}
```


### Support Contactless Readers

You do not need to write explicit code to take payment with a Magstripe Reader.

To take payments with a Contactless + Chip Reader, you must add code to your
Flutter project that starts the Reader SDK settings flow to pair the Reader.

```dart
import 'package:square_reader_sdk/models.dart';
import 'package:square_reader_sdk/reader_sdk.dart';

const _debug = !bool.fromEnvironment("dart.vm.product");
try {
  await ReaderSdk.startReaderSettings();
} on ReaderSdkException catch (e) {
  switch(e.code) {
    case ReaderSdk.readerSettingsErrorSdkNotAuthorized:
      // Handle sdk not authorized
      break;
    default:
      var errorMessage = e.message;
      if (_debug) {
        errorMessage += '\n\nDebug Message: ${e.debugMessage}';
        print('${e.code}:${e.debugCode}:${e.debugMessage}');
      }
      displayErrorModal(context, errorMessage);
  }
}
```

### Support Reader SDK deauthorization

To switch Square locations or to deauthorize the current location, you must add
code to your Flutter project that deauthorizes Reader SDK.

```dart
import 'package:square_reader_sdk/reader_sdk.dart';

const _debug = !bool.fromEnvironment("dart.vm.product");
if (await canDeauthorize) {
  try {
    await ReaderSdk.deauthorize();
    // Deauthorize finished successfully
  } catch(ex) {
    var errorMessage = e.message;
    if (_debug) {
      errorMessage += '\n\nDebug Message: ${e.debugMessage}';
      print('${e.code}:${e.debugCode}:${e.debugMessage}');
    }
    displayErrorModal(context, errorMessage);
  }
} else {
  print('Unable to deauthorize.');
}
```



[//]: # "Link anchor definitions"
[Mobile Authorization API]: https://developer.squareup.com/docs/mobile-authz/build-with-mobile-authz
[Reader SDK]: https://developer.squareup.com/docs/reader-sdk/what-it-does
[Square Dashboard]: https://squareup.com/dashboard/
[update policy for Reader SDK]: https://developer.squareup.com/docs/reader-sdk/what-it-does#reader-sdk-update-policy
[Testing Mobile Apps]: https://developer.squareup.com/docs/testing/mobile
[squareup.com/activate]: https://squareup.com/activate
[Square Application Dashboard]: https://connect.squareup.com/apps/
[Reader SDK Android Setup Guide]: https://developer.squareup.com/docs/reader-sdk/build-on-android
[Reader SDK iOS Setup Guide]: https://developer.squareup.com/docs/reader-sdk/build-on-ios
[root README]: ../README.md
[Flutter Getting Started]: https://flutter.io/docs/get-started/install
[Test Drive]: https://flutter.io/docs/get-started/test-drive
[Customer profile]: https://developer.squareup.com/docs/customers-api/build-with-customers
[charge a card on file]: https://developer.squareup.com/docs/payments-api/take-payments#take-a-payment-using-a-card-on-file
