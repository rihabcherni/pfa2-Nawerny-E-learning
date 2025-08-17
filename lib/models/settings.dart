import 'package:pfa_frontend/utils/constants.dart';

class Settings {
  double titleSize;
  double subTitleSize;
  double smallTitleSize;
  double bigTextSize;
  double textSize;
  double smallTextSize;

  Settings({
    this.titleSize = kDefaultTitleSize,
    this.subTitleSize = kDefaultSousTitleSize,
    this.smallTitleSize = kDefaultSmallTitleSize,
    this.bigTextSize = kDefaultBigTexteSize,
    this.textSize = kDefaultTexteSize,
    this.smallTextSize = kDefaultSmallTexteSize,
  });

  void updateTitleSize(double newSize) {
    titleSize = newSize;
  }

  void updateSubTitleSize(double newSize) {
    subTitleSize = newSize;
  }

  void updateSmallTitleSize(double newSize) {
    smallTitleSize = newSize;
  }

  void updateBigTextSize(double newSize) {
    bigTextSize = newSize;
  }

  void updateTextSize(double newSize) {
    textSize = newSize;
  }

  void updateSmallTextSize(double newSize) {
    smallTextSize = newSize;
  }

  void updateAllFontSizes(double scaleFactor, double maxTitle, double maxText) {
    if (titleSize * scaleFactor <= maxTitle) {
      titleSize *= scaleFactor;
    } else {
      titleSize = maxTitle;
    }
    if (subTitleSize * scaleFactor <= maxTitle) {
      subTitleSize *= scaleFactor;
    } else {
      subTitleSize = maxTitle;
    }
    if (smallTitleSize * scaleFactor <= maxTitle) {
      smallTitleSize *= scaleFactor;
    } else {
      smallTitleSize = maxTitle;
    }
    if (bigTextSize * scaleFactor <= maxText) {
      bigTextSize *= scaleFactor;
    } else {
      bigTextSize = maxText;
    }
    if (textSize * scaleFactor <= maxText) {
      textSize *= scaleFactor;
    } else {
      textSize = maxText;
    }
    if (smallTextSize * scaleFactor <= maxText) {
      smallTextSize *= scaleFactor;
    } else {
      smallTextSize = maxText;
    }
  }
}
