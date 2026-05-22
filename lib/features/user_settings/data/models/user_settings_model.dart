// Project imports:
import 'package:translatorx/constants/enums.dart';

class UserSettingsModel {
  final bool isAutoPlay;
  final SelectedFontSize fontSize;
  final SelectedInterfaceLanguage interfaceLanguage;

  UserSettingsModel({
    required this.isAutoPlay,
    required this.fontSize,
    required this.interfaceLanguage,
  });
}
