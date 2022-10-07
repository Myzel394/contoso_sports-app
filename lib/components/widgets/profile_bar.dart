import 'dart:math';

import 'package:avatar_view/avatar_view.dart';
import 'package:contoso_sports/utils/theme.dart';
import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../foreign_types/user.dart';

class ProfileBar extends StatelessWidget {
  final User user;

  const ProfileBar({required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      material: (_, __) => ListTile(
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
      ),
      cupertino: (_, __) => CupertinoListTile(
        title: Text("${user.firstName} ${user.lastName}"),
        subtitle: Text(user.nickname),
        leading: SizedBox(
          width: 50,
          height: 50,
          child: Material(
            child: AvatarView(
              avatarType: AvatarType.CIRCLE,
              imagePath: user.picturePath,
            ),
          ),
        ),
        trailing: Wrap(
          direction: Axis.horizontal,
          children: [
            Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  Random.secure().nextInt(900).toString(),
                  style: getBodyTextTextStyle(context),
                ),
                const SizedBox(width: 4),
                Icon(Icons.flag),
              ],
            ),
            const SizedBox(width: 12),
            Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  Random.secure().nextInt(900).toString(),
                  style: getBodyTextTextStyle(context),
                ),
                const SizedBox(width: 4),
                Icon(Icons.star, color: Color(0xFFFFD300)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
