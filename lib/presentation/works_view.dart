import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thanh_portfolio/generated/assets.dart';

class WorksView extends StatelessWidget {
  const WorksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(Assets.assetsWork),
    );
  }
}
