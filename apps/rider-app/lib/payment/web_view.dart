import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WebView extends StatefulWidget {
  final double amount;
  final String phoneNumber;

  const WebView({
    required this.amount,
    required this.phoneNumber,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  static const platform = MethodChannel('samples.flutter.dev/battery');
  final Map<String, dynamic> creationParams = <String, dynamic>{};
  String _response = '';

  void _onPlatformViewCreated(int id) {
    _getBatteryLevel();
  }

  Future<void> _getBatteryLevel() async {
    String response;
    try {
      // Value "amount" must be sent (it is TOTAL TRIP COST)
      // "phoneNumber" is User phoneNumber ,must also be sent
      final String result = await platform.invokeMethod('setUrl', {
        "amount": "${widget.amount}",
        "phoneNumber": widget.phoneNumber,
      });
      response = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      response = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _response = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    const String viewType = '<platform-view-type>';

    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        viewType: viewType,
        layoutDirection: TextDirection.ltr,
        creationParams: creationParams,
        creationParamsCodec: const StandardMessageCodec(),
        onPlatformViewCreated: _onPlatformViewCreated,
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return UiKitView(
        viewType: viewType,
        layoutDirection: TextDirection.ltr,
        creationParams: creationParams,
        creationParamsCodec: const StandardMessageCodec(),
        onPlatformViewCreated: _onPlatformViewCreated,
      );
    }
    return Text('$defaultTargetPlatform is not supported!');
  }
}
