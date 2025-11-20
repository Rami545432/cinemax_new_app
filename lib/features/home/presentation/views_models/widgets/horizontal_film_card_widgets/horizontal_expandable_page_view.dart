import 'package:cinemax_app_new/features/home/presentation/views_models/widgets/horizontal_film_card_widgets/horizontal_card.dart';
import 'package:cinemax_app_new/hooks/ui/use_auto_scroll.dart';
import 'package:cinemax_app_new/hooks/ui/use_interaction.dart';
import 'package:cinemax_app_new/models/base_card_model.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HorizontalExpandablePageView extends HookWidget {
  const HorizontalExpandablePageView({super.key, required this.data});

  final List<BaseCardModel> data;

  @override
  Widget build(BuildContext context) {
    final length = data.length;
    if (length == 0) return const SizedBox.shrink();

    final pageController = usePageController(
      initialPage: length > 1 ? length * 5000 : 0,
      viewportFraction: 0.9,
    );

    final isUserInteracting = useState(false);

    useAutoScroll(
      controller: pageController,
      isEnabled: length > 1,
      isUserInteracting: isUserInteracting,
    );

    final onUserInteraction = useUserInteractionPause(
      isInteracting: isUserInteracting,
    );

    return GestureDetector(
      onPanStart: (_) => onUserInteraction(),
      onTap: () => onUserInteraction(),
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollStartNotification) {
            onUserInteraction();
          }
          return false;
        },
        child: ExpandablePageView.builder(
          controller: pageController,
          itemCount: length > 1 ? length * 10000 : length,
          itemBuilder: (context, index) {
            final realIndex = index % length;
            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: HorizontalCard(cardModel: data[realIndex]),
            );
          },
        ),
      ),
    );
  }
}
