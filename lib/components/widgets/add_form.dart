import 'package:flutter/material.dart';

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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text('Add Challenge'),
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: widget.onClose,
            ),
          ],
        ),
        const SizedBox(height: 16),
        TextField(
          decoration: const InputDecoration(
            labelText: 'Title',
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          decoration: const InputDecoration(
            labelText: 'Description',
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          decoration: const InputDecoration(
            labelText: 'Difficulty',
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          decoration: const InputDecoration(
            labelText: 'Points',
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Add'),
        ),
      ],
    );
  }
}
