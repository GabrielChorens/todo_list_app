// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetUserDto _$GetUserDtoFromJson(Map<String, dynamic> json) {
  return _GetUserDto.fromJson(json);
}

/// @nodoc
mixin _$GetUserDto {
  UserDto get data => throw _privateConstructorUsedError;

  /// Serializes this GetUserDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetUserDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetUserDtoCopyWith<GetUserDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetUserDtoCopyWith<$Res> {
  factory $GetUserDtoCopyWith(
          GetUserDto value, $Res Function(GetUserDto) then) =
      _$GetUserDtoCopyWithImpl<$Res, GetUserDto>;
  @useResult
  $Res call({UserDto data});

  $UserDtoCopyWith<$Res> get data;
}

/// @nodoc
class _$GetUserDtoCopyWithImpl<$Res, $Val extends GetUserDto>
    implements $GetUserDtoCopyWith<$Res> {
  _$GetUserDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetUserDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as UserDto,
    ) as $Val);
  }

  /// Create a copy of GetUserDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDtoCopyWith<$Res> get data {
    return $UserDtoCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetUserDtoImplCopyWith<$Res>
    implements $GetUserDtoCopyWith<$Res> {
  factory _$$GetUserDtoImplCopyWith(
          _$GetUserDtoImpl value, $Res Function(_$GetUserDtoImpl) then) =
      __$$GetUserDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserDto data});

  @override
  $UserDtoCopyWith<$Res> get data;
}

/// @nodoc
class __$$GetUserDtoImplCopyWithImpl<$Res>
    extends _$GetUserDtoCopyWithImpl<$Res, _$GetUserDtoImpl>
    implements _$$GetUserDtoImplCopyWith<$Res> {
  __$$GetUserDtoImplCopyWithImpl(
      _$GetUserDtoImpl _value, $Res Function(_$GetUserDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetUserDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$GetUserDtoImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as UserDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetUserDtoImpl extends _GetUserDto {
  const _$GetUserDtoImpl({required this.data}) : super._();

  factory _$GetUserDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetUserDtoImplFromJson(json);

  @override
  final UserDto data;

  @override
  String toString() {
    return 'GetUserDto(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserDtoImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of GetUserDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUserDtoImplCopyWith<_$GetUserDtoImpl> get copyWith =>
      __$$GetUserDtoImplCopyWithImpl<_$GetUserDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetUserDtoImplToJson(
      this,
    );
  }
}

abstract class _GetUserDto extends GetUserDto {
  const factory _GetUserDto({required final UserDto data}) = _$GetUserDtoImpl;
  const _GetUserDto._() : super._();

  factory _GetUserDto.fromJson(Map<String, dynamic> json) =
      _$GetUserDtoImpl.fromJson;

  @override
  UserDto get data;

  /// Create a copy of GetUserDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetUserDtoImplCopyWith<_$GetUserDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
