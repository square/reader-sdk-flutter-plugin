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
import 'components/animated_logo.dart';
import 'components/buttons.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'components/static_logo.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _hasAnimated = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: !_hasAnimated ? new ConstrainedBox( 
        constraints: new BoxConstraints.expand(),
        child: new Logo(
          onLogoAnimated: () {
            setState(() {
              _hasAnimated = true;
            });
          }
        )
      ) : new Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 100.0),
            child: new SquareLogo()
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              'Grant Reader SDK the required permissions.',
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            child: ButtonContainer()
          )
        ]
      ),
    );
  }
}

class ButtonContainer extends StatefulWidget {
  @override
  _ButtonContainerState createState() => new _ButtonContainerState();
}

class _ButtonContainerState extends State<ButtonContainer> {
  bool _hasLocationAccess = false;
  String _locationButtonText = 'Enable Location Access';

  bool _hasMicrophoneAccess = false;
  String _microphoneButtonText = 'Enable Microphone Access';

  // @override
  initState() {
    super.initState();
    checkPermissionsAndNavigate();
  }

  requestPermission(Permission permission) async {
    PermissionStatus permissionStatus = await SimplePermissions.getPermissionStatus(permission);
    switch (permissionStatus) {
      case PermissionStatus.denied:
        await SimplePermissions.openSettings();
        break;
      default:
        await SimplePermissions.requestPermission(permission);
    }

    checkPermissionsAndNavigate();
  }

  onRequestLocationPermission() {    
    requestPermission(Permission.WhenInUseLocation);
  }

  onRequestAudioPermission() {
    requestPermission(Permission.RecordAudio);
  }

  checkPermissionsAndNavigate() async {
    PermissionStatus locationPermission = await SimplePermissions.getPermissionStatus(Permission.WhenInUseLocation);
    PermissionStatus microphonePermission = await SimplePermissions.getPermissionStatus(Permission.RecordAudio);

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

  updateLocationStatus(PermissionStatus status) {
      setState(() {
        _hasLocationAccess = status == PermissionStatus.authorized;

        switch(status) {
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

  updateMicrophoneStatus(PermissionStatus status) {
      setState(() {
        _hasMicrophoneAccess = status == PermissionStatus.authorized;

        switch(status) {
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
  Widget build(BuildContext context) {
    return new SQButtonContainer(
      buttons: [
        SQOutlineButton(
          text: _microphoneButtonText,
          onPressed: _hasMicrophoneAccess? null : onRequestAudioPermission,
        ),
        SQOutlineButton(
          text: _locationButtonText,
          onPressed: _hasLocationAccess? null : onRequestLocationPermission
        ),
      ]
    );
  }
}