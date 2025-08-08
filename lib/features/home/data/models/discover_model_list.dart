import 'package:flutter/material.dart';

import 'discover_model.dart';

List<DiscoverModel> discoverModelList = [
  DiscoverModel(title: 'Filter', icon: Icons.filter_alt, onTap: () {}),
  DiscoverModel(title: 'Movies', icon: Icons.movie, onTap: () {}),
  DiscoverModel(title: 'TV Shows', icon: Icons.tv, onTap: () {}),
  DiscoverModel(title: 'Networks', icon: Icons.live_tv, onTap: () {}),
  DiscoverModel(
    title: 'Production Companies',
    icon: Icons.business,
    onTap: () {},
  ),
  DiscoverModel(title: 'Movie Genres', icon: Icons.book_outlined, onTap: () {}),
  DiscoverModel(title: 'TV Genres', icon: Icons.book_outlined, onTap: () {}),
];
