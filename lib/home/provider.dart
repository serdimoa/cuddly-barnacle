import 'package:qredo_sample/home/model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@riverpod
class Users extends _$Users {
  @override
  List<User> build() {
    return [
      const User(
        name: 'Init User',
        phone: Phone(number: "1234"),
      ),
    ];
  }

  Future<void> addUser() async {
    final profile = await ref.read(profileProvider.future);

    state = [...state, profile];
  }
}

@riverpod
User firstUser(FirstUserRef ref) {
  return ref.watch(usersProvider).last;
}

@riverpod
class Profile extends _$Profile {
  @override
  Future<User> build() async {
    await Future.delayed(const Duration(seconds: 5));
    return const User(
      name: 'Init User from future',
      phone: Phone(number: "1234"),
    );
  }
}
