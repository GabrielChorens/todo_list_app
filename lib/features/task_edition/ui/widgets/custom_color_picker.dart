import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:todo_list_app/features/home/domain/value_objects/task_color.dart';
import 'package:todo_list_app/features/task_edition/ui/utils/utils.dart';

class CustomColorPicker extends FormBuilderField<TaskColor> {
  CustomColorPicker({
    required TaskColor initialValue,
    super.key,
    super.onChanged,
    bool enabled = true,
  }) : super(
          name: colorFieldName,
          initialValue: initialValue,
          builder: (FormFieldState<TaskColor?> field) {
            return Wrap(
              spacing: 10,
              children: [
                ...TaskColor.values.map((color) {
                  return ColorCircle(
                    color: color.color,
                    isSelected: color == field.value,
                    onTap: enabled
                        ? () {
                            field.didChange(color);
                          }
                        : null,
                  );
                }),
              ],
            );
          },
        );

  @override
  FormBuilderFieldState<CustomColorPicker, TaskColor> createState() =>
      _CustomColorPickerState();
}

class _CustomColorPickerState
    extends FormBuilderFieldState<CustomColorPicker, TaskColor> {}

class ColorCircle extends StatelessWidget {
  const ColorCircle({
    required this.color,
    required this.isSelected,
    this.onTap,
    super.key,
  });

  final Color color;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.black38,
          ),
        ),
        child: CircleAvatar(
          backgroundColor: color,
          radius: 20,
          child: isSelected
              ? const Icon(Icons.check, color: Colors.black38)
              : null,
        ),
      ),
    );
  }
}
