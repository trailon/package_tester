import 'package:flutter/material.dart';
import 'package:image_provider/image_provider.dart';
import 'package:package_tester/app/locator/locator.dart';

import 'package_tester.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  PermissionManager.initialize();
  runApp(const PackageTester());
}            
