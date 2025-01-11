import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list_app/core/shared/domain/entities/user.dart';

part 'user_dto.freezed.dart';

part 'user_dto.g.dart';

@freezed
class UserDto with _$UserDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UserDto({
    required int id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  }) = _UserDto;
  factory UserDto.fromDomain(User user) {
    return UserDto(
      id: user.id,
      email: user.email,
      firstName: user.name,
      lastName: user.lastName,
      avatar: user.photoUrl,
    );
  }

  const UserDto._();

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  User toDomain() {
    return User(
      id: id,
      email: email,
      name: firstName,
      lastName: lastName,
      photoUrl: avatar,
    );
  }
}
