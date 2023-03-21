import 'package:flutter/material.dart';
import 'package:flutter_score_app/utils/styles.dart';

class PlayTogglerWidget extends StatelessWidget {
  PlayTogglerWidget({
    super.key,
    required this.playToggle,
    required this.onTab,
  });

  final bool playToggle;
  void Function() onTab;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
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
    );
  }
}
