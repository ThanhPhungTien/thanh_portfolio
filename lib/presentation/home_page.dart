import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:thanh_portfolio/presentation/about_me_view.dart';
import 'package:thanh_portfolio/presentation/contact_view.dart';
import 'package:thanh_portfolio/presentation/home_view.dart';
import 'package:thanh_portfolio/presentation/works_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final PageController controller = PageController();
  final pageListenable = ValueNotifier(0);

  late AnimationController animationController;
  late Animation<double> _widthAnimation;

  final double _originalWidth = 60;
  final double _shrunkWidth = 30;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _widthAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(
          begin: _originalWidth,
          end: _shrunkWidth,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: _shrunkWidth,
          end: _originalWidth,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 50,
      ),
    ]).animate(animationController);
  }

  void openPage(int index) {
    animationController.forward(from: 0);
    controller.animateToPage(
      index,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Thanh'),
        actions: [
          TextButton(onPressed: () => openPage(0), child: Text('Home')),
          TextButton(onPressed: () => openPage(1), child: Text('About Me')),
          TextButton(onPressed: () => openPage(2), child: Text('Works')),
          TextButton(onPressed: () => openPage(3), child: Text('Contact')),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraint) {
          final paddingSize = constraint.maxWidth / 18;
          final isMobile = constraint.maxWidth < 600;
          return ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
            ),
            child: PageView(
              controller: controller,
              scrollDirection: Axis.vertical,
              allowImplicitScrolling: true,
              onPageChanged: (page) => pageListenable.value = page,
              children: [
                HomeView(paddingSize: paddingSize),
                AboutMeView(paddingSize: paddingSize),
                WorksView(paddingSize: paddingSize),
                ContactView(paddingSize: paddingSize, isMobile: isMobile),
                SizedBox(width: 16),
              ],
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ValueListenableBuilder(
        valueListenable: pageListenable,
        builder: (context, value, child) {
          return AnimatedBuilder(
            animation: animationController,
            builder: (BuildContext context, child) {
              return SizedBox(
                width: _widthAnimation.value,
                height: _widthAnimation.value,
                child: value == 3 ? null : child,
              );
            },
            child: FloatingActionButton(
              onPressed: () {
                animationController.forward(from: 0);
                controller.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              },
              child: Icon(Icons.arrow_downward),
            ),
          );
        },
      ),
    );
  }
}
