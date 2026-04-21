import 'dart:developer';

import 'package:cinemax_app_new/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class CustomInappView extends StatefulWidget {
  const CustomInappView({
    super.key,
    required this.movieOrTvUrl,
    this.title = 'Video Player',
  });
  final String movieOrTvUrl;
  final String title;
  @override
  CustomInappViewState createState() => CustomInappViewState();
}

class CustomInappViewState extends State<CustomInappView> {
  late InAppWebViewController webViewController;
  double loadingProgress = 0;
  bool isClicked = false;
  bool isLoading = true;
  bool hasError = false;
  String errorMessage = '';

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log(widget.movieOrTvUrl);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: isClicked ? AppPrimaryColors.dark : Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: isClicked
              ? AppPrimaryColors.dark
              : Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),

        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: () {
              webViewController.reload();
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          if (isLoading)
            const Center(child: CircularProgressIndicator(color: Colors.white)),
          if (hasError)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, color: Colors.red, size: 48),
                  const SizedBox(height: 16),
                  Text(
                    errorMessage,
                    style: const TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        hasError = false;
                        isLoading = true;
                      });
                      webViewController.reload();
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          Column(
            children: [
              if (loadingProgress < 1.0)
                LinearProgressIndicator(
                  value: loadingProgress,
                  backgroundColor: Colors.grey[800],
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              Expanded(
                child: InAppWebView(
                  initialUrlRequest: URLRequest(
                    url: WebUri(widget.movieOrTvUrl),
                  ),
                  onWebViewCreated: (controller) {
                    webViewController = controller;
                  },
                  onLoadStart: (controller, url) {
                    setState(() {
                      isLoading = true;
                      hasError = false;
                    });
                  },
                  onLoadStop: (controller, url) async {
                    setState(() {
                      isLoading = false;
                    });
                    await controller.evaluateJavascript(source: '');
                  },
                  onProgressChanged: (controller, progress) {
                    setState(() {
                      loadingProgress = progress / 100;
                    });
                  },
                  onReceivedError: (controller, request, error) {
                    setState(() {
                      isLoading = false;
                      hasError = true;
                      errorMessage =
                          'Failed to load video: ${error.description}';
                    });
                  },
                  shouldOverrideUrlLoading:
                      (controller, navigationAction) async {
                        final url = navigationAction.request.url.toString();
                        final allowedDomains = RegExp(
                          r'^https://(vidsrc\.ru|yourdomain\.com)',
                        );
                        if (!allowedDomains.hasMatch(url)) {
                          return NavigationActionPolicy.CANCEL;
                        }
                        return NavigationActionPolicy.ALLOW;
                      },
                  // ignore: prefer_expression_function_bodies
                  onCreateWindow: (controller, createWindowRequest) async {
                    return false; // Block new windows to prevent pop-ups
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
