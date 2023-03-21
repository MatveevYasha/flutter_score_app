import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_score_app/utils/styles.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TimerZoneWidget extends StatelessWidget {
  const TimerZoneWidget({
    super.key,
    required CustomTimerController controller,
  }) : _controller = controller;

  final CustomTimerController _controller;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      closeOnScroll: false,
      endActionPane: ActionPane(
        extentRatio: 0.4,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: ((context) {
              Navigator.of(context).pushNamed('/screens/setting_screen');
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
                return Text("${remaining.minutes}:${remaining.seconds}",
                    style: Style.playerScore);
              }),
        ),
      ),
    );
  }
}
