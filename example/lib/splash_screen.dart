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
  bool _hasMicrophoneAccess = false;

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
        PermissionStatus locationPermission = await SimplePermissions.requestPermission(permission);
        setState(() {
          _hasLocationAccess = locationPermission == PermissionStatus.authorized;
        });
    }

    checkPermissionsAndNavigate();
  }

  onRequestLocationPermission() async {    
    await requestPermission(Permission.WhenInUseLocation);
  }

  onRequestAudioPermission() async {
    await requestPermission(Permission.RecordAudio);
  }

  checkPermissionsAndNavigate() async {
    PermissionStatus locationPermission = await SimplePermissions.getPermissionStatus(Permission.WhenInUseLocation);
    PermissionStatus microphonePermission = await SimplePermissions.getPermissionStatus(Permission.RecordAudio);

    // discard if wiget has been removed while waiting
    if (!mounted) return;

    setState(() {
      _hasLocationAccess = locationPermission == PermissionStatus.authorized;
      _hasMicrophoneAccess = (microphonePermission == PermissionStatus.authorized || microphonePermission == PermissionStatus.notDetermined);
    });

    if (_hasLocationAccess && _hasMicrophoneAccess) {
      Navigator.pushNamed(context, '/authorize');
    }
  }

  @override
  Widget build(BuildContext context) {
    return new SQButtonContainer(
      buttons: [
        SQOutlineButton(
          text: _hasMicrophoneAccess? 'Microphone Enabled' : 'Enable Microphone Access',
          onPressed: onRequestAudioPermission,
        ),
        SQOutlineButton(
          text: _hasLocationAccess? 'Location Enabled' : 'Enable Location Access',
          onPressed: onRequestLocationPermission
        ),
      ]
    );
  }
}