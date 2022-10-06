import 'package:flutter/material.dart';

import '../../utils/theme.dart';

class ModalSheet extends StatelessWidget {
  final Widget child;

  const ModalSheet({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        color: getSheetColor(context),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 16,
          left: 8,
          right: 8,
          bottom: 4,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            child,
          ],
        ),
      ),
    );
  }
}
