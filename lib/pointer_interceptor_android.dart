import 'package:flutter/material.dart';
import 'package:pointer_interceptor_platform_interface/pointer_interceptor_platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PointerInterceptorAndroid extends PointerInterceptorPlatform {
  static void registerWith() {
    PointerInterceptorPlatform.instance = PointerInterceptorAndroid();
  }

  @override
  Widget buildWidget({required Widget child, bool debug = false, Key? key}) {
    return Stack(alignment: Alignment.center, children: <Widget>[
      Opacity(
        opacity: 0.2,
        child: WebViewWidget(controller: WebViewController()),
      ),
      child,
    ]);
  }
}
