import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../controllers/home_controller.dart';

class LoginBackground extends GetView<HomeController> {
  final Widget child;
  const LoginBackground({
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
            child: Image.asset('assets/images/main_top.png'),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            width: size.width * 0.4,
            child: Image.asset('assets/images/login_bottom.png'),
          ),
          child,
        ],
      ),
    );
  }
}
