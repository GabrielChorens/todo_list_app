import 'package:freezed_annotation/freezed_annotation.dart';

class StringToDateTimeConverter implements JsonConverter<DateTime?, String?> {
  const StringToDateTimeConverter();

  @override
  DateTime? fromJson(String? value) {
    if (value != null) {
      return DateTime.tryParse(value);
    }
    return null;
  }

  @override
  String? toJson(DateTime? value) {
    if (value != null) {
      return value.toIso8601String();
    }
    return null;
  }
}

extension ObjectParserX on Object {
  Map<String, dynamic> parseToMap({
    String? exceptionLocation = 'DTO',
  }) {
    try {
      return this as Map<String, dynamic>;
    } catch (e) {
      return {};
    }
  }

  List<dynamic> parseToList({
    String? exceptionLocation = 'DTO',
  }) {
    try {
      return this as List;
    } catch (e) {
      return [];
    }
  }

  Map<String, dynamic>? tryParseToMap({
    String? exceptionLocation = 'DTO',
  }) {
    try {
      return this as Map<String, dynamic>?;
    } catch (e) {
      return null;
    }
  }
}
