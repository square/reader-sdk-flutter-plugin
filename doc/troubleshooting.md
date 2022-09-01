# Troubleshooting the Reader SDK Flutter Plugin

Likely causes and solutions for common problems.

## I upgraded to Flutter 2.5.0 and I get a linker error on Mac

### The problem

You're using Flutter 2.5.0 on a Mac.  When you run `flutter run`, you hit this error:

```
error: linker command failed with exit code 1 (use -v to see invocation) ld: building for iOS Simulator, but linking in dylib built for iOS
```
Deploying to a physical device is fine though.


### Likely cause

Flutter 2.5.0 introduced M1 support.  The In-App-Payments SDK does not have M1 support and does not allow creating builds that target arm64 simulators, resulting in the error above.

### Solution

Ensure that you using iOS SDK version 1.6.0 and above


## I get Xcode compile errors when building Reader SDK

### The problem

You are building your Flutter project with Xcode instead of the Flutter
command line interface (CLI) and using Xcode 10. Xcode 10 builds projects
differently than earlier versions.

### Likely cause

You recently downloaded or updated Xcode.

### Solution

There are 2 ways to address the issue:

1. Build with the Flutter CLI instead of Xcode.

**OR**

2. Configure Xcode to use the legacy build system:
    1. Open `File > Project Settings... > Per-User Project Settings`
    2. Choose `Legacy Build System`
    3. Run `flutter clean` from the command line.

## My app doesn't start with an apk release build. I get: ClassNotFoundException: Didn't find class "com.squareup.AppBootstrapFactory" on path: DexPathList  

### The Problem 
If you get something similar to the exception below, it is because the ReaderSDK does not work with Proguard (or R8):
https://developer.squareup.com/docs/reader-sdk/build-on-android: `You are not using Proguard for code optimization. Compressing the Reader SDK binary removes critical bytecode elements and results in runtime errors.`
However, Flutter by default will use Proguard if R8 is disabled. 

##### Related Github issue: https://github.com/square/reader-sdk-flutter-plugin/issues/42
```
java.lang.RuntimeException: Unable to create application com.example.flutter.squareup.sdk.reader.MainApplication: java.lang.RuntimeException: java.lang.ClassNotFoundException: Didn't find class "com.squareup.AppBootstrapFactory" on path: DexPathList[[zip file "/data/app/~~qFmOamREV5Uk2X3EQdMiFw==/com.example.flutter.squareup.sdk.reader-58rXotmONPwGViLs1u2JlA==/base.apk"],nativeLibraryDirectories=[/data/app/~~qFmOamREV5Uk2X3EQdMiFw==/com.example.flutter.squareup.sdk.reader-58rXotmONPwGViLs1u2JlA==/lib/arm, /data/app/~~qFmOamREV5Uk2X3EQdMiFw==/com.example.flutter.squareup.sdk.reader-58rXotmONPwGViLs1u2JlA==/base.apk!/lib/armeabi-v7a, /system/lib, /product/lib]]
        at android.app.ActivityThread.handleBindApplication(ActivityThread.java:6612)
        at android.app.ActivityThread.access$1300(ActivityThread.java:233)
        at android.app.ActivityThread$H.handleMessage(ActivityThread.java:1896)
        at android.os.Handler.dispatchMessage(Handler.java:106)
        at android.os.Looper.loop(Looper.java:223)
        at android.app.ActivityThread.main(ActivityThread.java:7523)
        at java.lang.reflect.Method.invoke(Native Method)
        at com.android.internal.os.RuntimeInit$MethodAndArgsCaller.run(RuntimeInit.java:592)
        at com.android.internal.os.ZygoteInit.main(ZygoteInit.java:941)
     Caused by: java.lang.RuntimeException: java.lang.ClassNotFoundException: Didn't find class "com.squareup.AppBootstrapFactory" on path: DexPathList[[zip file "/data/app/~~qFmOamREV5Uk2X3EQdMiFw==/com.example.flutter.squareup.sdk.reader-58rXotmONPwGViLs1u2JlA==/base.apk"],nativeLibraryDirectories=[/data/app/~~qFmOamREV5Uk2X3EQdMiFw==/com.example.flutter.squareup.sdk.reader-58rXotmONPwGViLs1u2JlA==/lib/arm, /data/app/~~qFmOamREV5Uk2X3EQdMiFw==/com.example.flutter.squareup.sdk.reader-58rXotmONPwGViLs1u2JlA==/base.apk!/lib/armeabi-v7a, /system/lib, /product/lib]]
        at c.e.P.a.h.b.b(:4)
        at c.e.P.a.h.b.a(:3)
        at c.e.P.a.a.a(:2)
        at com.example.flutter.squareup.sdk.reader.MainApplication.onCreate(:2)
        at android.app.Instrumentation.callApplicationOnCreate(Instrumentation.java:1192)
        at android.app.ActivityThread.handleBindApplication(ActivityThread.java:6607)
        at android.app.ActivityThread.access$1300(ActivityThread.java:233) 
        at android.app.ActivityThread$H.handleMessage(ActivityThread.java:1896) 
        at android.os.Handler.dispatchMessage(Handler.java:106) 
        at android.os.Looper.loop(Looper.java:223) 
        at android.app.ActivityThread.main(ActivityThread.java:7523) 
        at java.lang.reflect.Method.invoke(Native Method) 
        at com.android.internal.os.RuntimeInit$MethodAndArgsCaller.run(RuntimeInit.java:592) 
        at com.android.internal.os.ZygoteInit.main(ZygoteInit.java:941) 
     Caused by: java.lang.ClassNotFoundException: Didn't find class "com.squareup.AppBootstrapFactory" on path: DexPathList[[zip file "/data/app/~~qFmOamREV5Uk2X3EQdMiFw==/com.example.flutter.squareup.sdk.reader-58rXotmONPwGViLs1u2JlA==/base.apk"],nativeLibraryDirectories=[/data/app/~~qFmOamREV5Uk2X3EQdMiFw==/com.example.flutter.squareup.sdk.reader-58rXotmONPwGViLs1u2JlA==/lib/arm, /data/app/~~qFmOamREV5Uk2X3EQdMiFw==/com.example.flutter.squareup.sdk.reader-58rXotmONPwGViLs1u2JlA==/base.apk!/lib/armeabi-v7a, /system/lib, /product/lib]]
        at dalvik.system.BaseDexClassLoader.findClass(BaseDexClassLoader.java:207)
        at java.lang.ClassLoader.loadClass(ClassLoader.java:379)
        at java.lang.ClassLoader.loadClass(ClassLoader.java:312)
        at c.e.P.a.h.b.b(:2)
        at c.e.P.a.h.b.a(:3) 
        at c.e.P.a.a.a(:2) 
        at com.example.flutter.squareup.sdk.reader.MainApplication.onCreate(:2) 
        at android.app.Instrumentation.callApplicationOnCreate(Instrumentation.java:1192) 
        at android.app.ActivityThread.handleBindApplication(ActivityThread.java:6607) 
        at android.app.ActivityThread.access$1300(ActivityThread.java:233) 
        at android.app.ActivityThread$H.handleMessage(ActivityThread.java:1896) 
        at android.os.Handler.dispatchMessage(Handler.java:106) 
        at android.os.Looper.loop(Looper.java:223) 
        at android.app.ActivityThread.main(ActivityThread.java:7523) 
        at java.lang.reflect.Method.invoke(Native Method) 
        at com.android.internal.os.RuntimeInit$MethodAndArgsCaller.run(RuntimeInit.java:592) 
        at com.android.internal.os.ZygoteInit.main(ZygoteInit.java:941) 
```
 
### Solution

In order to circumvent this, in your `app/build.gradle` you can use the following `buildTypes`:
```groovy
  buildTypes {
        release {
            signingConfig signingConfigs.release
            minifyEnabled false
            shrinkResources false
        }
    }
```