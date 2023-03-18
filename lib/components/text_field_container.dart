import 'package:flutter/material.dart';

import '../app/utils/contants.dart';


class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Colours.kPrimaryLightColor,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}