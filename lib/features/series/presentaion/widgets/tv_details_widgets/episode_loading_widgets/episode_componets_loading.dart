import 'package:flutter/material.dart';

import '../episode_info_column.dart';

class EpisodeComponetsLoading extends StatelessWidget {
  const EpisodeComponetsLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 33),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 121,
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(16),
                ),
                height: 83,
              ),
              SizedBox(
                width: 16,
              ),
              EpisodeInfoColumn(
                episodeDuration: 55,
                episodeName: 'seasonDetailsEntitiy.episodeName',
                episodeNumber: 55,
              ),
            ],
          ),
          SizedBox(
            height: 88,
            width: 282,
            child: Text('seasonDetailsEntitiy.episodeOverView'),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
