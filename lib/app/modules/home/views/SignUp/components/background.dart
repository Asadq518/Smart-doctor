import 'package:flutter/material.dart';

class SignUpBackground extends StatelessWidget {
  final Widget child;
  const SignUpBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            width: size.width * 0.35,
            child: Image.asset('assets/images/signup_top.png'),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            width: size.width * 0.25,
            child: Image.asset('assets/images/main_bottom.png'),
          ),
          child,
        ],
      ),
    );
  }
}
