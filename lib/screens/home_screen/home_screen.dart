// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_score_app/screens/home_screen/widgets/divider_widget.dart';
import 'package:flutter_score_app/screens/home_screen/widgets/play_toggler_widget.dart';
import 'package:flutter_score_app/screens/home_screen/widgets/player_widget.dart';
import 'package:flutter_score_app/screens/home_screen/widgets/team_screen_widget.dart';
import 'package:flutter_score_app/screens/home_screen/widgets/timer_zone_widget.dart';
import 'package:provider/provider.dart';

import 'package:flutter_score_app/domain/player_model.dart';
import 'package:flutter_score_app/utils/styles.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  bool playToggle = false;

  late final CustomTimerController _controller = CustomTimerController(
      vsync: this,
      begin: Duration(minutes: 30),
      end: const Duration(seconds: 0),
      initialState: CustomTimerState.reset,
      interval: CustomTimerInterval.seconds);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // team one
    final model = context.read<PlayerModel>();
    final teamOnePlayerOneScoreVar =
        context.watch<PlayerModel>().teamOnePlayerOneScore;
    final teamOnePlayerTwoScoreVar =
        context.watch<PlayerModel>().teamOnePlayerTwoScore;
    final teamOneScore =
        (teamOnePlayerOneScoreVar + teamOnePlayerTwoScoreVar).toString();
    // team two
    final teamTwoPlayerOneScoreVar =
        context.watch<PlayerModel>().teamTwoPlayerOneScore;
    final teamTwoPlayerTwoScoreVar =
        context.watch<PlayerModel>().teamTwoPlayerTwoScore;
    final teamTwoScore =
        (teamTwoPlayerOneScoreVar + teamTwoPlayerTwoScoreVar).toString();

    return Scaffold(
        body: Center(
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TeamScreenWidget(
                teamOneScore: teamOneScore,
                color: Style.colorRed,
              ),
              TeamScreenWidget(
                teamOneScore: teamTwoScore,
                color: Style.colorBlack,
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                PlayerWidget(
                  model: model,
                  teamOnePlayerOneScoreVar: teamOnePlayerOneScoreVar,
                  playerName: 'Игрок 1',
                  increment: () {
                    model.incrementTeamOnePlayerOneScore();
                  },
                  reset: () {
                    model.resetTeamOnePlayerOneScore();
                  },
                  decrement: (context) {
                    model.decrementTeamOnePlayerOneScore();
                  },
                  playerScore: teamOnePlayerOneScoreVar,
                ),
                const DividerWidget(),
                PlayerWidget(
                  model: model,
                  teamOnePlayerOneScoreVar: teamOnePlayerOneScoreVar,
                  playerName: 'Игрок 2',
                  increment: () {
                    model.incrementTeamOnePlayerTwoScore();
                  },
                  reset: () {
                    model.resetTeamOnePlayerTwoScore();
                  },
                  decrement: (context) {
                    model.decrementTeamOnePlayerTwoScore();
                  },
                  playerScore: teamOnePlayerTwoScoreVar,
                ),
                const DividerWidget(),
                PlayerWidget(
                  model: model,
                  teamOnePlayerOneScoreVar: teamOnePlayerOneScoreVar,
                  playerName: 'Игрок 1',
                  increment: () {
                    model.incrementTeamTwoPlayerOneScore();
                  },
                  reset: () {
                    model.resetTeamTwoPlayerOneScore();
                  },
                  decrement: (context) {
                    model.decrementTeamTwoPlayerOneScore();
                  },
                  playerScore: teamTwoPlayerOneScoreVar,
                ),
                const DividerWidget(),
                PlayerWidget(
                  model: model,
                  teamOnePlayerOneScoreVar: teamOnePlayerOneScoreVar,
                  playerName: 'Игрок 2',
                  increment: () {
                    model.incrementTeamTwoPlayerTwoScore();
                  },
                  reset: () {
                    model.resetTeamTwoPlayerTwoScore();
                  },
                  decrement: (context) {
                    model.decrementTeamTwoPlayerTwoScore();
                  },
                  playerScore: teamTwoPlayerTwoScoreVar,
                ),
              ],
            ),
          ),
          Center(
            child: PlayTogglerWidget(
              playToggle: playToggle,
              onTab: () {
                setState(() {
                  playToggle = !playToggle;
                  if (_controller.state.value == CustomTimerState.counting) {
                    _controller.pause();
                  } else {
                    _controller.start();
                  }
                });
              },
            ),
          ),
          Positioned(
            top: 10,
            left: 20,
            child: Text(
              'Команда 1',
              style: Style.teamName,
            ),
          ),
          Positioned(
            top: 10,
            right: 20,
            child: Text(
              'Команда 2',
              style: Style.teamName,
            ),
          ),
          SafeArea(
            child: Row(
              children: [
                const Spacer(),
                TimerZoneWidget(controller: _controller),
                const Spacer(),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
