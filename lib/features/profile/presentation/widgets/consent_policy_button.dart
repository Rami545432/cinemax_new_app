import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movify/core/ads/consent_manager.dart';
import 'package:movify/core/ads/cubits/privacy_options_cubit.dart';
import 'package:movify/core/ads/cubits/privacy_options_state.dart';
import 'package:movify/core/di/service_locator.dart';

// The button widget itself

class ManagePrivacyButton extends StatelessWidget {
  const ManagePrivacyButton({super.key});

  @override
  Widget build(BuildContext context) => FutureBuilder<bool>(
    future: ConsentManager.isPrivacyOptionsRequired(),
    builder: (context, snapshot) {
      final shouldShow = snapshot.data ?? false;
      if (!shouldShow) {
        return const SizedBox.shrink();
      }

      return BlocProvider(
        create: (_) => getIt<PrivacyOptionsCubit>(),
        child: const _ManagePrivacyButton(),
      );
    },
  );
}

class _ManagePrivacyButton extends StatelessWidget {
  const _ManagePrivacyButton();

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<PrivacyOptionsCubit, PrivacyOptionsState>(
        listener: (context, state) {
          if (state.status == PrivacyOptionsStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Could not open privacy options. Try again.'),
              ),
            );
          }
        },
        builder: (context, state) {
          final isLoading = state.status == PrivacyOptionsStatus.loading;

          return ListTile(
            onTap: isLoading
                ? null
                : () =>
                      context.read<PrivacyOptionsCubit>().showPrivacyOptions(),
            leading: const Icon(
              Icons.privacy_tip_outlined,
              color: Colors.white,
            ),
            title: const Text(
              'Manage Privacy Options',
              style: TextStyle(color: Colors.white),
            ),
            trailing: isLoading
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.chevron_right, color: Colors.grey),
          );
        },
      );
}
