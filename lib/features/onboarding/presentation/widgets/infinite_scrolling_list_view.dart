import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class InfiniteScrollingListView extends StatefulWidget {
  final List<String> posters;
  final int speed;
  final double initialScrollOffset;
  final double itemExtent;
  final double topPadding;

  const InfiniteScrollingListView({
    super.key,
    required this.posters,
    required this.speed,
    required this.initialScrollOffset,
    this.itemExtent = 166.0,
    this.topPadding = 0,
  });

  @override
  State<InfiniteScrollingListView> createState() =>
      _InfiniteScrollingListViewState();
}

class _InfiniteScrollingListViewState extends State<InfiniteScrollingListView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(
      initialScrollOffset: widget.initialScrollOffset,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => _autoScroll());
  }

  void _autoScroll() {
    if (!_scrollController.hasClients) {
      return;
    }

    final double maxExtent = _scrollController.position.maxScrollExtent;
    final double distance = maxExtent - _scrollController.offset;
    final double durationMs = distance * widget.speed;

    _scrollController.animateTo(
      maxExtent,
      duration: Duration(milliseconds: durationMs.toInt()),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) => ListView.builder(
    controller: _scrollController,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: 10000,
    padding: EdgeInsets.only(top: widget.topPadding),
    itemExtent: widget.itemExtent, // ✅ Performance optimization
    cacheExtent: widget.itemExtent * 3, // Cache 3 items ahead/behind
    itemBuilder: (context, index) {
      final posterUrl = widget.posters[index % widget.posters.length];
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: _PosterCard(posterUrl: posterUrl),
      );
    },
  );

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class _PosterCard extends StatelessWidget {
  const _PosterCard({required this.posterUrl});

  final String posterUrl;

  @override
  Widget build(BuildContext context) => CachedNetworkImage(
    imageUrl: posterUrl,
    height: 150,
    imageBuilder: (context, imageProvider) => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(image: imageProvider, fit: .cover),
      ),
    ),
    errorWidget: (context, url, error) => const SizedBox(),
  );
}
