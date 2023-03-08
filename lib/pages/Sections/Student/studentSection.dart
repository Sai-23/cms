import 'package:flutter/material.dart';

class studentSection extends StatefulWidget {
  const studentSection({
    Key? key,
  }) : super(key: key);

  @override
  State<studentSection> createState() => _studentSectionState();
}

class _studentSectionState extends State<studentSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/addStudent');
          },
          child: Text('Add'),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text('View'),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text('Update'),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text('Delete'),
        )
      ],
    );
  }
}
