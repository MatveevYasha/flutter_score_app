import 'package:flutter/material.dart';

class PlayerModel extends ChangeNotifier {
  int teamOnePlayerOneScore = 0;
  int teamOnePlayerTwoScore = 0;
  int teamTwoPlayerOneScore = 0;
  int teamTwoPlayerTwoScore = 0;
  int partyTime = 30;

  void changePartyTime() {
    // TODO
    notifyListeners();
  }

// Team 1
// Player 1
  void incrementTeamOnePlayerOneScore() {
    teamOnePlayerOneScore++;
    notifyListeners();
  }

  void decrementTeamOnePlayerOneScore() {
    if (teamOnePlayerOneScore != 0) {
      teamOnePlayerOneScore = teamOnePlayerOneScore - 1;
    }
    notifyListeners();
  }

  void resetTeamOnePlayerOneScore() {
    teamOnePlayerOneScore = 0;
    notifyListeners();
  }

// Team 1
// Player 2

  void incrementTeamOnePlayerTwoScore() {
    teamOnePlayerTwoScore++;
    notifyListeners();
  }

  void decrementTeamOnePlayerTwoScore() {
    if (teamOnePlayerTwoScore != 0) {
      teamOnePlayerTwoScore = teamOnePlayerTwoScore - 1;
    }
    notifyListeners();
  }

  void resetTeamOnePlayerTwoScore() {
    teamOnePlayerTwoScore = 0;
    notifyListeners();
  }

// Team 2
// Player 1

  void incrementTeamTwoPlayerOneScore() {
    teamTwoPlayerOneScore++;
    notifyListeners();
  }

  void decrementTeamTwoPlayerOneScore() {
    if (teamTwoPlayerOneScore != 0) {
      teamTwoPlayerOneScore = teamTwoPlayerOneScore - 1;
    }
    notifyListeners();
  }

  void resetTeamTwoPlayerOneScore() {
    teamTwoPlayerOneScore = 0;
    notifyListeners();
  }

// Team 2
// Player 2

  void incrementTeamTwoPlayerTwoScore() {
    teamTwoPlayerTwoScore++;
    notifyListeners();
  }

  void decrementTeamTwoPlayerTwoScore() {
    if (teamTwoPlayerTwoScore != 0) {
      teamTwoPlayerTwoScore = teamTwoPlayerTwoScore - 1;
    }
    notifyListeners();
  }

  void resetTeamTwoPlayerTwoScore() {
    teamTwoPlayerTwoScore = 0;
    notifyListeners();
  }
}
