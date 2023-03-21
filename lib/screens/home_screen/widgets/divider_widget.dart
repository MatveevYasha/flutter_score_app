import 'package:flutter/material.dart';
import 'package:flutter_score_app/utils/styles.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({
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
