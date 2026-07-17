import 'package:flutter/material.dart';
import 'package:movify/core/utils/app_logger.dart';
import 'package:movify/core/utils/app_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class BuildFooter extends StatelessWidget {
  const BuildFooter({super.key});

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      AppLogger.error('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final style = AppStyles.textStyle16(
      context,
    ).copyWith(color: const Color(0xFFA3A3A3));
    return Text.rich(
      TextSpan(
        style: AppStyles.textStyle16(
          context,
        ).copyWith(color: const Color(0xFFA3A3A3)),
        children: [
          const TextSpan(text: 'By continuing, you agree to our '),
          WidgetSpan(
            child: GestureDetector(
              onTap: () {
                _launchUrl(
                  'https://sites.google.com/view/movifytermsandconditions/home',
                );
              },
              child: Text(
                'Terms',
                style: style.copyWith(decoration: TextDecoration.underline),
              ),
            ),
          ),
          TextSpan(text: ' and ', style: style),
          WidgetSpan(
            child: GestureDetector(
              onTap: () {
                _launchUrl(
                  'https://sites.google.com/view/movifyprivacypolicy/home',
                );
              },
              child: Text(
                'Privacy Policy',
                style: style.copyWith(decoration: TextDecoration.underline),
              ),
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
