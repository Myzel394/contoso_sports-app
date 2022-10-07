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
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        color: getSheetColor(context),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 32,
          left: 16,
          right: 16,
          bottom: 4,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            child,
            SizedBox(
              height: MediaQuery.of(context).viewInsets.bottom,
            ),
          ],
        ),
      ),
    );
  }
}
