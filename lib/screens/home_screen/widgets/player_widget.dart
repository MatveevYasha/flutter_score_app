import 'package:flutter/material.dart';
import 'package:flutter_score_app/domain/player_model.dart';
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
          child: Container(
            height: 100,
            color: Style.colorGreyScore,
            child: Stack(
              children: [
                Positioned(
                  top: 5,
                  left: 5,
                  child: GestureDetector(
                    onTap: reset
                    // добавить всплывающее окно перед сбросом "Вы точно хотите
                    //сбросить очки игрока?"
                    ,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Style.colorPurple),
                      child: Icon(
                        Icons.refresh,
                        color: Style.colorWhite,
                      ),
                    ),
                  ),
                ),
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
