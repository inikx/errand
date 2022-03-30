import 'package:flutter/material.dart';

class ProjectDetails extends StatelessWidget {
  int id;
  ProjectDetails({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(child: Text(id.toString())),
    ));
  }
}
