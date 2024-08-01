import 'package:dinero/core/navigation/routes.dart';
import 'package:dinero/features/dashboard/dashboard_page.dart';
import 'package:dinero/features/main_container_app/main_container_app_page.dart';
import 'package:dinero/features/profile/profile_page.dart';
import 'package:dinero/features/splash/splash_page.dart';
import 'package:dinero/features/transactions/transactions_page.dart';
import 'package:dinero/features/wallet/wallet_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'go_router.g.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

// Splash route configuration.
@TypedGoRoute<SplashRoute>(path: Routes.splash)
class SplashRoute extends GoRouteData {
  const SplashRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const SplashPage();
}

// Configuration of the main application container
// displaying subpages: Dashboard, Wallet, Transactions and Profile.
@TypedStatefulShellRoute<MainContainerAppRoute>(
  branches: [
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<DashboardRoute>(
          path: Routes.dashboard,
        ),
      ],
    ),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<WalletRoute>(
          path: Routes.wallet,
        ),
      ],
    ),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<TransactionsRoute>(
          path: Routes.transactions,
        ),
      ],
    ),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<ProfileRoute>(
          path: Routes.profile,
        ),
      ],
    ),
  ],
)
class MainContainerAppRoute extends StatefulShellRouteData {
  const MainContainerAppRoute();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) =>
      MainContainerAppPage(navigationShell: navigationShell);
}

// Dashboard route configuration.
class DashboardRoute extends GoRouteData {
  const DashboardRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const DashboardPage();
}

// Wallet route configuration.
class WalletRoute extends GoRouteData {
  const WalletRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const WalletPage();
}

// Transactions route configuration.
class TransactionsRoute extends GoRouteData {
  const TransactionsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const TransactionsPage();
}

// Profile route configuration.
class ProfileRoute extends GoRouteData {
  const ProfileRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ProfilePage();
}
