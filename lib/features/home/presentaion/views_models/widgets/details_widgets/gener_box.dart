import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_styles.dart';
import '../../../../../../core/utils/helper/get_gener_name.dart';

class GenerBox extends StatelessWidget {
  const GenerBox({
    super.key,
    required this.gener,
  });

  final int? gener;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.shade700,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(
          getGenreName(gener ?? 27),
          textAlign: TextAlign.center,
          style: AppStyles.textStyle18(context),
        ),
      ),
    );
  }
}
