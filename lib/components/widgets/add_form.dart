import 'package:contoso_sports/api/add-challenge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

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
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final difficultyController = TextEditingController();
  final pointsController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    difficultyController.dispose();
    pointsController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Add Challenge',
          style: getTitleTextStyle(context),
        ),
        const SizedBox(height: 22),
        PlatformTextField(
          controller: titleController,
          material: (_, __) => MaterialTextFieldData(
            decoration: InputDecoration(
              icon: Icon(Icons.title),
              labelText: 'Title',
            ),
          ),
        ),
        const SizedBox(height: 16),
        PlatformTextField(
          controller: descriptionController,
          material: (_, __) => MaterialTextFieldData(
            decoration: InputDecoration(
              icon: Icon(Icons.description),
              labelText: 'Description',
            ),
          ),
        ),
        const SizedBox(height: 16),
        PlatformTextField(
          controller: difficultyController,
          material: (_, __) => MaterialTextFieldData(
            decoration: InputDecoration(
              icon: Icon(Icons.ac_unit),
              labelText: 'Difficulty',
            ),
          ),
        ),
        const SizedBox(height: 16),
        PlatformTextField(
          controller: pointsController,
          material: (_, __) => MaterialTextFieldData(
            decoration: InputDecoration(
              icon: Icon(Icons.star),
              labelText: 'Points',
            ),
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
              onPressed: () async {
                await addChallenge(
                  titleController.text,
                  descriptionController.text,
                  DateTime.now(),
                  DateTime.now(),
                  int.parse(difficultyController.text),
                  int.parse(pointsController.text),
                );
                widget.onClose();
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ],
    );
  }
}
