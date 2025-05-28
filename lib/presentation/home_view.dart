import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thanh_portfolio/generated/assets.dart';
import 'package:thanh_portfolio/presentation/social_bar_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.paddingSize});

  final double paddingSize;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.all(paddingSize),
      child: Row(
        children: [
          Expanded(
            child: Column(
              spacing: 16,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Software Engineer', style: textTheme.headlineLarge),
                SocialBarView(),
              ],
            ),
          ),
          Expanded(child: SvgPicture.asset(Assets.assetsHome)),
        ],
      ),
    );
  }
}
