import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qredo_sample/common_router.dart';
import 'package:qredo_sample/shared/shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_info.g.dart';

@riverpod
class LoginInfo extends _$LoginInfo implements Listenable {
  VoidCallback? _routerListener;
  bool _isAuth = false;

  @override
  Future<void> build() async {
    _isAuth = await ref.watch(
      authControllerProvider.selectAsync(
        (data) => data.map(signedIn: (_) => true, signedOut: (_) => false),
      ),
    );
    ref.listenSelf((_, __) {
      // One could write more conditional logic for when to call redirection
      _routerListener?.call();
    });
  }

  /// Redirects the user when our authentication changes
  String? redirect(BuildContext context, GoRouterState state) {
    if (this.state.isLoading || this.state.hasError) return null;

    final isSplash = state.location == SplashRoute.path;

    if (isSplash) {
      return _isAuth ? HomeRoute.path : LoginRoute.path;
    }

    final isLoggingIn = state.location == LoginRoute.path;
    if (isLoggingIn) return _isAuth ? HomeRoute.path : null;

    return _isAuth ? null : SplashRoute.path;
  }

  @override
  void addListener(VoidCallback listener) {
    _routerListener = listener;
  }

  /// Removes [GoRouter]'s listener as specified by its [Listenable].
  /// [GoRouteInformationProvider] uses this method when disposing,
  /// so that it removes its callback when destroyed.
  /// Check out the internal implementation of [GoRouter] and
  /// [GoRouteInformationProvider] to see this in action.
  @override
  void removeListener(VoidCallback listener) {
    _routerListener = null;
  }
}
