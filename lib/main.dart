import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'entrypoint.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final path = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(path.path);
  await Hive.openBox<bool>('boxName');
  runApp(const MyApp());
}