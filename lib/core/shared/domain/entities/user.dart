import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required int id,
    String? email,
    String? name,
    String? lastName,
    String? photoUrl,
  }) = _User;
}
