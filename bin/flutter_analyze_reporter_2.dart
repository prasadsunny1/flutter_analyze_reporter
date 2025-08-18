import '../lib/src/cli_runner.dart' as cli_runner;

// Activate locally: dart pub global activate -s path .
void main(List<String> args) {
  cli_runner.CliRunner().run(args);
}
