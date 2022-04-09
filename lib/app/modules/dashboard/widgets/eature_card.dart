import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lots_/app/utils/colors.dart';

import '../../../utils/assets.dart';

class FeatureCard extends StatelessWidget {
  final String icon, title;
  const FeatureCard({
    Key? key,
    this.icon = Assets.send,
    this.title = 'Title',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.only(top: 12, left: 4, right: 4),
      width: 81,
      height: 124,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(65),
        color: CustomColors.grayColor,
      ),
      child: Column(
        children: [
          SvgPicture.asset(icon),
          const SizedBox(
            height: 8,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              height: 1,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
