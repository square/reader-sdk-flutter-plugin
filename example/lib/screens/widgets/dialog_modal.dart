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

/// displays an error modal with the supplied message
Future<Null> displayErrorModal(BuildContext context, String message) =>
    showDialog(
        context: context,
        builder: (var context) => AlertDialog(
              title: Text(
                'Error',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(
                      message,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));

Future<Null> displayModal(BuildContext context, String message, void onPress) =>
    showDialog(
        context: context,
        builder: (var context) => AlertDialog(
              title: Text('AlertDialog Title'),
              content: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Text('This is a demo alert dialog.'),
                    Text('Would you like to approve of this message?'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Confirm'),
                  onPressed: () {
                    print('Confirmed');
                    Navigator.of(context).pop();
                    onPress;
                  },
                ),
                TextButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));

Future<Null> confirmOnDeauthorize({
  BuildContext? context,
  VoidCallback? onPressed,
}) =>
    showDialog(
      context: context!,
      barrierDismissible: false, // user must tap button!
      builder: (var context) => AlertDialog(
        title: const Text(
          'Are you sure you want to Deauthorize Token ?',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(
              context,
            ),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: onPressed,
            child: const Text('OK'),
          ),
        ],
      ),
    );
