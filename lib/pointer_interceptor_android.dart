import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:pointer_interceptor_platform_interface/pointer_interceptor_platform_interface.dart';

class PointerInterceptorAndroid extends PointerInterceptorPlatform {
  static void registerWith() {
    PointerInterceptorPlatform.instance = PointerInterceptorAndroid();
  }

  @override
  Widget buildWidget({required Widget child, bool debug = false, Key? key}) {
    return Stack(alignment: Alignment.center, children: <Widget>[
      Opacity(
        opacity: 0.2,
        child: Center(
          child: ColoredBox(color: Colors.red, child: AndroidPlatformView()),
        ),
      ),
      child,
    ]);
  }
}

class AndroidPlatformView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformViewLink(
      viewType: 'pointer_interceptor_android_view',
      surfaceFactory:
          (BuildContext context, PlatformViewController controller) {
        return AndroidViewSurface(
          controller: controller as AndroidViewController,
          gestureRecognizers: Set()
            ..add(Factory<OneSequenceGestureRecognizer>(
                () => EagerGestureRecognizer())),
          hitTestBehavior: PlatformViewHitTestBehavior.opaque,
        );
      },
      onCreatePlatformView: (PlatformViewCreationParams params) {
        return PlatformViewsService.initSurfaceAndroidView(
          id: params.id,
          viewType: 'pointer_interceptor_android_view',
          layoutDirection: TextDirection.ltr,
          creationParams: {},
          creationParamsCodec: const StandardMessageCodec(),
        )
          ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
          ..create();
      },
    );
  }
}
