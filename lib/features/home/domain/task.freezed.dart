// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Task {
  int get associatedUserId => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime? get scheduledDateTime => throw _privateConstructorUsedError;
  TaskColor? get color => throw _privateConstructorUsedError;
  bool get isCompleted =>
      throw _privateConstructorUsedError; // This value may seem confusing, but since the task is not deleted from the database, we
// need to keep track of whether it was erased or not. So, when the user erases a task,
// and then poll the database we don't want to show the erased task.
  bool get isErased => throw _privateConstructorUsedError;
  bool get enableNotification => throw _privateConstructorUsedError;
  bool get isPinned => throw _privateConstructorUsedError;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call(
      {int associatedUserId,
      int id,
      String title,
      String? description,
      DateTime? scheduledDateTime,
      TaskColor? color,
      bool isCompleted,
      bool isErased,
      bool enableNotification,
      bool isPinned});
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? associatedUserId = null,
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? scheduledDateTime = freezed,
    Object? color = freezed,
    Object? isCompleted = null,
    Object? isErased = null,
    Object? enableNotification = null,
    Object? isPinned = null,
  }) {
    return _then(_value.copyWith(
      associatedUserId: null == associatedUserId
          ? _value.associatedUserId
          : associatedUserId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
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
              as TaskColor?,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isErased: null == isErased
          ? _value.isErased
          : isErased // ignore: cast_nullable_to_non_nullable
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
abstract class _$$TaskImplCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$TaskImplCopyWith(
          _$TaskImpl value, $Res Function(_$TaskImpl) then) =
      __$$TaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int associatedUserId,
      int id,
      String title,
      String? description,
      DateTime? scheduledDateTime,
      TaskColor? color,
      bool isCompleted,
      bool isErased,
      bool enableNotification,
      bool isPinned});
}

/// @nodoc
class __$$TaskImplCopyWithImpl<$Res>
    extends _$TaskCopyWithImpl<$Res, _$TaskImpl>
    implements _$$TaskImplCopyWith<$Res> {
  __$$TaskImplCopyWithImpl(_$TaskImpl _value, $Res Function(_$TaskImpl) _then)
      : super(_value, _then);

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? associatedUserId = null,
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? scheduledDateTime = freezed,
    Object? color = freezed,
    Object? isCompleted = null,
    Object? isErased = null,
    Object? enableNotification = null,
    Object? isPinned = null,
  }) {
    return _then(_$TaskImpl(
      associatedUserId: null == associatedUserId
          ? _value.associatedUserId
          : associatedUserId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
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
              as TaskColor?,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isErased: null == isErased
          ? _value.isErased
          : isErased // ignore: cast_nullable_to_non_nullable
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

class _$TaskImpl extends _Task {
  _$TaskImpl(
      {required this.associatedUserId,
      required this.id,
      required this.title,
      this.description,
      this.scheduledDateTime,
      this.color,
      this.isCompleted = false,
      this.isErased = false,
      this.enableNotification = false,
      this.isPinned = false})
      : super._();

  @override
  final int associatedUserId;
  @override
  final int id;
  @override
  final String title;
  @override
  final String? description;
  @override
  final DateTime? scheduledDateTime;
  @override
  final TaskColor? color;
  @override
  @JsonKey()
  final bool isCompleted;
// This value may seem confusing, but since the task is not deleted from the database, we
// need to keep track of whether it was erased or not. So, when the user erases a task,
// and then poll the database we don't want to show the erased task.
  @override
  @JsonKey()
  final bool isErased;
  @override
  @JsonKey()
  final bool enableNotification;
  @override
  @JsonKey()
  final bool isPinned;

  @override
  String toString() {
    return 'Task(associatedUserId: $associatedUserId, id: $id, title: $title, description: $description, scheduledDateTime: $scheduledDateTime, color: $color, isCompleted: $isCompleted, isErased: $isErased, enableNotification: $enableNotification, isPinned: $isPinned)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskImpl &&
            (identical(other.associatedUserId, associatedUserId) ||
                other.associatedUserId == associatedUserId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.scheduledDateTime, scheduledDateTime) ||
                other.scheduledDateTime == scheduledDateTime) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.isErased, isErased) ||
                other.isErased == isErased) &&
            (identical(other.enableNotification, enableNotification) ||
                other.enableNotification == enableNotification) &&
            (identical(other.isPinned, isPinned) ||
                other.isPinned == isPinned));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      associatedUserId,
      id,
      title,
      description,
      scheduledDateTime,
      color,
      isCompleted,
      isErased,
      enableNotification,
      isPinned);

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      __$$TaskImplCopyWithImpl<_$TaskImpl>(this, _$identity);
}

abstract class _Task extends Task {
  factory _Task(
      {required final int associatedUserId,
      required final int id,
      required final String title,
      final String? description,
      final DateTime? scheduledDateTime,
      final TaskColor? color,
      final bool isCompleted,
      final bool isErased,
      final bool enableNotification,
      final bool isPinned}) = _$TaskImpl;
  _Task._() : super._();

  @override
  int get associatedUserId;
  @override
  int get id;
  @override
  String get title;
  @override
  String? get description;
  @override
  DateTime? get scheduledDateTime;
  @override
  TaskColor? get color;
  @override
  bool
      get isCompleted; // This value may seem confusing, but since the task is not deleted from the database, we
// need to keep track of whether it was erased or not. So, when the user erases a task,
// and then poll the database we don't want to show the erased task.
  @override
  bool get isErased;
  @override
  bool get enableNotification;
  @override
  bool get isPinned;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
