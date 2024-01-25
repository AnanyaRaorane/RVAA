import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:rvaa_1/components/appbar.dart';
import 'package:rvaa_1/features/homepage/view/homepage.dart';
import 'package:rvaa_1/features/profile/view/profile_page.dart';

class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav({Key? key}) : super(key: key);

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 1);

  /// Controller to handle bottom nav bar and also handles initial page
  final _controller = NotchBottomBarController(
    index: 1,
  );

  int maxCount = 3;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// widget list
  final List<Widget> bottomBarPages = [
    const RecentsScreen(),
    const HomePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
              child: AnimatedNotchBottomBar(
                /// Provide NotchBottomBarController
                notchBottomBarController: _controller,
                itemLabelStyle: const TextStyle(color: Colors.blue),
                color: Colors.black,
                showLabel: false,
                notchColor: const Color(0xFFD9D9D9),

                /// restart app if you change removeMargins
                removeMargins: true,
                showShadow: true,
                // bottomBarWidth: 800,
                durationInMilliSeconds: 300,
                bottomBarItems: const [
                  BottomBarItem(
                    inActiveItem: Icon(
                      Icons.access_time,
                      color: Colors.blueGrey,
                    ),
                    activeItem: Icon(
                      Icons.access_time,
                      color: Colors.black,
                    ),
                    itemLabel: 'Page 2',
                  ),
                  BottomBarItem(
                    inActiveItem: Icon(
                      Icons.home_filled,
                      color: Colors.blueGrey,
                    ),
                    activeItem: Icon(
                      Icons.home_filled,
                      color: Colors.black,
                    ),
                    itemLabel: 'Page 1',
                  ),

                  ///svg example
                  BottomBarItem(
                    inActiveItem: Icon(
                      Icons.person,
                      color: Colors.blueGrey,
                    ),
                    activeItem: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    itemLabel: 'Page 1',
                  ),
                ],
                onTap: (index) {
                  /// perform action on tab change and to update pages you can update pages without pages
                  debugPrint('current selected index $index');
                  _pageController.jumpToPage(index);
                },
              ),
            )
          : null,
    );
  }
}

class RecentsScreen extends StatelessWidget {
  const RecentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: "clock",
              child: Icon(
                Icons.access_time,
                size: 60,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Your recent activity will appear here.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                height: 0.08,
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class Page2 extends StatelessWidget {
//   const Page2({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         color: Colors.green, child: const Center(child: Text('Page 2')));
//   }
// }

// class Page3 extends StatelessWidget {
//   const Page3({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         color: Colors.red, child: const Center(child: Text('Page 3')));
//   }
// }

// class Page4 extends StatelessWidget {
//   const Page4({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         color: Colors.blue, child: const Center(child: Text('Page 4')));
//   }
// }

// class Page5 extends StatelessWidget {
//   const Page5({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         color: Colors.lightGreenAccent,
//         child: const Center(child: Text('Page 5')));
//   }
// }
