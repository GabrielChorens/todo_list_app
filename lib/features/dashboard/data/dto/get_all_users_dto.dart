import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list_app/core/shared/data/dto/user_dto.dart';

part 'get_all_users_dto.freezed.dart';

part 'get_all_users_dto.g.dart';

@freezed
class GetAllUsersDto with _$GetAllUsersDto {
  const factory GetAllUsersDto({
    required List<UserDto> data,
  }) = _GetAllUsersDto;
  
  const GetAllUsersDto._();

  factory GetAllUsersDto.fromJson(Map<String, dynamic> json) =>
      _$GetAllUsersDtoFromJson(json);
}
