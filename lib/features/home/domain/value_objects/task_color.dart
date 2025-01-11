import 'dart:ui';

enum TaskColor {
  white(Color(0xFFFFFFFF)),
  pastelPeach(Color(0xFFFBEEE6)),
  lemonChiffon(Color(0xFFFFFACD)),
  lightCyan(Color(0xFFE0FFFF)),
  lavender(Color(0xFFE6E6FA)),
  thistle(Color(0xFFD8BFD8)),
  lightPink(Color(0xFFFFB6C1)),
  lavenderBlush(Color(0xFFFFF0F5)),
  khaki(Color(0xFFF0E68C)),
  powderBlue(Color(0xFFB0E0E6));

  const TaskColor(this.color);

  final Color color;

  static TaskColor fromJson(String colorName) {
    return TaskColor.values.firstWhere((element) => element.name == colorName);
  }

  String toJson() {
    return name;
  }
}
