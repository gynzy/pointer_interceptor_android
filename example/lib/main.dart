import 'package:flutter/material.dart';
import 'package:pointer_interceptor_platform_interface/pointer_interceptor_platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MaterialApp(home: PointerInterceptorAndroidExample()));
}

class _DummyPlatformView extends StatelessWidget {
  const _DummyPlatformView();

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController();
    controller.loadRequest(Uri.parse('https://flutter.dev/docs'));

    return WebViewWidget(controller: controller);
  }
}

/// Example flutter app with a button overlaying the native view.
class PointerInterceptorAndroidExample extends StatefulWidget {
  /// Constructor
  const PointerInterceptorAndroidExample({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PointerInterceptorAndroidExampleState();
  }
}

class _PointerInterceptorAndroidExampleState
    extends State<PointerInterceptorAndroidExample> {
  bool _buttonTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          const _DummyPlatformView(),
          PointerInterceptorPlatform.instance.buildWidget(
              child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red,
                    backgroundColor: Colors.yellow,
                    textStyle: const TextStyle(fontSize: 30),
                  ),
                  child: _buttonTapped
                      ? const Text('Tapped')
                      : const Text('Initial'),
                  onPressed: () {
                    setState(() {
                      _buttonTapped = !_buttonTapped;
                    });
                  })),
        ],
      ),
    ));
  }
}
