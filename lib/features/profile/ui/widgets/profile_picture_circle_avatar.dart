import 'package:flutter/material.dart';

class ProfilePictureCircleAvatar extends StatelessWidget {
  const ProfilePictureCircleAvatar({super.key, this.imageUrl, this.height});
  final String? imageUrl;

  final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 100,
      child: CircleAvatar(
        radius: 50,
        backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
        child: imageUrl == null
            ? const Icon(
                Icons.person,
                size: 50,
              )
            : null,
      ),
    );
  }
}
