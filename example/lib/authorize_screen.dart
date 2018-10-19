import 'package:flutter/material.dart';
import 'components/buttons.dart';
import 'components/static_logo.dart';
import 'package:square_reader_sdk_flutter_plugin/square_reader_sdk_flutter_plugin.dart';

class AuthorizeScreen extends StatefulWidget {
  @override
  _AuthorizeScreenState createState() => new _AuthorizeScreenState();
}

class _AuthorizeScreenState extends State<AuthorizeScreen> {
  initState() {
    super.initState();
    
    SquareReaderSdkPlugin.isAuthorized.then((isAuthorized) {
      if (isAuthorized) {
        Navigator.pushNamed(context, '/checkout');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 100.0),
            child: new SquareLogo(),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 64.0),
            child: Column(
              children: [
                Text(
                  'Authorize Reader SDK.',
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Generate an authorization code in the Reader SDK tab of the Developer Portal',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w300
                  ),
                ),
              ]
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
  initState() {
    super.initState();
    checkAuthAndNavigate();
  }

  checkAuthAndNavigate() async {
    SquareReaderSdkPlugin.isAuthorized.then((isAuthorized) {
      if (isAuthorized) {
        Navigator.pushNamed(context, '/checkout');
      }
    });
  }

  scanQRCode() async {
    Navigator.pushNamed(context, '/authorize/camera');
  }

  manuallyEnterCode() async {
    Navigator.pushNamed(context, '/authorize/manual');
  }

  @override
  Widget build(BuildContext context) {
    return new SQButtonContainer(
      buttons: [
        SQRaisedButton(
          text: 'Scan QR Code',
          onPressed: scanQRCode,
        ),
        SQOutlineButton(
          text: 'Manually Enter Code',
          onPressed: manuallyEnterCode
        ),
      ]
    );
  }
}