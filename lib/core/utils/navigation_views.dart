import 'package:flutter/material.dart';
import '../../constant.dart';
import '../../features/profile/presentaion/views/profile_view.dart';
import 'app_colors.dart';
import 'bloc_provieders_views/home_view_provieder.dart';
import 'bloc_provieders_views/seires_tv_shows_providers.dart';
import 'bloc_provieders_views/favorite_bloc_provider.dart';

class NavigationViews extends StatefulWidget {
  const NavigationViews({super.key, this.viewindex});

  final int? viewindex;

  @override
  State<NavigationViews> createState() => _NavigationViewsState();
}

class _NavigationViewsState extends State<NavigationViews> {
  int selectedIndex = 0;
  List<Widget> body = [
    HomeViewProviders(),
    FavoriteBlocProviders(),
    SeiresTvShowsProviders(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[widget.viewindex ?? selectedIndex],
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.transparent,
        backgroundColor: AppPrimaryColors.dark,
        onDestinationSelected: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        selectedIndex: widget.viewindex ?? selectedIndex,
        destinations: [
          for (int i = 0; i < selectedIcons.length; i++)
            NavigationDestination(
              selectedIcon: selectedIcons[i],
              icon: icons[i],
              label: naviLables[i],
            ),
        ],
      ),
    );
  }
}
