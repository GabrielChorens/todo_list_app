import 'package:flutter/material.dart';
import 'package:todo_list_app/core/shared/ui/extensions/extensions.dart';
import 'package:todo_list_app/features/theming/themes/theme_interface.dart';

class ThemeItem extends StatelessWidget {
  const ThemeItem({
    required this.theme,
    required this.isSelected,
    required this.onThemeSelected,
    required this.onImageTap,
    super.key,
  });
  final ThemeInterface theme;
  final bool isSelected;
  final VoidCallback onThemeSelected;
  final void Function(int) onImageTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isSelected ? context.colors.secondary : context.colors.surface,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(theme.name, style: Theme.of(context).textTheme.titleMedium),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () => onImageTap(1),
                  child: Image.asset(
                    'assets/themes/${theme.keyName}_1.png',
                    width: 100,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => onImageTap(2),
                  child: Image.asset(
                    'assets/themes/${theme.keyName}_2.png',
                    width: 100,
                  ),
                ),
              ],
            ),
          ],
        ),
        // leading:
        //     Text(theme.name, style: Theme.of(context).textTheme.titleMedium),
        trailing: Checkbox(
          value: isSelected,
          onChanged: (value) {
            if (value ?? false) {
              onThemeSelected();
            }
          },
        ),
      ),
    );
  }
}
