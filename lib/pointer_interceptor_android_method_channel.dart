import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'pointer_interceptor_android_platform_interface.dart';

/// An implementation of [PointerInterceptorAndroidPlatform] that uses method channels.
class MethodChannelPointerInterceptorAndroid
    extends PointerInterceptorAndroidPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('pointer_interceptor_android');
}
