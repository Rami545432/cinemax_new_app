import 'package:cinemax_app_new/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../../../home/presentation/views_models/widgets/card_title.dart';
import '../../../search/presentaion/view_models/widgets/icon_text_row.dart';
import '../../domain/entities/favorite_entity.dart';

class CardTitleAndPopUpMenu extends StatelessWidget {
  const CardTitleAndPopUpMenu({
    super.key,
    required this.item,
    required this.onRemove,
  });

  final FavoriteEntity item;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(child: CardTitle(title: item.title)),
        PopupMenuButton(
          padding: EdgeInsets.zero,
          position: PopupMenuPosition.under,
          offset: const Offset(0, 1),
          itemBuilder: (context) => [
            PopupMenuItem(
              onTap: onRemove,
              child: const IconTextRow(
                iconData: Icons.delete_rounded,
                text: 'Remove from favorites',
                spacing: 20,
              ),
            ),
            PopupMenuItem(
              onTap: () => SharePlus.instance.share(
                ShareParams(
                  subject: 'Share this ${item.title}',
                  text:
                      'https://www.themoviedb.org//${item.id}${item.contentType.text}',
                ),
              ),
              child: const IconTextRow(
                iconData: Icons.share_rounded,
                text: 'Share',
                spacing: 20,
              ),
            ),
          ],

          color: AppPrimaryColors.soft,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.more_vert_rounded),
        ),
      ],
    );
  }
}
