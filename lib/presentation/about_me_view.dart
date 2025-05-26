import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thanh_portfolio/generated/assets.dart';

class AboutMeView extends StatelessWidget {
  const AboutMeView({super.key, required this.paddingSize});

  final double paddingSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(paddingSize),
      child: Row(
        children: [
          Expanded(child: Text('About Me')),
          Expanded(child: SvgPicture.asset(Assets.assetsAboutMe)),
        ],
      ),
    );
  }
}
