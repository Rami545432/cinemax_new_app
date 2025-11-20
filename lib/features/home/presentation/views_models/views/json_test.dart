import 'dart:convert';
import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/features/home/data/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class ParseBenchmarkScreen extends StatefulWidget {
  final Map<String, dynamic> sampleJson; // your TMDB response

  const ParseBenchmarkScreen({super.key, required this.sampleJson});

  @override
  State<ParseBenchmarkScreen> createState() => _ParseBenchmarkScreenState();
}

class _ParseBenchmarkScreenState extends State<ParseBenchmarkScreen> {
  int? mainThreadMs;
  int? isolateMs;

  Future<void> _testMainThread() async {
    final stopwatch = Stopwatch()..start();

    final results = widget.sampleJson['results'] as List<dynamic>;

    final movies = results
        .map<MovieModel>((json) => MovieModel.fromJson(json))
        .toList();

    stopwatch.stop();

    setState(() => mainThreadMs = stopwatch.elapsedMilliseconds);
  }

  Future<void> _testIsolate() async {
    final rawJson = jsonEncode(widget.sampleJson['results']);

    final stopwatch = Stopwatch()..start();

    final movies = await compute(_parseInIsolate, rawJson);

    stopwatch.stop();

    setState(() => isolateMs = stopwatch.elapsedMilliseconds);
  }

  static List<MovieModel> _parseInIsolate(String encoded) {
    final list = jsonDecode(encoded) as List<dynamic>;
    return list.map<MovieModel>((e) => MovieModel.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Parsing Benchmark')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _testMainThread,
              child: Text(
                "Parse on Main Thread",
                style: AppStyles.textStyle16(context),
              ),
            ),
            if (mainThreadMs != null) Text("Main thread: $mainThreadMs ms"),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: _testIsolate,
              child: Text(
                "Parse in Isolate",
                style: AppStyles.textStyle16(context),
              ),
            ),
            if (isolateMs != null) Text("Isolate: $isolateMs ms"),

            const SizedBox(height: 40),

            Text(
              "Watch the performance overlay while running these tests.\n"
              "Main-thread parsing may cause jank on mid devices.",
              textAlign: TextAlign.center,
              style: AppStyles.textStyle16(context),
            ),
          ],
        ),
      ),
    );
  }
}
