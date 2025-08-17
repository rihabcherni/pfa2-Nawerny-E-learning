import 'package:flutter/material.dart';
import 'package:pfa_frontend/utils/color.dart';
import 'package:provider/provider.dart';

import '../../../utils/setting_provider.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    super.initState();
  }

  double maxTitleSize = 50.0;
  double maxSubTitleSize = 35.0;
  double maxSmallTitleSize = 30.0;
  double maxBigTextSize = 35.0;
  double maxTextSize = 30.0;
  double maxSmallTextSize = 20.0;
  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Text(
                  "Dynamic Font Size Settings",
                  style: TextStyle(
                    fontSize: settingsProvider.settings.subTitleSize,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                    wordSpacing: 2,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text("Title Size: "),
                  ),
                  Expanded(
                    flex: 3,
                    child: Slider(
                      value: settingsProvider.settings.titleSize,
                      min: 10.0,
                      max: 60.0,
                      divisions: 10,
                      label:
                          'Title Size: ${settingsProvider.settings.titleSize}',
                      onChanged: (double newValue) {
                        setState(() {
                          if (newValue <= 60.0 && newValue >= 10.0) {
                            settingsProvider.settings.updateTitleSize(newValue);
                            settingsProvider.settings
                                .updateSubTitleSize(newValue);
                            settingsProvider.settings
                                .updateSmallTitleSize(newValue);
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text("Text Size: "),
                  ),
                  Expanded(
                    flex: 3,
                    child: Slider(
                      value: settingsProvider.settings.bigTextSize,
                      min: 10.0,
                      max: 30.0,
                      divisions: 10,
                      label:
                          'Text Size: ${settingsProvider.settings.bigTextSize}',
                      onChanged: (double newValue) {
                        setState(() {
                          if (newValue <= 60.0 && newValue >= 10.0) {
                            settingsProvider.settings
                                .updateBigTextSize(newValue);
                            settingsProvider.settings
                                .updateSmallTextSize(newValue);
                            settingsProvider.settings.updateTextSize(newValue);
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  settingsProvider.settings.updateAllFontSizes(1.2, 60, 30);
                });
              },
              child: Text('Increase All'),
            ),
          ],
        ),
      ),
    );
  }
}
