import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/utils/app_colors.dart';

class WishListCardLoading extends StatelessWidget {
  const WishListCardLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.width * 1.5,
          decoration: BoxDecoration(
            color: AppPrimaryColors.soft,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 12,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: SizedBox(
                  height: 83,
                  width: 121,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              //  WishCardColumnComponets(wishListEntity: wishListEntity,)
            ],
          ),
        ),
      ),
    );
  }
}
