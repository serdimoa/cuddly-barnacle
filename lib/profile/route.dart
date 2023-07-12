import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:qredo_sample/home/home.dart';

class ProfileRoute extends GoRouteData {
  static const path = 'profile';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Scaffold(
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            return ElevatedButton(
              onPressed: () {
                ref.read(usersProvider.notifier).addUser();
              },
              child: const Text('Add User from go route'),
            );
          },
        ),
      ),
    );
  }
}
