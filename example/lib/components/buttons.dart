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

class SQButtonContainer extends StatelessWidget {
  SQButtonContainer({
    this.buttons,
  });

  final List<dynamic> buttons;

  _buildButtonContainers() {
    // last button has additional padding
    final lastButton = buttons.removeLast();

    final buttonContainers = this.buttons.map((button) {
      return Container(
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
          width: double.infinity,
          child: button
      );
    }).toList();

    buttonContainers.add(Container(
        margin: EdgeInsets.only(top: 8.0, bottom: 32.0, left: 32.0, right: 32.0),
        width: double.infinity,
        child: lastButton
    ));

    return buttonContainers;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _buildButtonContainers()
    );
  }   
}

class SQOutlineButton extends StatelessWidget {
  SQOutlineButton({
    this.text,
    this.onPressed,
  });

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      child: Text(this.text),
      textColor: Colors.white,
      highlightColor: Color.fromRGBO(57, 114, 178, 1.0),
      borderSide: BorderSide(color: Colors.white, style: BorderStyle.solid, width: 1.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      onPressed: this.onPressed,
    );
  }
}

class SQRaisedButton extends StatelessWidget {
  SQRaisedButton({
    this.text,
    this.onPressed,
  });

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(this.text),
      textColor: Colors.white,
      color: Color.fromRGBO(57, 114, 178, 1.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      onPressed: this.onPressed,
    );
  }
}