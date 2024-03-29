import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_score_app/domain/player_model.dart';
import 'package:flutter_score_app/generated/locale_keys.g.dart';
import 'package:flutter_score_app/utils/styles.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class PlayerWidget extends StatelessWidget {
  PlayerWidget({
    Key? key,
    required this.model,
    required this.teamOnePlayerOneScoreVar,
    required this.playerName,
    required this.playerScore,
    required this.increment,
    required this.reset,
    required this.decrement,
  }) : super(key: key);

  final PlayerModel model;
  final int teamOnePlayerOneScoreVar;
  final String playerName;
  void Function() increment;
  void Function() reset;
  void Function(BuildContext) decrement;
  final int playerScore;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Slidable(
        closeOnScroll: false,
        endActionPane: ActionPane(
          extentRatio: 0.4,
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: decrement,
              backgroundColor: Style.colorRed,
              foregroundColor: Style.colorWhite,
              icon: Icons.remove,
            ),
          ],
        ),
        child: GestureDetector(
          onTap: increment,
          onLongPress: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text(LocaleKeys.sure_to_reset_player_points.tr()),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(LocaleKeys.no.tr()),
                ),
                TextButton(
                  onPressed: reset,
                  child: Text(LocaleKeys.yes.tr()),
                ),
              ],
            ),
          ),
          child: Container(
            height: 100,
            color: Style.colorGreyScore,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          playerName,
                          style: Style.playerName,
                        ),
                      ),
                      Text(
                        playerScore.toString(),
                        style: Style.playerScore,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
