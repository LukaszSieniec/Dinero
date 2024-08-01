import 'package:dinero/features/main_container_app/main_container_app_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainContainerAppPage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainContainerAppPage({
    required this.navigationShell,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MainContainerAppBody(navigationShell: navigationShell);
  }
}
