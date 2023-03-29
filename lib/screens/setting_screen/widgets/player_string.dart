import 'package:flutter/material.dart';
import 'package:flutter_score_app/utils/styles.dart';

class PlayerString extends StatelessWidget {
  String name;
  int playerScore;
  void Function()? decremet;
  void Function()? incremet;

  PlayerString({
    Key? key,
    required this.name,
    required this.playerScore,
    required this.decremet,
    required this.incremet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
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
              name,
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
                    onPressed: decremet,
                    icon: Icon(
                      Icons.remove,
                      color: Style.colorWhite,
                    ),
                  ),
                  Text(
                    playerScore.toString(),
                    style: Style.textH2W,
                  ),
                  IconButton(
                    onPressed: incremet,
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
    );
  }
}
