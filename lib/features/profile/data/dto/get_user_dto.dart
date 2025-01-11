import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list_app/core/shared/data/dto/user_dto.dart';

part 'get_user_dto.freezed.dart';

part 'get_user_dto.g.dart';

@freezed
class GetUserDto with _$GetUserDto {
  const factory GetUserDto({
    required UserDto data,
  }) = _GetUserDto;

  const GetUserDto._();

  factory GetUserDto.fromJson(Map<String, dynamic> json) =>
      _$GetUserDtoFromJson(json);
}
