// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TaskDto _$TaskDtoFromJson(Map<String, dynamic> json) {
  return _TaskDto.fromJson(json);
}

/// @nodoc
mixin _$TaskDto {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'userId')
  int get associatedUserId => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @StringToDateTimeConverter()
  DateTime? get scheduledDateTime => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;
  @JsonKey(name: 'completed')
  bool get isCompleted => throw _privateConstructorUsedError;
  bool get enableNotification => throw _privateConstructorUsedError;
  bool get isPinned => throw _privateConstructorUsedError;

  /// Serializes this TaskDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaskDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskDtoCopyWith<TaskDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskDtoCopyWith<$Res> {
  factory $TaskDtoCopyWith(TaskDto value, $Res Function(TaskDto) then) =
      _$TaskDtoCopyWithImpl<$Res, TaskDto>;
  @useResult
  $Res call(
      {int id,
      String title,
      @JsonKey(name: 'userId') int associatedUserId,
      String? description,
      @StringToDateTimeConverter() DateTime? scheduledDateTime,
      String? color,
      @JsonKey(name: 'completed') bool isCompleted,
      bool enableNotification,
      bool isPinned});
}

/// @nodoc
class _$TaskDtoCopyWithImpl<$Res, $Val extends TaskDto>
    implements $TaskDtoCopyWith<$Res> {
  _$TaskDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? associatedUserId = null,
    Object? description = freezed,
    Object? scheduledDateTime = freezed,
    Object? color = freezed,
    Object? isCompleted = null,
    Object? enableNotification = null,
    Object? isPinned = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      associatedUserId: null == associatedUserId
          ? _value.associatedUserId
          : associatedUserId // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduledDateTime: freezed == scheduledDateTime
          ? _value.scheduledDateTime
          : scheduledDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      enableNotification: null == enableNotification
          ? _value.enableNotification
          : enableNotification // ignore: cast_nullable_to_non_nullable
              as bool,
      isPinned: null == isPinned
          ? _value.isPinned
          : isPinned // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskDtoImplCopyWith<$Res> implements $TaskDtoCopyWith<$Res> {
  factory _$$TaskDtoImplCopyWith(
          _$TaskDtoImpl value, $Res Function(_$TaskDtoImpl) then) =
      __$$TaskDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      @JsonKey(name: 'userId') int associatedUserId,
      String? description,
      @StringToDateTimeConverter() DateTime? scheduledDateTime,
      String? color,
      @JsonKey(name: 'completed') bool isCompleted,
      bool enableNotification,
      bool isPinned});
}

/// @nodoc
class __$$TaskDtoImplCopyWithImpl<$Res>
    extends _$TaskDtoCopyWithImpl<$Res, _$TaskDtoImpl>
    implements _$$TaskDtoImplCopyWith<$Res> {
  __$$TaskDtoImplCopyWithImpl(
      _$TaskDtoImpl _value, $Res Function(_$TaskDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? associatedUserId = null,
    Object? description = freezed,
    Object? scheduledDateTime = freezed,
    Object? color = freezed,
    Object? isCompleted = null,
    Object? enableNotification = null,
    Object? isPinned = null,
  }) {
    return _then(_$TaskDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      associatedUserId: null == associatedUserId
          ? _value.associatedUserId
          : associatedUserId // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduledDateTime: freezed == scheduledDateTime
          ? _value.scheduledDateTime
          : scheduledDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      enableNotification: null == enableNotification
          ? _value.enableNotification
          : enableNotification // ignore: cast_nullable_to_non_nullable
              as bool,
      isPinned: null == isPinned
          ? _value.isPinned
          : isPinned // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskDtoImpl extends _TaskDto {
  _$TaskDtoImpl(
      {required this.id,
      required this.title,
      @JsonKey(name: 'userId') required this.associatedUserId,
      this.description,
      @StringToDateTimeConverter() this.scheduledDateTime,
      this.color,
      @JsonKey(name: 'completed') this.isCompleted = false,
      this.enableNotification = false,
      this.isPinned = false})
      : super._();

  factory _$TaskDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  @JsonKey(name: 'userId')
  final int associatedUserId;
  @override
  final String? description;
  @override
  @StringToDateTimeConverter()
  final DateTime? scheduledDateTime;
  @override
  final String? color;
  @override
  @JsonKey(name: 'completed')
  final bool isCompleted;
  @override
  @JsonKey()
  final bool enableNotification;
  @override
  @JsonKey()
  final bool isPinned;

  @override
  String toString() {
    return 'TaskDto(id: $id, title: $title, associatedUserId: $associatedUserId, description: $description, scheduledDateTime: $scheduledDateTime, color: $color, isCompleted: $isCompleted, enableNotification: $enableNotification, isPinned: $isPinned)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.associatedUserId, associatedUserId) ||
                other.associatedUserId == associatedUserId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.scheduledDateTime, scheduledDateTime) ||
                other.scheduledDateTime == scheduledDateTime) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.enableNotification, enableNotification) ||
                other.enableNotification == enableNotification) &&
            (identical(other.isPinned, isPinned) ||
                other.isPinned == isPinned));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      associatedUserId,
      description,
      scheduledDateTime,
      color,
      isCompleted,
      enableNotification,
      isPinned);

  /// Create a copy of TaskDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskDtoImplCopyWith<_$TaskDtoImpl> get copyWith =>
      __$$TaskDtoImplCopyWithImpl<_$TaskDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskDtoImplToJson(
      this,
    );
  }
}

abstract class _TaskDto extends TaskDto {
  factory _TaskDto(
      {required final int id,
      required final String title,
      @JsonKey(name: 'userId') required final int associatedUserId,
      final String? description,
      @StringToDateTimeConverter() final DateTime? scheduledDateTime,
      final String? color,
      @JsonKey(name: 'completed') final bool isCompleted,
      final bool enableNotification,
      final bool isPinned}) = _$TaskDtoImpl;
  _TaskDto._() : super._();

  factory _TaskDto.fromJson(Map<String, dynamic> json) = _$TaskDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  @JsonKey(name: 'userId')
  int get associatedUserId;
  @override
  String? get description;
  @override
  @StringToDateTimeConverter()
  DateTime? get scheduledDateTime;
  @override
  String? get color;
  @override
  @JsonKey(name: 'completed')
  bool get isCompleted;
  @override
  bool get enableNotification;
  @override
  bool get isPinned;

  /// Create a copy of TaskDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskDtoImplCopyWith<_$TaskDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
