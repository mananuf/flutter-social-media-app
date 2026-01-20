import 'package:flutter/material.dart';
// import 'package:view_social/core/constants/colors.dart';
import 'package:view_social/data/data-sources/local/notifiers.dart';

class NavbarWidget extends StatefulWidget {
  const NavbarWidget({super.key});

  @override
  State<NavbarWidget> createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: currentPageNotifier,
      builder: (builder, currentPage, child) {
        return NavigationBar(
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: 'home'),
            NavigationDestination(icon: Icon(Icons.chat), label: 'chat'),
            NavigationDestination(icon: Icon(Icons.camera), label: 'views'),
            NavigationDestination(
              icon: Icon(Icons.settings),
              label: 'settings',
            ),
          ],

          onDestinationSelected: (int value) =>
              currentPageNotifier.value = value,
          selectedIndex: currentPage,

          // indicatorColor: VColors().darkSlate,
          // overlayColor: WidgetStateProperty.all(Colors.white),
        );
      },
    );
  }
}
