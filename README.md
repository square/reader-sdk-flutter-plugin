# square_reader_sdk_flutter_plugin

A flutter plugin for Square Reader SDK.

## Before you start
* You will need a Square account enabled for payment processing. If you have not
  enabled payment processing on your account (or you are not sure), visit
  [squareup.com/activate].

* For help getting started with Flutter, view our online
[documentation](https://flutter.io/).

* For help on editing plugin code, view the [documentation](https://flutter.io/developing-packages/#edit-plugin-package).

## Getting Started Reader SDK flutter plugin 

### Step 1: Create a Flutter project

The basic command is:

```bash
flutter create square_reader_sdk_example
```

### Step 2: Install Reader SDK plugin

Put the *square_reader_sdk_flutter_plugin* project folder in `flutter` folder. Edit the `pubspec.yaml` in *square_reader_sdk_example* to include :
```yaml
dependencies:
    ...
    square_reader_sdk_flutter_plugin:
        path: ../square_reader_sdk_flutter_plugin
```

### Step 3: Request Reader SDK credentials

1. Open the [Square Application Dashboard].
1. Create a new Square application.
1. Click on the new application to bring up the Square application settings
   pages.
1. Open the **Reader SDK** page and click "Request Credentials" to generate your
   Reader SDK repository password.
1. You will need the **Application ID** and **Repository password** from the
   **Reader SDK** settings page to configure Reader SDK in the next steps.


### Step 4: Install Reader SDK for Android

To use the Flutter plugin on Android devices, you need to install Reader
SDK for Android so it is available to the plugin as a dependency.
The key installation steps are outlined below. For more information on
installing Reader SDK for Android, see the [Reader SDK Android Setup Guide] at
[docs.connect.squareup.com].

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
   script must enable Multidex. If your `minSdkVersion` is less than **21**, you
   also need to include the `multidex` dependency:
    ```
    android {
      defaultConfig {
        minSdkVersion 19
        targetSdkVersion 27
        multiDexEnabled true
      }
    }

    dependencies {
      // Add this dependency if your minSdkVersion < 21
      implementation 'com.android.support:multidex:1.0.3'
      // ...
    }
    ```
1. Configure the Multidex options:
    ```
    android {
      // ...
      dexOptions {
        // Ensures incremental builds remain fast
        preDexLibraries true
        // Required to build with Reader SDK
        jumboMode true
        // Required to build with Reader SDK
        keepRuntimeAnnotatedClasses false
      }
      // ...
    }
    ```
1. Extend the Android Application class (`android.app.Application`) and add code
   to Import and initialize Reader SDK:
    ```
    import com.squareup.sdk.reader.ReaderSdk;

    public class MainActivity extends FlutterActivity {
        @Override
        protected void onCreate(Bundle savedInstanceState) {
            super.onCreate(savedInstanceState);
            GeneratedPluginRegistrant.registerWith(this);
            ReaderSdk.initialize(this.getApplication());
            // Required if minSdkVersion < 21
            MultiDex.install(this.getApplicationContext());
        }
    }
    ```


### Step 5: Install Reader SDK for iOS

To use the Flutter plugin on iOS devices, you need to install Reader
SDK for iOS so it is available to the flutter plugin as a resource.
The key installation steps are outlined below. For more information on
installing Reader SDK for iOS, see the [Reader SDK iOS Setup Guide] at
[docs.connect.squareup.com].

1. Change to the iOS folder (`ios`) at the root of your Flutter project.
1. Download and configure the latest version of `SquareReaderSDK.framework` in
   your project root by replacing `YOUR_SQUARE_READER_APP_ID` and
   `YOUR_SQUARE_READER_REPOSITORY_PASSWORD` with your Reader SDK credentials and
   `READER_SDK_VERSION` with the Reader SDK version you are using in the code
   below. **The framework will install in the current directory**. (The
   current `READER_SDK_VERSION` is `1.0.1`.)
    ```bash
    ruby <(curl https://connect.squareup.com/readersdk-installer) install \
    --version READER_SDK_VERSION                                          \
    --app-id YOUR_SQUARE_READER_APP_ID                                    \
    --repo-password YOUR_SQUARE_READER_REPOSITORY_PASSWORD
    ```
1. Add Reader SDK to your Xcode project:
   * Open the **General** tab for your app target in Xcode.
   * Drag the newly downloaded `SquareReaderSDK.framework` into the
     **Embedded Binaries** section and click "Finish" in the modal that appears.
1. Add a Reader SDK build phase:
   1. Open the Xcode workspace or project for your application.
   1. In the **Build Phases** tab for your application target, click the **+**
      button (at the top of the pane).
   1. Select **New Run Script Phase**.
   1. Paste the following into the editor panel of the new run script:
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
    ```
    #import "AppDelegate.h"

    #import <React/RCTBundleURLProvider.h>
    #import <React/RCTRootView.h>

    @import SquareReaderSDK;

    @implementation AppDelegate

    (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
    {

    // ...

    [SQRDReaderSDK initializeWithApplicationLaunchOptions:launchOptions];
    return YES;
    }

    @end
    ```

You will also need to add code to your Flutter project to request device location and
microphone permissions. 

### Step 6: Using SDK from your app

Please check the **example** app come with the in the plugin project folder.


## Quick start example setup 

### Step 1: Request Reader SDK credentials

1. Open the [Square Application Dashboard].
2. Create a new Square application.
3. Click on the new application to bring up the Square application settings
   pages.
4. Open the **Reader SDK** page and click "Request Credentials" to generate your
   Reader SDK repository password.
5. You will need the **Application ID** and **Repository password** from the
   **Reader SDK** settings page to configure Reader SDK in the next steps.

### Step 2: Run the sample app for iOS

**NOTE**: XCode 10+ uses a different build system that may cause compile errors.

1. Change to the `ios` folder under `example`.

2. Install ReaderSDK, replacing `YOUR_SQUARE_READER_APP_ID` and
   `YOUR_SQUARE_READER_REPOSITORY_PASSWORD` with your Reader SDK credentials
   and `READER_SDK_VERSION` with the Reader SDK version you are using. (The
   current `READER_SDK_VERSION` is `1.0.1`.)
    ```bash
    ruby <(curl https://connect.squareup.com/readersdk-installer) install \
    --version READER_SDK_VERSION                                          \
    --app-id YOUR_SQUARE_READER_APP_ID                                    \
    --repo-password YOUR_SQUARE_READER_REPOSITORY_PASSWORD
    ```

3. Launch iOS emulator, run the example project from the `example` project folder: 
    ```bash
    cd /PATH/TO/LOCAL/example
    flutter run
    ```

### Step 3: Run the sample app for Android

1. Open `<ProjectDir>/example/android/gradle.properties`.

2. Set the Reader SDK variables with your Reader SDK credentials:
    ```yaml
    # Set the variables below with your Reader SDK credentials
    SQUARE_READER_SDK_APPLICATION_ID=YOUR_SQUARE_READER_APP_ID
    SQUARE_READER_SDK_REPOSITORY_PASSWORD=YOUR_SQUARE_READER_REPOSITORY_PASSWORD
    ```

3. Confirm you have setup Android environment with following requirement:
    * Android SDK platform: API 26 (Oreo, 8.0)
    * Android SDK build tools: 26.0.3
    * Android Gradle Plugin: 3.0.0 or greater
    * Google APIs Intel x86 Atom_64 System Image

4. Launch Android emulator, run the React Native project from the `example` project folder:
    ```bash
    cd /PATH/TO/LOCAL/example
    flutter run
    ```

### Step 4: Authorizae Sample App

1. Enable permissions by clicking the permission enable buttons.

2. Go to the **Reader SDK** settings page in your [Square Application Dashboard]
   and generate a new mobile authorization code by clicking
   "Generate Mobile Auth Code".

3. Copy the mobile authorization code string from the Square application
   settings page, then paste the authorization code to the app, click *Authorize*.

## License

```
Copyright 2018 Square Inc.

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
[docs.connect.squareup.com]: https://docs.connect.squareup.com
[Mobile Authorization API]: https://docs.connect.squareup.com/payments/readersdk/mobile-authz-guide
[Reader SDK]: https://docs.connect.squareup.com/payments/readersdk/overview
[Square Dashboard]: https://squareup.com/dashboard/
[squareup.com/activate]: https://squareup.com/activate
[Square Application Dashboard]: https://connect.squareup.com/apps/
[Reader SDK Android Setup Guide]: https://docs.connect.squareup.com/payments/readersdk/setup-android
[Reader SDK iOS Setup Guide]: https://docs.connect.squareup.com/payments/readersdk/setup-ios