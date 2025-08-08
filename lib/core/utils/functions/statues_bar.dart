import 'package:flutter/services.dart';

import '../../../../../core/utils/app_colors.dart';

void setStatuesBarColor() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: AppPrimaryColors.dark, //status bar color
    ),
  );
}
