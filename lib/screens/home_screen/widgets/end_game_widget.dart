import 'dart:ui';

import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_score_app/domain/player_model.dart';

class EndGameWidget extends StatelessWidget {
  EndGameWidget({
    super.key,
    required this.teamOneScore,
    required this.teamTwoScore,
    required CustomTimerController controller,
    required this.model,
    required this.leftOnTab,
    required this.rightOnTab,
  }) : _controller = controller;

  final int teamOneScore;
  final int teamTwoScore;
  final CustomTimerController _controller;
  final PlayerModel model;
  void Function() leftOnTab;
  void Function() rightOnTab;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: AlertDialog(
        title: Text('Игра закончилась'),
        content: (teamOneScore > teamTwoScore == true)
            ? Text('Победила команда 1')
            : (teamOneScore < teamTwoScore == true)
                ? Text('Победила команда 2')
                : Text('Ничья'),
        actions: [
          TextButton(
              onPressed: leftOnTab, child: Text('Посмотреть результаты')),
          TextButton(onPressed: rightOnTab, child: Text('Начать заново')),
        ],
      ),
    );
  }
}
