import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movify/core/utils/app_colors.dart';
import 'package:movify/core/utils/app_styles.dart';
import 'package:movify/features/auth/presentation/cubits/login_cubit.dart';
import 'package:movify/features/auth/presentation/cubits/login_state.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });
  final String icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final style = AppStyles.textStyle16(context);
    return ListTile(
      onTap: onTap,
      leading: SvgPicture.asset(icon, height: 36, width: 36),
      title: BlocBuilder<LoginCubit, LoginState>(
        buildWhen: (previous, current) {
          // Only rebuild if we are entering or exiting the loading state
          final wasLoading = previous is LoginLoading;
          final isLoading = current is LoginLoading;
          return wasLoading != isLoading;
        },
        builder: (context, state) {
          if (state is LoginLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: AppPrimaryColors.blueAccent,
              ),
            );
          }
          return Text('Continue with $title', style: style, textAlign: .center);
        },
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(color: Colors.grey.shade800),
      ),
    );
  }
}
