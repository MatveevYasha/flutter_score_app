// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:custom_timer/custom_timer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_score_app/generated/locale_keys.g.dart';
import 'package:provider/provider.dart';

import 'package:flutter_score_app/domain/player_model.dart';
import 'package:flutter_score_app/screens/home_screen/widgets/divider_widget.dart';
import 'package:flutter_score_app/screens/home_screen/widgets/play_toggler_widget.dart';
import 'package:flutter_score_app/screens/home_screen/widgets/player_widget.dart';
import 'package:flutter_score_app/screens/home_screen/widgets/team_screen_widget.dart';
import 'package:flutter_score_app/screens/home_screen/widgets/timer_zone_widget.dart';
import 'package:flutter_score_app/utils/styles.dart';

class HomeScreen extends StatefulWidget {
  int? minutes;
  HomeScreen({
    Key? key,
    this.minutes,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  bool playToggle = false;
  bool finishGame = false;
  late int _minutes;

  @override
  void initState() {
    if (widget.minutes != null) {
      _minutes = widget.minutes!;
    } else {
      _minutes = 30;
    }
    _controller.state.addListener(() {
      if (_controller.state.value == CustomTimerState.finished) {
        setState(() {
          finishGame = true;
        });
      }
    });
    super.initState();
  }

  late final CustomTimerController _controller = CustomTimerController(
      vsync: this,
      begin: Duration(minutes: _minutes),
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
    final teamOneScore = (teamOnePlayerOneScoreVar + teamOnePlayerTwoScoreVar);
    // team two
    final teamTwoPlayerOneScoreVar =
        context.watch<PlayerModel>().teamTwoPlayerOneScore;
    final teamTwoPlayerTwoScoreVar =
        context.watch<PlayerModel>().teamTwoPlayerTwoScore;
    final teamTwoScore = (teamTwoPlayerOneScoreVar + teamTwoPlayerTwoScoreVar);

    return Scaffold(
        body: Center(
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TeamScreenWidget(
                teamOneScore: '$teamOneScore',
                color: Style.colorRed,
              ),
              TeamScreenWidget(
                teamOneScore: '$teamTwoScore',
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
                  playerName: LocaleKeys.player_one.tr(),
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
                  playerName: LocaleKeys.player_two.tr(),
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
                  playerName: LocaleKeys.player_one.tr(),
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
                  playerName: LocaleKeys.player_two.tr(),
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
          Positioned(
            top: 10,
            left: 20,
            child: Text(
              LocaleKeys.team_one.tr(),
              style: Style.teamName,
            ),
          ),
          Positioned(
            top: 10,
            right: 20,
            child: Text(
              LocaleKeys.team_two.tr(),
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
          ),
          Center(
            child: (finishGame == true)
                ? BackdropFilter(
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
                            onPressed: () {
                              setState(() {
                                finishGame = false;
                              });
                            },
                            child: Text('Посмотреть результаты')),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                finishGame = false;
                                _controller.reset();
                                model.resetTeamOnePlayerOneScore();
                                model.resetTeamOnePlayerTwoScore();
                                model.resetTeamTwoPlayerOneScore();
                                model.resetTeamTwoPlayerTwoScore();
                                playToggle = !playToggle;
                              });
                            },
                            child: Text('Начать заново')),
                      ],
                    ),
                  )
                : PlayTogglerWidget(
                    playToggle: playToggle,
                    onTab: () {
                      setState(() {
                        playToggle = !playToggle;
                        if (_controller.state.value ==
                            CustomTimerState.counting) {
                          _controller.pause();
                        } else {
                          _controller.start();
                        }
                      });
                    },
                  ),
          ),
        ],
      ),
    ));
  }
}
