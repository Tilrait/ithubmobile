import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ithubmobile/gen/assets.gen.dart';
import 'package:ithubmobile/generated/l10n/app_localizations.dart';
import 'package:ithubmobile/ui/screen/profile/profile_screen.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(AppLocalizations.of(context)!.appTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CupertinoSwitch(
                    value: _switchValue,
                    onChanged: (value) => setState(() => _switchValue = value),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfileScreen(),
                        ),
                      );
                    },
                    child: const Text('Profile'),
                  ),
                ],
              ),
            ),
            Image.asset(Assets.images.img2891.path),
            Image.asset(Assets.images.images.path),
            Image.asset(Assets.images.img0776.path),
          ],
        ),
      ),
    );
  }
}