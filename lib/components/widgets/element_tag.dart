import 'package:flutter/cupertino.dart';

import '../../foreign_types/tag.dart';

class ElementTag extends StatelessWidget {
  final Tag tag;

  const ElementTag({required this.tag, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: tag.color,
          width: 2,
        ),
        color: tag.color.withOpacity(0.2),
      ),
      child: Text(tag.name),
    );
  }
}
