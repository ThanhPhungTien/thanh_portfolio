import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thanh_portfolio/generated/assets.dart';

class ContactView extends StatelessWidget {
  const ContactView({
    super.key,
    required this.paddingSize,
    required this.isMobile,
  });

  final double paddingSize;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(paddingSize),
      child: isMobile
          ? Column(
              children: [
                Expanded(child: SvgPicture.asset(Assets.assetsContact)),
                Expanded(child: SocialView()),
              ],
            )
          : Row(
              children: [
                Expanded(child: SvgPicture.asset(Assets.assetsContact)),
                Expanded(child: SocialView()),
              ],
            ),
    );
  }
}

class SocialView extends StatelessWidget {
  const SocialView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.facebook)),
            IconButton(onPressed: () {}, icon: Icon(Icons.email)),
          ],
        ),
      ],
    );
  }
}
