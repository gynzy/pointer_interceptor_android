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
        opacity: 0.0,

        /// A WebViewWidget is needed to ensure pointer events are also
        /// intercepted when a WebView is present in the widget tree.
        child: WebViewWidget(controller: WebViewController()),
      ),
      child,
    ]);
  }
}
