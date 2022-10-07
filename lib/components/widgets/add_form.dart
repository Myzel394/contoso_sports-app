import 'package:flutter/material.dart';

import '../../utils/theme.dart';

class AddForm extends StatefulWidget {
  final VoidCallback onClose;

  const AddForm({
    required this.onClose,
    Key? key,
  }) : super(key: key);

  @override
  State<AddForm> createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Add Challenge',
          style: getTitleTextStyle(context),
        ),
        const SizedBox(height: 22),
        const TextField(
          decoration: InputDecoration(
            icon: Icon(Icons.title),
            labelText: 'Title',
          ),
        ),
        const SizedBox(height: 16),
        const TextField(
          decoration: InputDecoration(
            icon: Icon(Icons.description),
            labelText: 'Description',
          ),
        ),
        const SizedBox(height: 16),
        const TextField(
          decoration: InputDecoration(
            icon: Icon(Icons.ac_unit),
            labelText: 'Difficulty',
          ),
        ),
        const SizedBox(height: 16),
        const TextField(
          decoration: InputDecoration(
            icon: Icon(Icons.star),
            labelText: 'Points',
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: widget.onClose,
              child: const Text('Cancel'),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Add'),
            ),
          ],
        ),
      ],
    );
  }
}
