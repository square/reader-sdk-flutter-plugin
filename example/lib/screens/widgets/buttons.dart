/*
Copyright 2022 Square Inc.

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

/// A container that lays out square-styled buttons
class SQButtonContainer extends StatelessWidget {
  /// initialize with a list of buttons
  SQButtonContainer({
    required this.buttons,
  });

  /// buttons are that displays in the order they appear in the list
  final List<dynamic> buttons;

  _buildButtonContainers() {
    // last button has additional padding
    final lastButton = buttons.removeLast();

    final buttonContainers = buttons
        .map((button) => Container(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
            width: double.infinity,
            child: button))
        .toList();

    buttonContainers.add(Container(
        margin:
            EdgeInsets.only(top: 8.0, bottom: 32.0, left: 32.0, right: 32.0),
        width: double.infinity,
        child: lastButton));

    return buttonContainers;
  }

  @override
  Widget build(BuildContext context) =>
      Column(children: _buildButtonContainers());
}

/// A button that is styled with a white outline
class SQOutlineButton extends StatelessWidget {
  /// initializer
  SQOutlineButton({
    this.text,
    this.onPressed,
  });

  /// the text displayed in the button
  final String? text;

  /// a callback that is fired when the button is pressed
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) => OutlinedButton(
        child: Text(
          text!,
          style: TextStyle(color: Colors.white),
        ),
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(20.0),
          side: BorderSide(
              color: Colors.white, style: BorderStyle.solid, width: 1.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
        onPressed: onPressed,
      );
}

/// A button that is styled with a white outline
class SQSettingButton extends StatelessWidget {
  /// initializer
  SQSettingButton({
    this.onPressed,
  });

  /// a callback that is fired when the button is pressed
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => OutlinedButton(
        child: Icon(
          Icons.settings,
          size: 35.0,
          color: Colors.white,
        ),
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(20.0),
          side: BorderSide(
              color: Colors.blue, style: BorderStyle.solid, width: 0.1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
        onPressed: onPressed,
      );
}

/// A button with a blue background
class SQRaisedButton extends StatelessWidget {
  /// initializer
  SQRaisedButton({
    required this.text,
    required this.onPressed,
  });

  /// the text displayed in the button
  final String text;

  /// a callback that is fired when the button is pressed
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        child: Text(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromRGBO(57, 114, 178, 1.0),
          padding: EdgeInsets.all(15.0),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
        onPressed: onPressed,
      );
}
