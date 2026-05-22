// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:translatorx/utils/l10n/translations/translation.dart';

export 'package:translatorx/utils/l10n/translations/translation.dart';

extension LocalizationContext on BuildContext {
  TextTranslations get l10n => TextTranslations.of(this)!;
}
