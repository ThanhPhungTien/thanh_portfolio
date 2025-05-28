import 'package:flutter/material.dart';
import 'package:thanh_portfolio/generated/assets.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialBarView extends StatelessWidget {
  SocialBarView({super.key});

  final socials = [
    {
      'icon': Assets.assetsLinkedin,
      'uri': 'https://www.linkedin.com/in/phungtienthanh',
    },
    {
      'icon': Assets.assetsFacebook,
      'uri': 'https://www.facebook.com/phungitienthanh/',
    },
    {'icon': Assets.assetsGithub, 'uri': 'https://github.com/ThanhPhungTien/'},
    {'icon': Assets.assetsGmail, 'uri': 'mailto:phungtienthanh135@gmail.com'},
  ];

  @override
  Widget build(BuildContext context) {
    return OverflowBar(
      spacing: 8,
      overflowSpacing: 8,
      children: socials
          .map(
            (e) => SizedBox(
              height: 50,
              width: 50,
              child: IconButton(
                onPressed: () => launchUrl(Uri.parse(e['uri'] ?? '')),
                icon: Image.asset(e['icon'] ?? ''),
              ),
            ),
          )
          .toList(),
    );
  }
}
