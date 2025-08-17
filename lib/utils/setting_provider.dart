import 'package:flutter/widgets.dart';
import 'package:pfa_frontend/models/settings.dart';
class SettingsProvider extends ChangeNotifier {
  Settings _settings = Settings();

  Settings get settings => _settings;

  void updateTitleSize(double newSize) {
    _settings.titleSize = newSize;
    notifyListeners();
  }

  void updateBigTextSize(double newSize) {
    _settings.bigTextSize = newSize;
    notifyListeners();
  }

  void updateTextSize(double newSize) {
    _settings.textSize = newSize;
    notifyListeners();
  }

  void updateSmallTitleSize(double newSize) {
    _settings.smallTitleSize = newSize;
    notifyListeners();
  }

  void updateSmallTextSize(double newSize) {
    _settings.smallTextSize = newSize;
    notifyListeners();
  }

  void updateSubTitleSize(double newSize) {
    _settings.subTitleSize = newSize;
    notifyListeners();
  }
}