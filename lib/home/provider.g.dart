// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firstUserHash() => r'489c55e426142376a56cf118500a6107ec200965';

/// See also [firstUser].
@ProviderFor(firstUser)
final firstUserProvider = AutoDisposeProvider<User>.internal(
  firstUser,
  name: r'firstUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$firstUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirstUserRef = AutoDisposeProviderRef<User>;
String _$usersHash() => r'17df8a46a5b941edd7dacdc920adcd3bc4e00c06';

/// See also [Users].
@ProviderFor(Users)
final usersProvider = AutoDisposeNotifierProvider<Users, List<User>>.internal(
  Users.new,
  name: r'usersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$usersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Users = AutoDisposeNotifier<List<User>>;
String _$profileHash() => r'44ae7ceb2842071cf37770af11ae64c2c1d6d63d';

/// See also [Profile].
@ProviderFor(Profile)
final profileProvider =
    AutoDisposeAsyncNotifierProvider<Profile, User>.internal(
  Profile.new,
  name: r'profileProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$profileHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Profile = AutoDisposeAsyncNotifier<User>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
