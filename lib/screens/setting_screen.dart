import 'package:flutter/material.dart';
import 'package:flutter_score_app/domain/player_model.dart';
import 'package:flutter_score_app/utils/styles.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
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
                const SizedBox(
                  height: 75,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Style.colorGrey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Время партии',
                        style: Style.textH2,
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Style.colorBlack,
                        ),
                        child: Text(
                          'минут',
                          style: Style.textH2W,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Text(
                  'Команда 1 - Красные',
                  style: Style.teamName,
                ),
                const SizedBox(height: 3),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Style.colorGrey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Игрок 1',
                        style: Style.textH2,
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Style.colorBlack,
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                model.decrementTeamOnePlayerOneScore();
                              },
                              icon: Icon(
                                Icons.remove,
                                color: Style.colorWhite,
                              ),
                            ),
                            Text(
                              teamOnePlayerOneScoreVar.toString(),
                              style: Style.textH2W,
                            ),
                            IconButton(
                              onPressed: () {
                                model.incrementTeamOnePlayerOneScore();
                              },
                              splashColor: Style.colorWhite,
                              icon: Icon(
                                Icons.add,
                                color: Style.colorWhite,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Style.colorGrey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Игрок 2',
                        style: Style.textH2,
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Style.colorBlack,
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                model.decrementTeamOnePlayerTwoScore();
                              },
                              icon: Icon(
                                Icons.remove,
                                color: Style.colorWhite,
                              ),
                            ),
                            Text(
                              teamOnePlayerTwoScoreVar.toString(),
                              style: Style.textH2W,
                            ),
                            IconButton(
                              onPressed: () {
                                model.incrementTeamOnePlayerTwoScore();
                              },
                              splashColor: Style.colorWhite,
                              icon: Icon(
                                Icons.add,
                                color: Style.colorWhite,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'Команда 2 - Черные',
                  style: Style.teamName,
                ),
                const SizedBox(height: 3),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Style.colorGrey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Игрок 1',
                        style: Style.textH2,
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Style.colorBlack,
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                model.decrementTeamTwoPlayerOneScore();
                              },
                              icon: Icon(
                                Icons.remove,
                                color: Style.colorWhite,
                              ),
                            ),
                            Text(
                              teamTwoPlayerOneScoreVar.toString(),
                              style: Style.textH2W,
                            ),
                            IconButton(
                              onPressed: () {
                                model.incrementTeamTwoPlayerOneScore();
                              },
                              splashColor: Style.colorWhite,
                              icon: Icon(
                                Icons.add,
                                color: Style.colorWhite,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Style.colorGrey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Игрок 2',
                        style: Style.textH2,
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Style.colorBlack,
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                model.decrementTeamTwoPlayerTwoScore();
                              },
                              icon: Icon(
                                Icons.remove,
                                color: Style.colorWhite,
                              ),
                            ),
                            Text(
                              teamTwoPlayerTwoScoreVar.toString(),
                              style: Style.textH2W,
                            ),
                            IconButton(
                              onPressed: () {
                                model.incrementTeamTwoPlayerTwoScore();
                              },
                              splashColor: Style.colorWhite,
                              icon: Icon(
                                Icons.add,
                                color: Style.colorWhite,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 60,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            'Сохранить',
                            style: Style.textH2W,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed('/screens/home_screen');
                          model.resetTeamOnePlayerOneScore();
                          model.resetTeamOnePlayerTwoScore();
                          model.resetTeamTwoPlayerOneScore();
                          model.resetTeamTwoPlayerTwoScore();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 60,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            'Сбросить все',
                            style: Style.textH2W,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
