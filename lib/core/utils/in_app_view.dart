import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'app_colors.dart';

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
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        clicked(context);
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: isClicked
              ? AppPrimaryColors.dark
              : Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: isClicked
                ? AppPrimaryColors.dark
                : Colors.transparent,
            statusBarIconBrightness: Brightness.light,
          ),
          title: Text(
            widget.title,
            style: const TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => clicked(context),
          ),
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
              const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            if (hasError)
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 48,
                    ),
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
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Colors.white,
                    ),
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
                      await controller.evaluateJavascript(
                        source: '''
                        // Function to hide elements
                        function hideElement(element) {
                          if (element) {
                            element.style.display = 'none';
                            element.style.visibility = 'hidden';
                            element.style.opacity = '0';
                            element.style.pointerEvents = 'none';
                          }
                        }

                        // Block clicks on ad elements
                        document.addEventListener('click', function(event) {
                          let target = event.target;
                          while (target) {
                            // Check for common ad class names and IDs
                            if (target.classList && (
                                target.classList.contains('ad') ||
                                target.classList.contains('ads') ||
                                target.classList.contains('advertisement') ||
                                target.classList.contains('ad-container') ||
                                target.classList.contains('ad-wrapper') ||
                                target.classList.contains('ad-class') ||
                                target.classList.contains('advertisement-container') ||
                                target.classList.contains('advertisement-wrapper')
                            )) {
                              event.preventDefault();
                              event.stopPropagation();
                              hideElement(target);
                              return;
                            }
                            target = target.parentNode;
                          }
                        }, true);

                        // Use MutationObserver to continuously block ads
                        const observer = new MutationObserver((mutations) => {
                          mutations.forEach((mutation) => {
                            mutation.addedNodes.forEach((node) => {
                              if (node.nodeType === 1) {
                                // Check for common ad selectors
                                const adSelectors = [
                                  '[class*="ad-"]',
                                  '[id*="ad-"]',
                                  '[class*="ads-"]',
                                  '[id*="ads-"]',
                                  '[class*="advertisement"]',
                                  '[id*="advertisement"]',
                                  '[class*="banner"]',
                                  '[id*="banner"]',
                                  '[class*="sponsored"]',
                                  '[id*="sponsored"]',
                                  '[class*="promo"]',
                                  '[id*="promo"]',
                                  'iframe[src*="ad"]',
                                  'iframe[src*="ads"]',
                                  'iframe[src*="banner"]',
                                  'iframe[src*="sponsored"]'
                                ];

                                adSelectors.forEach(selector => {
                                  const elements = node.querySelectorAll(selector);
                                  elements.forEach(element => hideElement(element));
                                });

                                // Check the node itself
                                if (node.classList) {
                                  adSelectors.forEach(selector => {
                                    if (node.matches(selector)) {
                                      hideElement(node);
                                    }
                                  });
                                }
                              }
                            });
                          });
                        });

                        // Start observing
                        observer.observe(document.body, { 
                          childList: true, 
                          subtree: true,
                          attributes: true,
                          attributeFilter: ['class', 'id', 'style']
                        });

                        // Block common ad-related scripts
                        const blockedScripts = [
                          'ad.js',
                          'ads.js',
                          'advertisement.js',
                          'banner.js',
                          'sponsored.js',
                          'promo.js'
                        ];

                        blockedScripts.forEach(scriptName => {
                          const scripts = document.querySelectorAll('script');
                          scripts.forEach(script => {
                            if (script.src && script.src.toLowerCase().includes(scriptName)) {
                              script.remove();
                            }
                          });
                        });

                        // Enable fullscreen video
                        document.addEventListener('fullscreenchange', function() {
                          if (document.fullscreenElement) {
                            document.documentElement.style.overflow = 'hidden';
                          } else {
                            document.documentElement.style.overflow = 'auto';
                          }
                        });

                        // Add video controls and styling
                        const videos = document.getElementsByTagName('video');
                        for (let video of videos) {
                          video.controls = true;
                          video.style.width = '100%';
                          video.style.height = '100%';
                          video.style.objectFit = 'fill';
                          video.style.position = 'absolute';
                          video.style.top = '0';
                          video.style.left = '0';
                          video.style.right = '0';
                          video.style.bottom = '0';
                          video.style.zIndex = '9999';
                        }

                        // Make sure the video container takes full screen
                        const videoContainers = document.querySelectorAll('.video-container, .player-container, .player-wrapper, iframe');
                        videoContainers.forEach(container => {
                          container.style.width = '100%';
                          container.style.height = '100%';
                          container.style.position = 'absolute';
                          container.style.top = '0';
                          container.style.left = '0';
                          container.style.right = '0';
                          container.style.bottom = '0';
                          container.style.zIndex = '9998';
                        });

                        // Remove any padding or margins from body and html
                        document.documentElement.style.margin = '0';
                        document.documentElement.style.padding = '0';
                        document.documentElement.style.overflow = 'hidden';
                        document.documentElement.style.width = '100%';
                        document.documentElement.style.height = '100%';
                        document.body.style.margin = '0';
                        document.body.style.padding = '0';
                        document.body.style.overflow = 'hidden';
                        document.body.style.width = '100%';
                        document.body.style.height = '100%';
                        ''',
                      );
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
                            r'^https://(vidsrc\.xyz|yourdomain\.com)',
                          );
                          if (!allowedDomains.hasMatch(url)) {
                            return NavigationActionPolicy.CANCEL;
                          }
                          return NavigationActionPolicy.ALLOW;
                        },
                    onCreateWindow: (controller, createWindowRequest) async {
                      return false; // Block new windows to prevent pop-ups
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void clicked(BuildContext context) {
    setState(() {
      isClicked = !isClicked;
      Navigator.maybePop(context);
    });
  }
}
