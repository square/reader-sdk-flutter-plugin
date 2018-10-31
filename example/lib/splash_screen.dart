/*
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
*/

import 'package:flutter/material.dart';
import 'package:simple_permissions/simple_permissions.dart';

import 'components/animated_logo.dart';
import 'components/buttons.dart';
import 'components/static_logo.dart';

/// A screen that shows an animated square logo and asks for square permissions
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _hasAnimated = false;

  @override
  Widget build(BuildContext context) =>
    Scaffold(
      body: !_hasAnimated
          ? ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: Logo(onLogoAnimated: () {
                setState(() {
                  _hasAnimated = true;
                });
              }))
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 100.0),
                      child: SquareLogo()),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 32.0),
                    child: Text(
                      'Grant Reader SDK the required permissions.',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(child: _ButtonContainer())
                ]),
    );
}

class _ButtonContainer extends StatefulWidget {
  @override
  _ButtonContainerState createState() => _ButtonContainerState();
}

class _ButtonContainerState extends State<_ButtonContainer> {
  bool _hasLocationAccess = false;
  String _locationButtonText = 'Enable Location Access';

  bool _hasMicrophoneAccess = false;
  String _microphoneButtonText = 'Enable Microphone Access';

  // @override
  void initState() {
    super.initState();
    checkPermissionsAndNavigate();
  }

  void requestPermission(Permission permission) async {
    var permissionStatus =
        await SimplePermissions.getPermissionStatus(permission);
    switch (permissionStatus) {
      case PermissionStatus.denied:
        await SimplePermissions.openSettings();
        break;
      default:
        await SimplePermissions.requestPermission(permission);
    }

    checkPermissionsAndNavigate();
  }

  void onRequestLocationPermission() {
    requestPermission(Permission.WhenInUseLocation);
  }

  void onRequestAudioPermission() {
    requestPermission(Permission.RecordAudio);
  }

  void checkPermissionsAndNavigate() async {
    var locationPermission =
        await SimplePermissions.getPermissionStatus(
            Permission.WhenInUseLocation);
    var microphonePermission =
        await SimplePermissions.getPermissionStatus(Permission.RecordAudio);

    // discard if wiget has been removed while waiting
    if (!mounted) return;

    setState(() {
      updateLocationStatus(locationPermission);
      updateMicrophoneStatus(microphonePermission);
    });

    if (_hasLocationAccess && _hasMicrophoneAccess) {
      Navigator.popAndPushNamed(context, '/authorize');
    }
  }

  void updateLocationStatus(PermissionStatus status) {
    setState(() {
      _hasLocationAccess = status == PermissionStatus.authorized;

      switch (status) {
        case PermissionStatus.authorized:
          _locationButtonText = 'Location Enabled';
          break;
        case PermissionStatus.denied:
        case PermissionStatus.deniedNeverAsk:
          _locationButtonText = 'Enable Location in Settings';
          break;
        case PermissionStatus.restricted:
          _locationButtonText = 'Location permission is restricted';
          break;
        case PermissionStatus.notDetermined:
          _locationButtonText = 'Enable Location Access';
          break;
      }
    });
  }

  void updateMicrophoneStatus(PermissionStatus status) {
    setState(() {
      _hasMicrophoneAccess = status == PermissionStatus.authorized;

      switch (status) {
        case PermissionStatus.authorized:
          _microphoneButtonText = 'Microphone Enabled';
          break;
        case PermissionStatus.denied:
        case PermissionStatus.deniedNeverAsk:
          _microphoneButtonText = 'Enable Microphone in Settings';
          break;
        case PermissionStatus.restricted:
          _microphoneButtonText = 'Microphone permission is restricted';
          break;
        case PermissionStatus.notDetermined:
          _microphoneButtonText = 'Enable Microphone Access';
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) =>
    SQButtonContainer(buttons: [
      SQOutlineButton(
        text: _microphoneButtonText,
        onPressed: _hasMicrophoneAccess ? null : onRequestAudioPermission,
      ),
      SQOutlineButton(
          text: _locationButtonText,
          onPressed: _hasLocationAccess ? null : onRequestLocationPermission),
    ]);
}
