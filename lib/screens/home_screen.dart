import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_score_app/domain/player_model.dart';
import 'package:flutter_score_app/utils/styles.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  bool playToggle = false;

  late final CustomTimerController _controller = CustomTimerController(
      vsync: this,
      begin: const Duration(minutes: 30),
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
              Expanded(
                flex: 1,
                child: Container(
                  height: double.infinity,
                  color: Style.colorRed,
                  child: Center(
                      child: Text(
                    teamOneScore,
                    style: Style.score,
                  )),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: double.infinity,
                  color: Style.colorBlack,
                  child: Center(
                      child: Text(
                    teamTwoScore,
                    style: Style.score,
                  )),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Slidable(
                    closeOnScroll: false,
                    endActionPane: ActionPane(
                      extentRatio: 0.4,
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: ((context) {
                            model.decrementTeamOnePlayerOneScore();
                          }),
                          backgroundColor: Style.colorRed,
                          foregroundColor: Style.colorWhite,
                          icon: Icons.remove,
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        model.incrementTeamOnePlayerOneScore();
                      },
                      child: Container(
                        height: 100,
                        color: Style.colorGreyScore,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 5,
                              left: 5,
                              child: GestureDetector(
                                onTap: () {
                                  model.resetTeamOnePlayerOneScore();
                                  // добавить всплывающее окно перед сбросом "Вы точно хотите
                                  //сбросить очки игрока?"
                                },
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
                                      'Игрок 1',
                                      style: Style.playerName,
                                    ),
                                  ),
                                  Text(
                                    teamOnePlayerOneScoreVar.toString(),
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
                ),
                const DeviderWidget(),
                Expanded(
                  flex: 1,
                  child: Slidable(
                    closeOnScroll: false,
                    endActionPane: ActionPane(
                      extentRatio: 0.4,
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: ((context) {
                            model.decrementTeamOnePlayerTwoScore();
                          }),
                          backgroundColor: Style.colorRed,
                          foregroundColor: Style.colorWhite,
                          icon: Icons.remove,
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        model.incrementTeamOnePlayerTwoScore();
                      },
                      child: Container(
                        height: 100,
                        color: Style.colorGreyScore,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 5,
                              left: 5,
                              child: GestureDetector(
                                onTap: () {
                                  model.resetTeamOnePlayerTwoScore();
                                  // добавить всплывающее окно перед сбросом "Вы точно хотите
                                  //сбросить очки игрока?"
                                },
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
                                      'Игрок 2',
                                      style: Style.playerName,
                                    ),
                                  ),
                                  Text(
                                    teamOnePlayerTwoScoreVar.toString(),
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
                ),
                const DeviderWidget(),
                Expanded(
                  flex: 1,
                  child: Slidable(
                    closeOnScroll: false,
                    endActionPane: ActionPane(
                      extentRatio: 0.4,
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: ((context) {
                            model.decrementTeamTwoPlayerOneScore();
                          }),
                          backgroundColor: Style.colorRed,
                          foregroundColor: Style.colorWhite,
                          icon: Icons.remove,
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        model.incrementTeamTwoPlayerOneScore();
                      },
                      child: Container(
                        height: 100,
                        color: Style.colorGreyScore,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 5,
                              left: 5,
                              child: GestureDetector(
                                onTap: () {
                                  model.resetTeamTwoPlayerOneScore();
                                  // добавить всплывающее окно перед сбросом "Вы точно хотите
                                  //сбросить очки игрока?"
                                },
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
                                      'Игрок 1',
                                      style: Style.playerName,
                                    ),
                                  ),
                                  Text(
                                    teamTwoPlayerOneScoreVar.toString(),
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
                ),
                const DeviderWidget(),
                Expanded(
                  flex: 1,
                  child: Slidable(
                    closeOnScroll: false,
                    endActionPane: ActionPane(
                      extentRatio: 0.4,
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: ((context) {
                            model.decrementTeamTwoPlayerTwoScore();
                          }),
                          backgroundColor: Style.colorRed,
                          foregroundColor: Style.colorWhite,
                          icon: Icons.remove,
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        model.incrementTeamTwoPlayerTwoScore();
                      },
                      child: Container(
                        height: 100,
                        color: Style.colorGreyScore,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 5,
                              left: 5,
                              child: GestureDetector(
                                onTap: () {
                                  model.resetTeamTwoPlayerTwoScore();
                                  // добавить всплывающее окно перед сбросом "Вы точно хотите
                                  //сбросить очки игрока?"
                                },
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
                                      'Игрок 2',
                                      style: Style.playerName,
                                    ),
                                  ),
                                  Text(
                                    teamTwoPlayerTwoScoreVar.toString(),
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
                ),
              ],
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  playToggle = !playToggle;
                  if (_controller.state.value == CustomTimerState.counting) {
                    _controller.pause();
                  } else {
                    _controller.start();
                  }
                });
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: Style.colorWhite, width: 10),
                  borderRadius: BorderRadius.circular(50),
                  color: playToggle ? Style.colorGreen : Style.colorYellow,
                ),
                child: Icon(
                  playToggle ? Icons.pause : Icons.play_arrow,
                  size: 40,
                  color: Style.colorWhite,
                ),
              ),
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
                Slidable(
                  closeOnScroll: false,
                  endActionPane: ActionPane(
                    extentRatio: 0.4,
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: ((context) {
                          Navigator.of(context)
                              .pushNamed('/screens/setting_screen');
                        }),
                        backgroundColor: Style.colorGrey,
                        foregroundColor: Style.colorWhite,
                        icon: Icons.settings,
                      ),
                    ],
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Style.colorGreyScore,
                    ),
                    height: 75,
                    width: 300,
                    child: Center(
                      child: CustomTimer(
                          controller: _controller,
                          builder: (state, remaining) {
                            return Text(
                                "${remaining.minutes}:${remaining.seconds}",
                                style: Style.playerScore);
                          }),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          )
        ],
      ),
    ));
  }
}

class DeviderWidget extends StatelessWidget {
  const DeviderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 1,
      color: Style.colorBlack,
    );
  }
}
