import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchNotFind extends StatelessWidget {
  const SearchNotFind({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(),
        SvgPicture.asset('assets/images/no-results1.svg'),
        Text(
          'We Are Sorry, We Can Not Find The Movie :(',
          style: AppStyles.textStyle16(context),
        ),
        Text(
          'Find Your Movie By Type Title, Categories, Years, etc  ',
          style: AppStyles.textStyle12(context),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
