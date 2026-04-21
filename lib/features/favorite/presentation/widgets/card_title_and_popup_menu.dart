import 'package:cinemax_app_new/core/utils/app_colors.dart';
import 'package:cinemax_app_new/features/favorite/domain/entities/favorite_entity.dart';
import 'package:cinemax_app_new/features/home/presentation/widgets/card_title.dart';
import 'package:cinemax_app_new/features/search/presentation/widgets/icon_text_row.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class CardTitleAndPopUpMenu extends StatelessWidget {
  const CardTitleAndPopUpMenu({
    super.key,
    required this.item,
    required this.onRemove,
  });

  final FavoriteEntity item;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Flexible(child: CardTitle(title: item.title)),
      PopupMenuButton(
        padding: EdgeInsets.zero,
        position: PopupMenuPosition.under,
        offset: const Offset(0, 1),
        itemBuilder: (context) => [
          PopupMenuItem<void>(
            onTap: onRemove,
            child: const IconTextRow(
              iconData: Icons.delete_rounded,
              text: 'Remove from favorites',
              spacing: 20,
            ),
          ),
          PopupMenuItem<void>(
            onTap: () => SharePlus.instance.share(
              ShareParams(
                subject: 'Share this ${item.title}',
                text:
                    'https://www.themoviedb.org//${item.specificId}${item.contentType.text}',
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

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: const Icon(Icons.more_vert_rounded),
      ),
    ],
  );
}
