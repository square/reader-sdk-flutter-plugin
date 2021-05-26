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
  Widget build(BuildContext context) => OutlineButton(
        child: Text(text!),
        textColor: Colors.white,
        highlightColor: Color.fromRGBO(57, 114, 178, 1.0),
        borderSide: BorderSide(
            color: Colors.white, style: BorderStyle.solid, width: 1.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
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
  Widget build(BuildContext context) => RaisedButton(
        child: Text(text),
        textColor: Colors.white,
        color: Color.fromRGBO(57, 114, 178, 1.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        onPressed: onPressed,
      );
}
