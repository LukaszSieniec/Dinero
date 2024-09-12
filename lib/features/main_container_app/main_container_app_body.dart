import 'package:dinero/features/dashboard/cryptocurrencies/presentation/bloc_components/cryptocurrencies_bloc.dart';
import 'package:dinero/features/dashboard/cryptocurrencies/presentation/bloc_components/cryptocurrencies_event.dart';
import 'package:dinero/features/main_container_app/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  @override
  void initState() {
    super.initState();

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
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      body: widget.navigationShell,
      bottomNavigationBar:
          BottomNavBar(navigationShell: widget.navigationShell),
    );
  }
}
