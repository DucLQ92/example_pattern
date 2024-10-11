// Entry point cua moi truong dev

import 'build_constants.dart';
import 'main.dart';

void main() async {
  BuildConstants.setEnvironment(Environment.dev);
  mainDelegate();
}
