import 'package:dinero/common/presentation/design/app_palette.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/presentation/bloc_components/cryptocurrencies_bloc.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/presentation/bloc_components/cryptocurrencies_event.dart';
import 'package:dinero/features/main_container_app/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

// Allows you to access the InnerController.
final GlobalKey<NestedScrollViewState> nestedScrollViewGlobalKey = GlobalKey();

class MainContainerAppBody extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const MainContainerAppBody({
    required this.navigationShell,
    super.key,
  });

  @override
  State<MainContainerAppBody> createState() => _MainContainerAppBodyState();
}

class _MainContainerAppBodyState extends State<MainContainerAppBody> {
  late bool isVisibleButton;

  @override
  void initState() {
    super.initState();
    // Initially, the FloatingActionButton is not visible.
    isVisibleButton = false;

    // A method that allows specific code to be executed
    // after the rendering phase is completed.
    WidgetsBinding.instance.endOfFrame.then(
      (endOfFrameValue) {
        final innerController =
            nestedScrollViewGlobalKey.currentState?.innerController;

        innerController?.addListener(
          () {
            if (!innerController.hasClients) return;

            final maxScrollExtent = innerController.position.maxScrollExtent;
            final currentScrollOffset = innerController.offset;

            setState(
              () => isVisibleButton =
                  currentScrollOffset > (maxScrollExtent * 0.10),
            );

            if (currentScrollOffset >= (maxScrollExtent * 0.95)) {
              context
                  .read<CryptocurrenciesBloc>()
                  .add(const CryptocurrenciesEvent.fetched());
            }
          },
        );
      },
    );
  }

  @override
  void dispose() {
    nestedScrollViewGlobalKey.currentState?.innerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: isVisibleButton
          ? FloatingActionButton(
              child: const Icon(
                Icons.keyboard_arrow_up_outlined,
                color: AppPalette.white,
              ),
              onPressed: () => nestedScrollViewGlobalKey
                  .currentState?.innerController
                  .animateTo(
                // TODO: We need to verify this in the future.
                -1.0,
                duration: Durations.long1,
                curve: Curves.ease,
              ),
            )
          : null,
      body: widget.navigationShell,
      bottomNavigationBar:
          BottomNavBar(navigationShell: widget.navigationShell),
    );
  }
}
