import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:qredo_sample/common_router.dart';
import 'package:qredo_sample/shared/login_info.dart';

void main() {
  runApp(
    const ProviderScope(child: RootApp()),
  );
}

class RootApp extends ConsumerWidget {
  const RootApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, ref) {
    final router = GoRouter(
      debugLogDiagnostics: true,
      routes: $appRoutes,
      refreshListenable: ref.watch(loginInfoProvider.notifier),
      initialLocation: SplashRoute.path,
      redirect: ref.watch(loginInfoProvider.notifier).redirect,
    );
    return MaterialApp.router(
      title: 'Qredo Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
