import 'package:flutter/material.dart';

class TimelineScreen extends StatelessWidget {
  const TimelineScreen({super.key});

  static const String routeName = "/timeline";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("TimelineScreen")),
    );
  }
}
