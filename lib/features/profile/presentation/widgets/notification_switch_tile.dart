import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movify/core/notification/settings/presentation/notification_settings/notification_settings_cubit.dart';
import 'package:movify/core/utils/app_styles.dart';
import 'package:movify/l10n/app_localizations.dart';

class NotificationSwitchTile extends StatefulWidget {
  const NotificationSwitchTile({super.key});

  @override
  State<NotificationSwitchTile> createState() => _NotificationSwitchTileState();
}

class _NotificationSwitchTileState extends State<NotificationSwitchTile>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // Check initial status
    context.read<NotificationSettingsCubit>().checkStatus();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // When the user comes back to the app from the settings, re-check the status
    if (state == AppLifecycleState.resumed) {
      context.read<NotificationSettingsCubit>().checkStatus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocBuilder<NotificationSettingsCubit, NotificationSettingsState>(
      builder: (context, state) {
        bool isEnabled = false;

        if (state is NotificationSettingsLoaded) {
          isEnabled = state.isEnabled;
        }

        return ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            l10n.pushNotifications,
            style: AppStyles.textStyle16(context),
          ),
          leading: const FaIcon(FontAwesomeIcons.bell),
          trailing: state is NotificationSettingsLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator.adaptive(strokeWidth: 2),
                )
              : CupertinoSwitch(
                  value: isEnabled,
                  activeTrackColor: Colors.green,
                  onChanged: (value) {
                    // Let the Cubit handle the toggle logic
                    context
                        .read<NotificationSettingsCubit>()
                        .toggleNotification(value);
                  },
                ),
        );
      },
    );
  }
}
