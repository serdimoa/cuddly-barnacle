import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:qredo_sample/home/home.dart';
import 'package:qredo_sample/login/view.dart';
import 'package:qredo_sample/profile/profile.dart';

part 'common_router.g.dart';

@TypedGoRoute<SplashRoute>(path: SplashRoute.path)
@immutable
class SplashRoute extends GoRouteData {
  static const path = '/splash';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Scaffold(
      body: Center(child: Text('Splash Page')),
    );
  }
}

@TypedGoRoute<HomeRoute>(
  path: HomeRoute.path,
)
@immutable
class HomeRoute extends GoRouteData {
  static const path = '/home';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

@TypedGoRoute<LoginRoute>(path: LoginRoute.path, routes: [
  TypedGoRoute<ProfileRoute>(path: ProfileRoute.path),
])
@immutable
class LoginRoute extends GoRouteData {
  static const path = '/login';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginPage();
  }
}
