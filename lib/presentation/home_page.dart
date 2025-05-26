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

class _HomePageState extends State<HomePage> {
  final PageController controller = PageController();
  final pageListenable = ValueNotifier(0);

  void openPage(int index) {
    controller.animateToPage(
      index,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Thanh Portfolio'),
        actions: [
          TextButton(onPressed: () => openPage(0), child: Text('Home')),
          TextButton(onPressed: () => openPage(1), child: Text('About Me')),
          TextButton(onPressed: () => openPage(2), child: Text('Works')),
          TextButton(onPressed: () => openPage(3), child: Text('Contact')),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraint) {
          return ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
            ),
            child: PageView(
              controller: controller,
              scrollDirection: Axis.vertical,
              allowImplicitScrolling: true,
              onPageChanged: (page)=> pageListenable.value = page,
              children: [
                HomeView(paddingSize: constraint.maxWidth / 18),
                AboutMeView(),
                WorksView(),
                ContactView(),
              ],
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ValueListenableBuilder(
        valueListenable: pageListenable,
        builder: (context, value, child) {
          return value != 3
              ? FloatingActionButton(
                  onPressed: () {
                    controller.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
                  },
                  child: Icon(Icons.arrow_downward),
                )
              : SizedBox.shrink();
        },
      ),
    );
  }
}
