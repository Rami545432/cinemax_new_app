import 'package:flutter/widgets.dart';

import '../../../../constant.dart';
import '../../../../core/utils/custom_text_field.dart';
import '../../../../core/utils/functions/handle_update.dart';
import '../../../../core/utils/main_app_bar.dart';
import '../../../../core/utils/primary_button.dart';
import '../../../../core/utils/primary_texts.dart';
import 'edit_profile_stack_image.dart';

class EditProfileListViewComponets extends StatelessWidget {
  const EditProfileListViewComponets(
      {super.key, required this.controllers, required this.hintTexts});
  final List<TextEditingController> controllers;
  final List<String> hintTexts;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const MainAppBar(title: 'Edit Profile'),
        const EditProfileStackImage(),
        const SizedBox(
          height: 21,
        ),
        PrimaryTexts(
          title: fireBaseUser.currentUser!.displayName.toString(),
          subtitle: fireBaseUser.currentUser!.email.toString(),
        ),
        const SizedBox(
          height: 48,
        ),
        for (int i = 0; i < hintTexts.length; i++) ...[
          CustomTextField(
            hintText: hintTexts[i],
            lable: lables[i],
            controller: controllers[i],
          ),
          if (i < lables.length - 1)
            const SizedBox(
              height: 24,
            ),
        ],
        const SizedBox(
          height: 40,
        ),
        PrimaryButton(
          text: 'Save Changes',
          onTap: () async {
            handleUpdate(context, controllers);
          },
        ),
      ],
    );
  }
}
