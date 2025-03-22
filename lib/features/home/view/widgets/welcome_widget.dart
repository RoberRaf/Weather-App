import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/theming/text_styles.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 20,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(CupertinoIcons.search, size: 100, color: Colors.black26),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: "Welcome to Weather app\n", style: TStyle.darkBold(16)),
                TextSpan(text: "Check the weather of any city you want", style: TStyle.greySemi(15)),
              ],
            ),
            textAlign: TextAlign.center,
            style: TStyle.darkSemi(14),
          ),
        ],
      ),
    );
  }
}
