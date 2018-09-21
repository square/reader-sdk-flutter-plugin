import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionButton extends StatelessWidget{
  const PermissionButton({
    Key key,
    @required this.permissionStatus,
    @required this.onPressed,
    @required this.permissionName,
    }) : super(key: key);

  final PermissionStatus permissionStatus;
  final String permissionName;
  final VoidCallback onPressed;

  String getLabel() {
    if (this.permissionStatus == PermissionStatus.granted) {
      return '${this.permissionName} enabled';
    } else if (this.permissionStatus == PermissionStatus.denied) {
      return 'enable ${this.permissionName} in settings';
    } else if (this.permissionStatus == PermissionStatus.unknown) {
      return 'enable ${this.permissionName}';
    } else {
      return '${this.permissionName} is ${this.permissionStatus.toString()}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: this.onPressed,
      child: Text(this.getLabel()),
    );
  }
}