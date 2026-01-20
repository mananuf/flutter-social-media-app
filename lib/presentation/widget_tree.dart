import 'package:flutter/material.dart';
import 'package:view_social/data/data-sources/local/notifiers.dart';
import 'package:view_social/presentation/pages/app/chats_page.dart';
import 'package:view_social/presentation/pages/app/home_page.dart';
import 'package:view_social/presentation/pages/app/reels_page.dart';
import 'package:view_social/presentation/pages/app/settings_page.dart';

List<Widget> pages = [
  HomePage(),
  ChatsPage(),
  ReelsPage(),
  SettingsPage()
];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: currentPageNotifier,
      builder: (builder, currentPage, child) {
        return pages.elementAt(currentPage);
      },
    );
  }
}
