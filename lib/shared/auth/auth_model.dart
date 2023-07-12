import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_model.freezed.dart';

@freezed
class Auth with _$Auth {
  const factory Auth.signedIn({
    required int id,
    required String displayName,
    required String email,
    required String token,
  }) = SignedIn;

  const factory Auth.signedOut() = SignedOut;
}
