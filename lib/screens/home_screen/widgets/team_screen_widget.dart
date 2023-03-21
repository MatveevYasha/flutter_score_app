import 'package:flutter/material.dart';
import 'package:flutter_score_app/utils/styles.dart';

class TeamScreenWidget extends StatelessWidget {
  const TeamScreenWidget({
    super.key,
    required this.teamOneScore,
    required this.color,
  });

  final String teamOneScore;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        height: double.infinity,
        color: color,
        child: Center(
            child: Text(
          teamOneScore,
          style: Style.score,
        )),
      ),
    );
  }
}
