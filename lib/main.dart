import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'entrypoint.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final options = Firebase.app().options;
  debugPrint(
    'Firebase initialized: project=${options.projectId}, appId=${options.appId}, iosBundleId=${options.iosBundleId}',
  );
  final path = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(path.path);
  await Hive.openBox<bool>('boxName');
  await Hive.openBox('user');
  runApp(const MyApp());
}