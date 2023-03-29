import 'package:flutter/material.dart';
import 'package:flutter_score_app/utils/styles.dart';

class TeamName extends StatelessWidget {
  String text;
  TeamName({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Style.teamName,
    );
  }
}
