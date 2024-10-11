// Entry point cua moi truong staging

import 'build_constants.dart';
import 'main.dart';

void main() {
  BuildConstants.setEnvironment(Environment.staging);
  mainDelegate();
}
