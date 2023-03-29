import 'package:flutter/material.dart';
import 'package:flutter_score_app/utils/styles.dart';

class Button extends StatelessWidget {
  Color color;
  String text;
  void Function()? onTap;
  Button({
    Key? key,
    required this.color,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 60,
          ),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            text,
            style: Style.textH2W,
          ),
        ),
      ),
    );
  }
}
