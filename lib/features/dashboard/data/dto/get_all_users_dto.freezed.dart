// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_all_users_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetAllUsersDto _$GetAllUsersDtoFromJson(Map<String, dynamic> json) {
  return _GetAllUsersDto.fromJson(json);
}

/// @nodoc
mixin _$GetAllUsersDto {
  List<UserDto> get data => throw _privateConstructorUsedError;

  /// Serializes this GetAllUsersDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetAllUsersDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetAllUsersDtoCopyWith<GetAllUsersDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetAllUsersDtoCopyWith<$Res> {
  factory $GetAllUsersDtoCopyWith(
          GetAllUsersDto value, $Res Function(GetAllUsersDto) then) =
      _$GetAllUsersDtoCopyWithImpl<$Res, GetAllUsersDto>;
  @useResult
  $Res call({List<UserDto> data});
}

/// @nodoc
class _$GetAllUsersDtoCopyWithImpl<$Res, $Val extends GetAllUsersDto>
    implements $GetAllUsersDtoCopyWith<$Res> {
  _$GetAllUsersDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetAllUsersDto
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
              as List<UserDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetAllUsersDtoImplCopyWith<$Res>
    implements $GetAllUsersDtoCopyWith<$Res> {
  factory _$$GetAllUsersDtoImplCopyWith(_$GetAllUsersDtoImpl value,
          $Res Function(_$GetAllUsersDtoImpl) then) =
      __$$GetAllUsersDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<UserDto> data});
}

/// @nodoc
class __$$GetAllUsersDtoImplCopyWithImpl<$Res>
    extends _$GetAllUsersDtoCopyWithImpl<$Res, _$GetAllUsersDtoImpl>
    implements _$$GetAllUsersDtoImplCopyWith<$Res> {
  __$$GetAllUsersDtoImplCopyWithImpl(
      _$GetAllUsersDtoImpl _value, $Res Function(_$GetAllUsersDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetAllUsersDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$GetAllUsersDtoImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<UserDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetAllUsersDtoImpl extends _GetAllUsersDto {
  const _$GetAllUsersDtoImpl({required final List<UserDto> data})
      : _data = data,
        super._();

  factory _$GetAllUsersDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetAllUsersDtoImplFromJson(json);

  final List<UserDto> _data;
  @override
  List<UserDto> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'GetAllUsersDto(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAllUsersDtoImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of GetAllUsersDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAllUsersDtoImplCopyWith<_$GetAllUsersDtoImpl> get copyWith =>
      __$$GetAllUsersDtoImplCopyWithImpl<_$GetAllUsersDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetAllUsersDtoImplToJson(
      this,
    );
  }
}

abstract class _GetAllUsersDto extends GetAllUsersDto {
  const factory _GetAllUsersDto({required final List<UserDto> data}) =
      _$GetAllUsersDtoImpl;
  const _GetAllUsersDto._() : super._();

  factory _GetAllUsersDto.fromJson(Map<String, dynamic> json) =
      _$GetAllUsersDtoImpl.fromJson;

  @override
  List<UserDto> get data;

  /// Create a copy of GetAllUsersDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetAllUsersDtoImplCopyWith<_$GetAllUsersDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
