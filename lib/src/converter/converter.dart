import 'package:flutter_analyze_reporter_2/src/model/issue.dart';

/// Converter interface.
abstract class Converter {
  /// Convert from Flutter analyze issues to output.
  String convert(List<Issue> issues);
}
