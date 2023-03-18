import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/home_controller.dart';

class Background extends GetView<HomeController> {
  final Widget child;
  const Background({
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
            width: size.width * 0.3,
            child: Image.asset('assets/images/main_top.png'),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            width: size.width * 0.2,
            child: Image.asset('assets/images/main_bottom.png'),
          ),
          child,
        ],
      ),
    );
  }
}
