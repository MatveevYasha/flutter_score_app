// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_score_app/screens/home_screen/home_screen.dart';
import 'package:flutter_score_app/screens/setting_screen/widgets/button.dart';
import 'package:flutter_score_app/screens/setting_screen/widgets/player_string.dart';
import 'package:flutter_score_app/screens/setting_screen/widgets/team_name.dart';
import 'package:provider/provider.dart';

import 'package:flutter_score_app/domain/player_model.dart';
import 'package:flutter_score_app/utils/styles.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  List list = [5, 10, 15, 20, 30];
  int selectedIndex = 4;
  int _minutes = 30;

  @override
  Widget build(BuildContext context) {
    // team one
    final model = context.read<PlayerModel>();
    final teamOnePlayerOneScoreVar =
        context.watch<PlayerModel>().teamOnePlayerOneScore;
    final teamOnePlayerTwoScoreVar =
        context.watch<PlayerModel>().teamOnePlayerTwoScore;

    // team two
    final teamTwoPlayerOneScoreVar =
        context.watch<PlayerModel>().teamTwoPlayerOneScore;
    final teamTwoPlayerTwoScoreVar =
        context.watch<PlayerModel>().teamTwoPlayerTwoScore;

    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Style.colorBlack,
      appBar: AppBar(
        title: const Text(
          'Настройки',
          style: TextStyle(
            fontSize: 28,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.2),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Style.colorGrey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: SizedBox(
                    height: screenHeight * 0.15,
                    child: Row(
                      children: [
                        Text(
                          'Время партии',
                          style: Style.textH2,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.15),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: list.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;

                                    _minutes = list[index];
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: (index == selectedIndex)
                                          ? Colors.green
                                          : Colors.black,
                                      borderRadius: BorderRadius.circular(10),
                                      border: (index == selectedIndex)
                                          ? Border.all(
                                              color: Colors.black, width: 3)
                                          : null),
                                  child: Center(
                                    child: Text(
                                      '${list[index]}',
                                      style: (index == selectedIndex)
                                          ? Style.textH2
                                          : Style.textH2
                                              .copyWith(color: Colors.white),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.1),
                TeamName(
                  text: 'Команда 1 - Красные',
                ),
                PlayerString(
                  name: 'Игрок 1',
                  playerScore: teamOnePlayerOneScoreVar,
                  decremet: () {
                    model.decrementTeamOnePlayerOneScore();
                  },
                  incremet: () {
                    model.incrementTeamOnePlayerOneScore();
                  },
                ),
                PlayerString(
                  name: 'Игрок 2',
                  playerScore: teamOnePlayerTwoScoreVar,
                  decremet: () {
                    model.decrementTeamOnePlayerTwoScore();
                  },
                  incremet: () {
                    model.incrementTeamOnePlayerTwoScore();
                  },
                ),
                SizedBox(height: screenHeight * 0.1),
                TeamName(
                  text: 'Команда 2 - Черные',
                ),
                PlayerString(
                  name: 'Игрок 1',
                  playerScore: teamTwoPlayerOneScoreVar,
                  decremet: () {
                    model.decrementTeamTwoPlayerOneScore();
                  },
                  incremet: () {
                    model.incrementTeamTwoPlayerOneScore();
                  },
                ),
                PlayerString(
                  name: 'Игрок 2',
                  playerScore: teamTwoPlayerTwoScoreVar,
                  decremet: () {
                    model.decrementTeamTwoPlayerTwoScore();
                  },
                  incremet: () {
                    model.incrementTeamTwoPlayerTwoScore();
                  },
                ),
                SizedBox(height: screenHeight * 0.1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Button(
                        color: Colors.green,
                        text: 'Сохранить',
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(
                                minutes: _minutes,
                              ),
                            ),
                          );
                        }),
                    Button(
                      color: Colors.red,
                      text: 'Сбросить все',
                      onTap: () {
                        Navigator.of(context).pushNamed('/screens/home_screen');
                        model.resetTeamOnePlayerOneScore();
                        model.resetTeamOnePlayerTwoScore();
                        model.resetTeamTwoPlayerOneScore();
                        model.resetTeamTwoPlayerTwoScore();
                      },
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
