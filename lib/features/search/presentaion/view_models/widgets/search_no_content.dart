import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_styles.dart';

class SearchListNoContent extends StatelessWidget {
  const SearchListNoContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.23),
        SvgPicture.asset('assets/images/notFoundSearch.svg'),
        const SizedBox(height: 16),
        SizedBox(
          width: 300,
          child: Text(
            textAlign: TextAlign.center,
            'We Are Sorry, We Can Not Find The Movie :(',
            style: AppStyles.textStyle16(context),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Text(
            '  ',
            style: AppStyles.textStyle12(context),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
