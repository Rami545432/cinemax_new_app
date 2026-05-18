import 'package:flutter/material.dart';
import 'package:movify/features/details/presentation/widgets/shared/detail_info.dart';

class DetailInfoBox extends StatelessWidget {
  const DetailInfoBox({
    super.key,
    required this.info,
    required this.icons,
    required this.text,
  });
  final String info;
  final IconData icons;
  final String text;
  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: const BoxDecoration(),
    child: DetailInfo(info: info, icons: icons, text: text),
  );
}
