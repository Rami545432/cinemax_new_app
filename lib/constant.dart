import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'core/utils/app_colors.dart';

Widget primaryPhoto() {
  return SvgPicture.asset('assets/images/live_tv_black_24dp1.svg');
}

const String defaultProfileImage =
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTq2k2sI1nZyFTtoaKSXxeVzmAwIPchF4tjwg&s';

final favoriteBox = 'favoriteBox';
const baseImageUrl = 'https://image.tmdb.org/t/p/original/';

final fireBaseUser = FirebaseAuth.instance;

List<String> lables = ['Full name', 'Email', 'Phone Number'];
List<String> naviLables = ['Home', 'Favorite', 'Tv Series', 'Profile'];
List<Widget> icons = const [
  Icon(Icons.home),
  Icon(Icons.favorite),
  Icon(Icons.live_tv_rounded),
  Icon(Icons.person),
];
List<Widget> selectedIcons = [
  Icon(Icons.home, color: AppPrimaryColors.blueAccent),
  const Icon(Icons.favorite, color: Colors.redAccent),
  Icon(Icons.live_tv_rounded, color: AppPrimaryColors.blueAccent),
  Icon(Icons.person, color: AppPrimaryColors.blueAccent),
];

List<Tab> seriesTabs = const [
  Tab(text: 'About'),
  Tab(text: 'Seasons'),
  Tab(text: 'Cast'),
  Tab(text: 'Reviews'),
  Tab(text: 'Recommended'),
  Tab(text: 'Similar'),
];
List<Tab> seasontabs = const [
  Tab(text: 'Episodes'),
  Tab(text: 'About'),
  Tab(text: 'Cast'),
];
List<Tab> searchTabs = const [
  Tab(text: 'All'),
  Tab(text: 'Movies'),
  Tab(text: 'Tv Shows'),
];
List<Tab> discoverTabs = const [
  Tab(text: 'Movies'),
  Tab(text: 'Tv Shows'),
  Tab(text: 'Networks'),
  Tab(text: 'Production Companies'),
  Tab(text: 'Movie Genres'),
  Tab(text: 'TV Genres'),
];
