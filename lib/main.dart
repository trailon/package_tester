import 'package:flutter/material.dart';
import 'package:package_tester/app/locator/locator.dart';

import 'package_tester.dart';

void main() {
  setupLocator();
  runApp(const PackageTester());
}
