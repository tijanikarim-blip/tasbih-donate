import 'package:flutter/material.dart';
import 'app_bar_widget.dart';
import 'bottom_nav_bar.dart';

class AppScaffold extends StatelessWidget {
  final int navIndex;
  final String? title;
  final bool showSearch;
  final bool showMenu;
  final List<Widget>? actions;
  final Widget body;
  final bool extendBodyBehindAppBar;

  const AppScaffold({
    super.key,
    required this.navIndex,
    this.title,
    this.showSearch = false,
    this.showMenu = false,
    this.actions,
    required this.body,
    this.extendBodyBehindAppBar = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      appBar: title != null || showSearch || showMenu
          ? AppBarWidget(
              title: title,
              showSearch: showSearch,
              showMenu: showMenu,
              actions: actions,
            )
          : null,
      body: body,
      bottomNavigationBar: AppBottomNavBar(currentIndex: navIndex),
    );
  }
}
