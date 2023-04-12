import 'dart:ui';

import 'package:custom_timer/custom_timer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_score_app/domain/player_model.dart';
import 'package:flutter_score_app/generated/locale_keys.g.dart';

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
        title: Text(LocaleKeys.game_over.tr()),
        content: (teamOneScore > teamTwoScore == true)
            ? Text(LocaleKeys.team_one_won.tr())
            : (teamOneScore < teamTwoScore == true)
                ? Text(LocaleKeys.team_two_won.tr())
                : Text(LocaleKeys.game_ended_draw.tr()),
        actions: [
          TextButton(
              onPressed: leftOnTab, child: Text(LocaleKeys.view_results.tr())),
          TextButton(
              onPressed: rightOnTab, child: Text(LocaleKeys.start_over.tr())),
        ],
      ),
    );
  }
}
