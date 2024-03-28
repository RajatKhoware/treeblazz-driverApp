import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tb_driver/utils/comman/my_text.dart';

class AnimationLoaderWidget extends StatelessWidget {
  final String text;
  final String animation;
  final bool? showAction;
  final String? actionText;
  final VoidCallback? onActionTapped;
  const AnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction,
    this.actionText,
    this.onActionTapped,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Center(
      child: Column(
        children: [
          Lottie.asset(animation, width: width * 0.8),
          SizedBox(height: height * 0.02),
          MyTextPoppines(
            text: text,
            fontSize: width * 0.05,
          ),
          SizedBox(height: height * 0.02),
          showAction ?? false
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                    onPressed: onActionTapped,
                    child: MyTextPoppines(
                      text: actionText!,
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
