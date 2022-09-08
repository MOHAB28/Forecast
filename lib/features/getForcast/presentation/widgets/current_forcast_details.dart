import 'package:flutter/material.dart';


class CurrentForcastDetailsWidget extends StatelessWidget {
  final String title;
  final String details;
  const CurrentForcastDetailsWidget({
    Key? key,
    required this.details,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 8.0),
        Text(
          details,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }
}
