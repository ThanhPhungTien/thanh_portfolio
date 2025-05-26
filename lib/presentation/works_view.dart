import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:thanh_portfolio/generated/assets.dart';

class WorksView extends StatelessWidget {
  const WorksView({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Svg(Assets.assetsWorks),
          fit: BoxFit.cover,
        ),
      ),
      child: Text('data'),
    );
  }
}
