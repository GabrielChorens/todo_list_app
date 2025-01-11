import 'package:flutter/material.dart';
import 'package:todo_list_app/core/shared/domain/entities/user.dart';
import 'package:todo_list_app/features/profile/ui/widgets/profile_picture_circle_avatar.dart';

class UserListItem extends StatelessWidget {
  const UserListItem({required this.user, super.key});

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ProfilePictureCircleAvatar(
        imageUrl: user.photoUrl,
        height: 50,
      ),
      title: Text('${user.name} ${user.lastName}'),
      subtitle: Text(user.email ?? ''),
    );
  }
}
