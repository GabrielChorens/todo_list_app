import 'package:freezed_annotation/freezed_annotation.dart';

/// A converter that converts a nullable string to a nullable integer.
class StringToNullableIntConverter implements JsonConverter<int?, String?> {
  const StringToNullableIntConverter();

  @override
  int? fromJson(String? value) {
    if (value != null) {
      return int.tryParse(value);
    }
    return null;
  }

  @override
  String toJson(int? value) => value.toString();
}
