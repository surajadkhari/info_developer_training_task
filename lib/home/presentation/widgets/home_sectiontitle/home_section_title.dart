import 'package:flutter/material.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading(
      {Key? key,
      required this.leftHeading,
      required this.rightHeading,
      required this.onPressed})
      : super(key: key);
  final String rightHeading;
  final String leftHeading;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leftHeading,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(rightHeading),
        )
      ],
    );
  }
}
