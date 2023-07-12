import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qredo_sample/shared/shared.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Login Page'),
            ElevatedButton(
              onPressed: () => ref.read(authControllerProvider.notifier).login(
                    'myEmail',
                    'myPassword',
                  ),
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
