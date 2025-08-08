import 'package:flutter/material.dart';

import '../../../../../../core/utils/details_widgets/custom_descreption.dart';
import 'about_tab_view_branch.dart';
import 'gener_row.dart';

class AboutTabBarView extends StatelessWidget {
  const AboutTabBarView({
    super.key,
    required this.overview,
    required this.geners,
    required this.child,
  });

  final String overview;
  final List<int> geners;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        CustomDescreption(overview: overview),
        SizedBox(height: 10),
        Divider(),
        AboutTabViewBranch(
          title: 'Geners',
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: GenersRow(geners: geners),
          ),
        ),
        SizedBox(height: 20),
        Divider(),
        SizedBox(height: 20),
        child,
      ],
    );
  }
}
