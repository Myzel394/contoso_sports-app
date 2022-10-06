import 'dart:math';

import 'package:avatar_view/avatar_view.dart';
import 'package:flutter/material.dart';

import '../../foreign_types/user.dart';

class ProfileBar extends StatelessWidget {
  final User user;

  const ProfileBar({required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("${user.firstName} ${user.lastName}"),
      subtitle: Text(user.nickname),
      leading: SizedBox(
        width: 50,
        height: 50,
        child: AvatarView(
          avatarType: AvatarType.CIRCLE,
          imagePath: user.picturePath,
        ),
      ),
      trailing: Wrap(
        direction: Axis.horizontal,
        children: [
          Wrap(
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(Random.secure().nextInt(900).toString()),
              const SizedBox(width: 4),
              Icon(Icons.flag),
            ],
          ),
          const SizedBox(width: 12),
          Wrap(
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(Random.secure().nextInt(900).toString()),
              const SizedBox(width: 4),
              Icon(Icons.star, color: Color(0xFFFFD300)),
            ],
          ),
        ],
      ),
    );
  }
}
