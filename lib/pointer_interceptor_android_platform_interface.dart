import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'pointer_interceptor_android_method_channel.dart';

abstract class PointerInterceptorAndroidPlatform extends PlatformInterface {
  /// Constructs a PointerInterceptorAndroidPlatform.
  PointerInterceptorAndroidPlatform() : super(token: _token);

  static final Object _token = Object();

  static PointerInterceptorAndroidPlatform _instance =
      MethodChannelPointerInterceptorAndroid();

  /// The default instance of [PointerInterceptorAndroidPlatform] to use.
  ///
  /// Defaults to [MethodChannelPointerInterceptorAndroid].
  static PointerInterceptorAndroidPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PointerInterceptorAndroidPlatform] when
  /// they register themselves.
  static set instance(PointerInterceptorAndroidPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }
}
