import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qredo_sample/common_router.dart';
import 'package:qredo_sample/home/provider.dart';
import 'package:qredo_sample/profile/profile.dart';
import 'package:qredo_sample/shared/shared.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    log('debug: build');
    final fu = ref.watch(firstUserProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home Page'),
            const Text("There's nothing much you can do, here"),
            const UsersView(),
            Text(fu.name),
            Text(fu.phone?.number ?? ''),
            Consumer(builder: (context, ref, ___) {
              final profile = ref.watch(profileProvider);

              return profile.maybeWhen(
                data: (profile) => Text('Profile: ${profile.name}'),
                loading: () => const Text('Loading...'),
                orElse: () => const Text('Loading...'),
              );
            }),
            Consumer(
              builder: (context, ref, child) {
                return ElevatedButton(
                  onPressed: ref.read(authControllerProvider.notifier).logout,
                  child: const Text('Logout'),
                );
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                return ElevatedButton(
                  onPressed: () {
                    ref.read(usersProvider.notifier).addUser();
                  },
                  child: const Text('Add User'),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                ProfileRoute().push(context);
              },
              child: const Text('create push route'),
            )
          ],
        ),
      ),
    );
  }
}

class UsersView extends ConsumerWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(usersProvider);

    return ListView(
      shrinkWrap: true,
      children: [
        for (final user in users) Text(user.name),
      ],
    );
  }
}
