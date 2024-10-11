// Entry point cua moi truong prod

import 'build_constants.dart';
import 'main.dart';

void main() async {
  BuildConstants.setEnvironment(Environment.prod);
  mainDelegate();
}
