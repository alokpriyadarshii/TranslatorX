// Package imports:
import 'package:equatable/equatable.dart';

class LanguageOption extends Equatable {
  final String displayName;
  final String localeCode;
  final String translationCode;
  final String countryCode;

  const LanguageOption({
    required this.displayName,
    required this.localeCode,
    required this.translationCode,
    required this.countryCode,
  });

  @override
  List<Object> get props => [
        displayName,
        localeCode,
        translationCode,
        countryCode,
      ];
}
