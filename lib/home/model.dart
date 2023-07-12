import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';
part 'model.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String name,
    String? email,
    Phone? phone,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}

@freezed
class Phone with _$Phone {
  const factory Phone({
    required String number,
  }) = _Phone;
  factory Phone.fromJson(Map<String, Object?> json) => _$PhoneFromJson(json);
}
