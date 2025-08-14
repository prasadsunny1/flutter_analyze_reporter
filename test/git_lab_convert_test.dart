import 'dart:convert';

import 'package:flutter_analyze_reporter_2/src/converter/gitlab_converter.dart';
import 'package:flutter_analyze_reporter_2/src/parser/flutter_analyze_parser.dart';
import 'package:test/test.dart';

void main() {
  test('Validate GitLab JSON output (lines.begin)', () {
    const stdout = "  warning • 'unused' is assigned a value but never used. • lib/index.js:42:1 • no-unused-vars";
    final issues = FlutterAnalyzeParser().flutterAnalyze(stdout: stdout);
    final json = GitLabConverter().convert(issues);
    final decoded = jsonDecode(json) as List<dynamic>;
    expect(decoded.length, 1);
    final item = decoded.first as Map<String, dynamic>;
    expect(item['description'], "'unused' is assigned a value but never used.");
    expect(item['check_name'], 'no-unused-vars');
    expect(item['severity'], 'minor');
    expect(item['location']['path'], 'lib/index.js');
    expect(item['location']['lines']['begin'], 42);
    expect(RegExp(r'^[0-9a-f]{32}$').hasMatch(item['fingerprint'] as String),
        isTrue);
  });
}


[
  {
    "description": "'unused' is assigned a value but never used.",
    "check_name": "no-unused-vars",
    "fingerprint": "7815696ecbf1c96e6894b779456d330e",
    "severity": "minor",
    "location": {
      "path": "lib/index.js",
      "lines": {
        "begin": 42
      }
    }
  }
]