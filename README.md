# square_reader_sdk_flutter_plugin

A flutter plugin for Square Reader SDK.

## Getting Started

For help getting started with Flutter, view our online
[documentation](https://flutter.io/).

For help on editing plugin code, view the [documentation](https://flutter.io/developing-packages/#edit-plugin-package).

## Setup Reader SDK flutter plugin example

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