# Flutter Plugin for Reader SDK Quick Start

<img src="https://docs.connect.squareup.com/images/github/reader-sdk-sampleapp-example.png">

## Assumptions and prerequisites

This quick start guide makes the following assumptions:

* You have read the [Reader SDK Overview]. This quick start focuses on getting
  the sample app installed and running to demonstrate how the Flutter
  plugin works.
* You have a Square account enabled for payment processing. If you have not
  enabled payment processing on your account (or you are not sure), visit
  [squareup.com/activate].
* You are familiar with basic Flutter development.

## Before you start

* Follow the **Install** instructions in the [Flutter Getting Started] guide to
  setup your Flutter development environment.
* Confirm your environment meets the Reader SDK build requirements listed in the
  [root README] for this repo.
* Clone this repo (if you have not already):
  `git clone https://github.com/square/reader-sdk-flutter-plugin.git`

## Step 1: Request Reader SDK credentials

1. Open the [Square Application Dashboard].
2. Create a new Square application.
3. Click on the new application to bring up the Square application settings
   pages.
4. Open the **Reader SDK** page and click "Request Credentials" to generate your
   Reader SDK repository password.
5. You will need the **Application ID** and **Repository password** from the
   **Reader SDK** settings page to configure Reader SDK in the next steps.


## Step 2: Run the Flutter example app for Android

1. Open `<YOUR_PROJECT_DIRECTORY>/example/android/gradle.properties`.
2. Set the Reader SDK variables with your Reader SDK credentials:
    ```yaml
    # Set the variables below with your Reader SDK credentials
    SQUARE_READER_SDK_APPLICATION_ID=YOUR_SQUARE_READER_APP_ID
    SQUARE_READER_SDK_REPOSITORY_PASSWORD=YOUR_SQUARE_READER_REPOSITORY_PASSWORD
    ```
3. Confirm you have installed the required Android SDK elements. If you are
   unsure, the Reader SDK build requirements are listed in the [root README] for
   this repo.
4. Configure an Android emulator that runs Android API 27 (Oreo, 8.1),
   and launch the emulator **or** connect your dev machine to an Android device
   running Android API 27 with development mode enabled.
5. Run the sample app from the `example` folder:
    ```bash
    cd <YOUR_PROJECT_DIRECTORY>/example
    flutter run
    ```
6. Go to the **Reader SDK** settings page in your [Square Application Dashboard]
   and generate a new mobile authorization code by clicking
   "Generate Mobile Auth Code".
7. Copy the mobile authorization code string from the Square application
   settings page.
8. Tap "Enter Code Manually" in the sample app and paste the mobile
   authorization code into the field provided.

You can view the [transaction details in Square Dashboard].


## Step 3: Run the Flutter example app for iOS

1. Change to the `ios` folder under `example`.
2. Install ReaderSDK, replacing `YOUR_SQUARE_READER_APP_ID` and
   `YOUR_SQUARE_READER_REPOSITORY_PASSWORD` with your Reader SDK credentials.

    The command below will download the framework into the current directory. **The framework must be in either the `ios` directory or the `ios/Frameworks` directory of your Flutter project.**
    ```bash
    ruby <(curl https://connect.squareup.com/readersdk-installer) install \
    --app-id YOUR_SQUARE_READER_APP_ID                                    \
    --repo-password YOUR_SQUARE_READER_REPOSITORY_PASSWORD
    ```
3. Launch the iOS emulator or connect to an iOS device with development mode
   enabled.
4. Run the sample app from the `example` folder:
    ```bash
    cd <YOUR_PROJECT_DIRECTORY>/example
    flutter run
    ```
5. Go to the **Reader SDK** settings page in your [Square Application Dashboard]
   and generate a new mobile authorization code by clicking
   "Generate Mobile Auth Code".
6. Copy the mobile authorization code string from the Square application
   settings page.
7. Tap "Enter Code Manually" in the sample app and paste the mobile
   authorization code into the field provided.

You can view the [transaction details in Square Dashboard].



[//]: # "Link anchor definitions"
[Reader SDK Overview]: https://developer.squareup.com/docs/reader-sdk/what-it-does
[squareup.com/activate]: https://squareup.com/activate
[Square Application Dashboard]: https://connect.squareup.com/apps/
[Flutter Getting Started]: https://flutter.io/docs/get-started/install
[root README]: ../README.md
[transaction details in Square Dashboard]: https://squareup.com/dashboard/sales/transactions

## Feedback
Leave a feedback for this sample app [here](https://delighted.com/t/DT6msOcY)!