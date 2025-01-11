import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_dto.freezed.dart';

part 'register_dto.g.dart';

@freezed
class RegisterDto with _$RegisterDto {
  const factory RegisterDto({
    required int id,
    required String token,
  }) = _RegisterDto;

  const RegisterDto._();

  factory RegisterDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterDtoFromJson(json);
}
