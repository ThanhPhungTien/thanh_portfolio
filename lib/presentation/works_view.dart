import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thanh_portfolio/generated/assets.dart';

class WorksView extends StatelessWidget {
  const WorksView({super.key, required this.paddingSize});

  final double paddingSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(paddingSize),
      child: Center(
        child: SvgPicture.asset(Assets.assetsWork),
      ),
    );
  }
}
