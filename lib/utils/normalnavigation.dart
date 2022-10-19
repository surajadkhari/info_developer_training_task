import 'package:flutter/cupertino.dart';

void letsgo({required BuildContext context, required Widget screen}) {
  Navigator.of(context).push(
    CupertinoPageRoute(
      builder: (context) => screen,
    ),
  );
}
