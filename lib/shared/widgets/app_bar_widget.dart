import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../constants/app_colors.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showSearch;
  final bool showMenu;
  final List<Widget>? actions;

  const AppBarWidget({
    super.key,
    this.title,
    this.showSearch = false,
    this.showMenu = false,
    this.actions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: title != null
          ? Text(title!, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.white))
          : null,
      leading: showMenu
          ? IconButton(
              icon: const Icon(Icons.menu, color: AppColors.gold),
              onPressed: () => context.go('/more'),
            )
          : null,
      actions: [
        if (showSearch)
          IconButton(
            icon: const Icon(Icons.search, color: AppColors.gold),
            onPressed: () {},
          ),
        if (actions != null) ...actions!,
      ],
    );
  }
}
