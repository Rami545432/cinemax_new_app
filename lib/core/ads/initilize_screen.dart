import 'package:flutter/material.dart';
import 'package:movify/core/ads/initialize_helper.dart';

class InitilizeScreen extends StatefulWidget {
  const InitilizeScreen({super.key, required this.child});
  final Widget child;
  @override
  State<InitilizeScreen> createState() => _InitilizeScreenState();
}

class _InitilizeScreenState extends State<InitilizeScreen> {
  final _initilaizeHelper = InitializeHelper();
  @override
  void initState() {
    _initilize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: CircularProgressIndicator()));
  Future<void> _initilize() async {
    final navigator = Navigator.of(context);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _initilaizeHelper.initiliaze();
      navigator.pushReplacement(
        MaterialPageRoute<void>(builder: (context) => widget.child),
      );
    });
  }
}
