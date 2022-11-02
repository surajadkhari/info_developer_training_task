import 'package:flutter/material.dart';
import '../dashboard/dashboard.dart';
import '../theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const Dashboard(), theme: appTheme());
  }
}
