// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ru = {
  "player_one": "Игрок 1",
  "player_two": "Игрок 2",
  "team_one": "Команда 1",
  "team_two": "Команда 2",
  "setings": "Настройки",
  "party_time": "Время партии",
  "red_team": "Команда красных",
  "black_team": "Команда черных",
  "save": "Сохранить",
  "reset": "Сбросить все",
  "sure_to_reset_player_points": "Вы точно хотите сбросить очки игрока?",
  "no": "Нет",
  "yes": "Да",
  "game_over": "Игра закончилась",
  "team_one_won": "Победила команда 1",
  "team_two_won": "Победила команда 2",
  "game_ended_draw": "Игра закончилась вничью",
  "view_results": "Посмотреть результаты",
  "start_over": "Начать заново"
};
static const Map<String,dynamic> en = {
  "player_one": "Player 1",
  "player_two": "Player 2",
  "team_one": "Team 1",
  "team_two": "Team 2",
  "setings": "Setings",
  "party_time": "Party Time",
  "red_team": "Red Team",
  "black_team": "Black Team",
  "save": "Save",
  "reset": "Reset",
  "sure_to_reset_player_points": "Are you sure you want to reset the player's points?",
  "no": "No",
  "yes": "Yes",
  "game_over": "The game is over",
  "team_one_won": "Team 1 won",
  "team_two_won": "Team 2 won",
  "game_ended_draw": "The game ended in a draw",
  "view_results": "View results",
  "start_over": "Start over"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ru": ru, "en": en};
}
