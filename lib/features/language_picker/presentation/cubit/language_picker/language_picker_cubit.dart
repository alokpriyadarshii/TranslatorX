// Package imports:
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:translatorx/features/language_picker/domain/models/language_model.dart';
import 'package:translatorx/features/language_picker/domain/models/language_option.dart';
import 'package:translatorx/features/language_picker/domain/repositories/language_picker_repository.dart';

part 'language_picker_state.dart';

@injectable
class LanguagePickerCubit extends Cubit<LanguagePickerState> {
  final LanguagePickerRepository repository;

  LanguagePickerCubit(this.repository) : super(LanguagePickerInitial());

  static const List<LanguageOption> _supportedLanguages = <LanguageOption>[
    LanguageOption(
      displayName: 'Afghanistan - Pashto',
      localeCode: 'ps_AF',
      translationCode: 'ps',
      countryCode: 'AF',
    ),
    LanguageOption(
      displayName: 'Albania - Albanian',
      localeCode: 'sq_AL',
      translationCode: 'sq',
      countryCode: 'AL',
    ),
    LanguageOption(
      displayName: 'Algeria - Arabic',
      localeCode: 'ar_DZ',
      translationCode: 'ar',
      countryCode: 'DZ',
    ),
    LanguageOption(
      displayName: 'Argentina - Spanish',
      localeCode: 'es_AR',
      translationCode: 'es',
      countryCode: 'AR',
    ),
    LanguageOption(
      displayName: 'Armenia - Armenian',
      localeCode: 'hy_AM',
      translationCode: 'hy',
      countryCode: 'AM',
    ),
    LanguageOption(
      displayName: 'Australia - English',
      localeCode: 'en_AU',
      translationCode: 'en',
      countryCode: 'AU',
    ),
    LanguageOption(
      displayName: 'Austria - German',
      localeCode: 'de_AT',
      translationCode: 'de',
      countryCode: 'AT',
    ),
    LanguageOption(
      displayName: 'Azerbaijan - Azerbaijani',
      localeCode: 'az_AZ',
      translationCode: 'az',
      countryCode: 'AZ',
    ),
    LanguageOption(
      displayName: 'Bangladesh - Bengali',
      localeCode: 'bn_BD',
      translationCode: 'bn',
      countryCode: 'BD',
    ),
    LanguageOption(
      displayName: 'Belarus - Belarusian',
      localeCode: 'be_BY',
      translationCode: 'be',
      countryCode: 'BY',
    ),
    LanguageOption(
      displayName: 'Belgium - Dutch',
      localeCode: 'nl_BE',
      translationCode: 'nl',
      countryCode: 'BE',
    ),
    LanguageOption(
      displayName: 'Bolivia - Spanish',
      localeCode: 'es_BO',
      translationCode: 'es',
      countryCode: 'BO',
    ),
    LanguageOption(
      displayName: 'Bosnia and Herzegovina - Bosnian',
      localeCode: 'bs_BA',
      translationCode: 'bs',
      countryCode: 'BA',
    ),
    LanguageOption(
      displayName: 'Brazil - Portuguese',
      localeCode: 'pt_BR',
      translationCode: 'pt',
      countryCode: 'BR',
    ),
    LanguageOption(
      displayName: 'Bulgaria - Bulgarian',
      localeCode: 'bg_BG',
      translationCode: 'bg',
      countryCode: 'BG',
    ),
    LanguageOption(
      displayName: 'Cambodia - Khmer',
      localeCode: 'km_KH',
      translationCode: 'km',
      countryCode: 'KH',
    ),
    LanguageOption(
      displayName: 'Canada - French',
      localeCode: 'fr_CA',
      translationCode: 'fr',
      countryCode: 'CA',
    ),
    LanguageOption(
      displayName: 'Chile - Spanish',
      localeCode: 'es_CL',
      translationCode: 'es',
      countryCode: 'CL',
    ),
    LanguageOption(
      displayName: 'China - Chinese',
      localeCode: 'zh_CN',
      translationCode: 'zh-cn',
      countryCode: 'CN',
    ),
    LanguageOption(
      displayName: 'Colombia - Spanish',
      localeCode: 'es_CO',
      translationCode: 'es',
      countryCode: 'CO',
    ),
    LanguageOption(
      displayName: 'Costa Rica - Spanish',
      localeCode: 'es_CR',
      translationCode: 'es',
      countryCode: 'CR',
    ),
    LanguageOption(
      displayName: 'Croatia - Croatian',
      localeCode: 'hr_HR',
      translationCode: 'hr',
      countryCode: 'HR',
    ),
    LanguageOption(
      displayName: 'Czechia - Czech',
      localeCode: 'cs_CZ',
      translationCode: 'cs',
      countryCode: 'CZ',
    ),
    LanguageOption(
      displayName: 'Denmark - Danish',
      localeCode: 'da_DK',
      translationCode: 'da',
      countryCode: 'DK',
    ),
    LanguageOption(
      displayName: 'Dominican Republic - Spanish',
      localeCode: 'es_DO',
      translationCode: 'es',
      countryCode: 'DO',
    ),
    LanguageOption(
      displayName: 'Ecuador - Spanish',
      localeCode: 'es_EC',
      translationCode: 'es',
      countryCode: 'EC',
    ),
    LanguageOption(
      displayName: 'Egypt - Arabic',
      localeCode: 'ar_EG',
      translationCode: 'ar',
      countryCode: 'EG',
    ),
    LanguageOption(
      displayName: 'Estonia - Estonian',
      localeCode: 'et_EE',
      translationCode: 'et',
      countryCode: 'EE',
    ),
    LanguageOption(
      displayName: 'Ethiopia - Amharic',
      localeCode: 'am_ET',
      translationCode: 'am',
      countryCode: 'ET',
    ),
    LanguageOption(
      displayName: 'Finland - Finnish',
      localeCode: 'fi_FI',
      translationCode: 'fi',
      countryCode: 'FI',
    ),
    LanguageOption(
      displayName: 'France - French',
      localeCode: 'fr_FR',
      translationCode: 'fr',
      countryCode: 'FR',
    ),
    LanguageOption(
      displayName: 'Georgia - Georgian',
      localeCode: 'ka_GE',
      translationCode: 'ka',
      countryCode: 'GE',
    ),
    LanguageOption(
      displayName: 'Germany - German',
      localeCode: 'de_DE',
      translationCode: 'de',
      countryCode: 'DE',
    ),
    LanguageOption(
      displayName: 'Ghana - English',
      localeCode: 'en_GH',
      translationCode: 'en',
      countryCode: 'GH',
    ),
    LanguageOption(
      displayName: 'Greece - Greek',
      localeCode: 'el_GR',
      translationCode: 'el',
      countryCode: 'GR',
    ),
    LanguageOption(
      displayName: 'Guatemala - Spanish',
      localeCode: 'es_GT',
      translationCode: 'es',
      countryCode: 'GT',
    ),
    LanguageOption(
      displayName: 'Haiti - Haitian Creole',
      localeCode: 'ht_HT',
      translationCode: 'ht',
      countryCode: 'HT',
    ),
    LanguageOption(
      displayName: 'Honduras - Spanish',
      localeCode: 'es_HN',
      translationCode: 'es',
      countryCode: 'HN',
    ),
    LanguageOption(
      displayName: 'Hong Kong - Chinese',
      localeCode: 'zh_HK',
      translationCode: 'zh-tw',
      countryCode: 'HK',
    ),
    LanguageOption(
      displayName: 'Hungary - Hungarian',
      localeCode: 'hu_HU',
      translationCode: 'hu',
      countryCode: 'HU',
    ),
    LanguageOption(
      displayName: 'Iceland - Icelandic',
      localeCode: 'is_IS',
      translationCode: 'is',
      countryCode: 'IS',
    ),
    LanguageOption(
      displayName: 'India - Hindi',
      localeCode: 'hi_IN',
      translationCode: 'hi',
      countryCode: 'IN',
    ),
    LanguageOption(
      displayName: 'Indonesia - Indonesian',
      localeCode: 'id_ID',
      translationCode: 'id',
      countryCode: 'ID',
    ),
    LanguageOption(
      displayName: 'Iran - Persian',
      localeCode: 'fa_IR',
      translationCode: 'fa',
      countryCode: 'IR',
    ),
    LanguageOption(
      displayName: 'Iraq - Arabic',
      localeCode: 'ar_IQ',
      translationCode: 'ar',
      countryCode: 'IQ',
    ),
    LanguageOption(
      displayName: 'Ireland - Irish',
      localeCode: 'ga_IE',
      translationCode: 'ga',
      countryCode: 'IE',
    ),
    LanguageOption(
      displayName: 'Israel - Hebrew',
      localeCode: 'he_IL',
      translationCode: 'he',
      countryCode: 'IL',
    ),
    LanguageOption(
      displayName: 'Italy - Italian',
      localeCode: 'it_IT',
      translationCode: 'it',
      countryCode: 'IT',
    ),
    LanguageOption(
      displayName: 'Japan - Japanese',
      localeCode: 'ja_JP',
      translationCode: 'ja',
      countryCode: 'JP',
    ),
    LanguageOption(
      displayName: 'Jordan - Arabic',
      localeCode: 'ar_JO',
      translationCode: 'ar',
      countryCode: 'JO',
    ),
    LanguageOption(
      displayName: 'Kazakhstan - Kazakh',
      localeCode: 'kk_KZ',
      translationCode: 'kk',
      countryCode: 'KZ',
    ),
    LanguageOption(
      displayName: 'Kenya - Swahili',
      localeCode: 'sw_KE',
      translationCode: 'sw',
      countryCode: 'KE',
    ),
    LanguageOption(
      displayName: 'Kuwait - Arabic',
      localeCode: 'ar_KW',
      translationCode: 'ar',
      countryCode: 'KW',
    ),
    LanguageOption(
      displayName: 'Laos - Lao',
      localeCode: 'lo_LA',
      translationCode: 'lo',
      countryCode: 'LA',
    ),
    LanguageOption(
      displayName: 'Latvia - Latvian',
      localeCode: 'lv_LV',
      translationCode: 'lv',
      countryCode: 'LV',
    ),
    LanguageOption(
      displayName: 'Lebanon - Arabic',
      localeCode: 'ar_LB',
      translationCode: 'ar',
      countryCode: 'LB',
    ),
    LanguageOption(
      displayName: 'Lithuania - Lithuanian',
      localeCode: 'lt_LT',
      translationCode: 'lt',
      countryCode: 'LT',
    ),
    LanguageOption(
      displayName: 'Luxembourg - French',
      localeCode: 'fr_LU',
      translationCode: 'fr',
      countryCode: 'LU',
    ),
    LanguageOption(
      displayName: 'Malaysia - Malay',
      localeCode: 'ms_MY',
      translationCode: 'ms',
      countryCode: 'MY',
    ),
    LanguageOption(
      displayName: 'Malta - Maltese',
      localeCode: 'mt_MT',
      translationCode: 'mt',
      countryCode: 'MT',
    ),
    LanguageOption(
      displayName: 'Mexico - Spanish',
      localeCode: 'es_MX',
      translationCode: 'es',
      countryCode: 'MX',
    ),
    LanguageOption(
      displayName: 'Moldova - Romanian',
      localeCode: 'ro_MD',
      translationCode: 'ro',
      countryCode: 'MD',
    ),
    LanguageOption(
      displayName: 'Mongolia - Mongolian',
      localeCode: 'mn_MN',
      translationCode: 'mn',
      countryCode: 'MN',
    ),
    LanguageOption(
      displayName: 'Morocco - Arabic',
      localeCode: 'ar_MA',
      translationCode: 'ar',
      countryCode: 'MA',
    ),
    LanguageOption(
      displayName: 'Mozambique - Portuguese',
      localeCode: 'pt_MZ',
      translationCode: 'pt',
      countryCode: 'MZ',
    ),
    LanguageOption(
      displayName: 'Myanmar - Burmese',
      localeCode: 'my_MM',
      translationCode: 'my',
      countryCode: 'MM',
    ),
    LanguageOption(
      displayName: 'Nepal - Nepali',
      localeCode: 'ne_NP',
      translationCode: 'ne',
      countryCode: 'NP',
    ),
    LanguageOption(
      displayName: 'Netherlands - Dutch',
      localeCode: 'nl_NL',
      translationCode: 'nl',
      countryCode: 'NL',
    ),
    LanguageOption(
      displayName: 'New Zealand - Maori',
      localeCode: 'mi_NZ',
      translationCode: 'mi',
      countryCode: 'NZ',
    ),
    LanguageOption(
      displayName: 'Nicaragua - Spanish',
      localeCode: 'es_NI',
      translationCode: 'es',
      countryCode: 'NI',
    ),
    LanguageOption(
      displayName: 'Nigeria - Hausa',
      localeCode: 'ha_NG',
      translationCode: 'ha',
      countryCode: 'NG',
    ),
    LanguageOption(
      displayName: 'North Macedonia - Macedonian',
      localeCode: 'mk_MK',
      translationCode: 'mk',
      countryCode: 'MK',
    ),
    LanguageOption(
      displayName: 'Norway - Norwegian',
      localeCode: 'nb_NO',
      translationCode: 'no',
      countryCode: 'NO',
    ),
    LanguageOption(
      displayName: 'Oman - Arabic',
      localeCode: 'ar_OM',
      translationCode: 'ar',
      countryCode: 'OM',
    ),
    LanguageOption(
      displayName: 'Pakistan - Urdu',
      localeCode: 'ur_PK',
      translationCode: 'ur',
      countryCode: 'PK',
    ),
    LanguageOption(
      displayName: 'Panama - Spanish',
      localeCode: 'es_PA',
      translationCode: 'es',
      countryCode: 'PA',
    ),
    LanguageOption(
      displayName: 'Paraguay - Spanish',
      localeCode: 'es_PY',
      translationCode: 'es',
      countryCode: 'PY',
    ),
    LanguageOption(
      displayName: 'Peru - Spanish',
      localeCode: 'es_PE',
      translationCode: 'es',
      countryCode: 'PE',
    ),
    LanguageOption(
      displayName: 'Philippines - Filipino',
      localeCode: 'fil_PH',
      translationCode: 'tl',
      countryCode: 'PH',
    ),
    LanguageOption(
      displayName: 'Poland - Polish',
      localeCode: 'pl_PL',
      translationCode: 'pl',
      countryCode: 'PL',
    ),
    LanguageOption(
      displayName: 'Portugal - Portuguese',
      localeCode: 'pt_PT',
      translationCode: 'pt',
      countryCode: 'PT',
    ),
    LanguageOption(
      displayName: 'Qatar - Arabic',
      localeCode: 'ar_QA',
      translationCode: 'ar',
      countryCode: 'QA',
    ),
    LanguageOption(
      displayName: 'Romania - Romanian',
      localeCode: 'ro_RO',
      translationCode: 'ro',
      countryCode: 'RO',
    ),
    LanguageOption(
      displayName: 'Russia - Russian',
      localeCode: 'ru_RU',
      translationCode: 'ru',
      countryCode: 'RU',
    ),
    LanguageOption(
      displayName: 'Saudi Arabia - Arabic',
      localeCode: 'ar_SA',
      translationCode: 'ar',
      countryCode: 'SA',
    ),
    LanguageOption(
      displayName: 'Senegal - French',
      localeCode: 'fr_SN',
      translationCode: 'fr',
      countryCode: 'SN',
    ),
    LanguageOption(
      displayName: 'Serbia - Serbian',
      localeCode: 'sr_RS',
      translationCode: 'sr',
      countryCode: 'RS',
    ),
    LanguageOption(
      displayName: 'Singapore - Tamil',
      localeCode: 'ta_SG',
      translationCode: 'ta',
      countryCode: 'SG',
    ),
    LanguageOption(
      displayName: 'South Africa - Zulu',
      localeCode: 'zu_ZA',
      translationCode: 'zu',
      countryCode: 'ZA',
    ),
    LanguageOption(
      displayName: 'South Korea - Korean',
      localeCode: 'ko_KR',
      translationCode: 'ko',
      countryCode: 'KR',
    ),
    LanguageOption(
      displayName: 'Spain - Spanish',
      localeCode: 'es_ES',
      translationCode: 'es',
      countryCode: 'ES',
    ),
    LanguageOption(
      displayName: 'Sri Lanka - Sinhala',
      localeCode: 'si_LK',
      translationCode: 'si',
      countryCode: 'LK',
    ),
    LanguageOption(
      displayName: 'Sweden - Swedish',
      localeCode: 'sv_SE',
      translationCode: 'sv',
      countryCode: 'SE',
    ),
    LanguageOption(
      displayName: 'Switzerland - German',
      localeCode: 'de_CH',
      translationCode: 'de',
      countryCode: 'CH',
    ),
    LanguageOption(
      displayName: 'Taiwan - Chinese',
      localeCode: 'zh_TW',
      translationCode: 'zh-tw',
      countryCode: 'TW',
    ),
    LanguageOption(
      displayName: 'Tanzania - Swahili',
      localeCode: 'sw_TZ',
      translationCode: 'sw',
      countryCode: 'TZ',
    ),
    LanguageOption(
      displayName: 'Thailand - Thai',
      localeCode: 'th_TH',
      translationCode: 'th',
      countryCode: 'TH',
    ),
    LanguageOption(
      displayName: 'Turkey - Turkish',
      localeCode: 'tr_TR',
      translationCode: 'tr',
      countryCode: 'TR',
    ),
    LanguageOption(
      displayName: 'United Kingdom - English',
      localeCode: 'en_GB',
      translationCode: 'en',
      countryCode: 'GB',
    ),
    LanguageOption(
      displayName: 'United States - English',
      localeCode: 'en_US',
      translationCode: 'en',
      countryCode: 'US',
    ),
  ];

  Future<void> setSourceLanguage({required String language}) async {
    final LanguageModel languageModel = await repository.getSavedLanguages();
    await repository.setSourceLanguage(language: language);
    emit(
      LanguagesSelected(
        sourceLanguage: language,
        targetLanguage: languageModel.targetLanguage,
      ),
    );
  }

  Future<void> setTargetLanguage({required String language}) async {
    final LanguageModel languageModel = await repository.getSavedLanguages();
    await repository.setTargetLanguage(language: language);
    emit(
      LanguagesSelected(
        targetLanguage: language,
        sourceLanguage: languageModel.sourceLanguage,
      ),
    );
  }

  Future<void> setSavedLanguages() async {
    final LanguageModel languageModel = await repository.getSavedLanguages();
    setSourceLanguage(language: languageModel.sourceLanguage);
    setTargetLanguage(language: languageModel.targetLanguage);
  }

  Future<void> reverseLanguages() async {
    final LanguageModel languageModel = await repository.getSavedLanguages();

    await repository.setTargetLanguage(language: languageModel.sourceLanguage);
    await repository.setSourceLanguage(language: languageModel.targetLanguage);
    emit(
      LanguagesSelected(
        sourceLanguage: languageModel.targetLanguage,
        targetLanguage: languageModel.sourceLanguage,
      ),
    );
  }

  List<LanguageOption> getLanguageList() {
    return List<LanguageOption>.unmodifiable(_supportedLanguages);
  }

  List<LanguageOption> getAvailableLanguages({
    required bool isSelectingSourceLng,
    required List<LanguageOption> languages,
    required String targetLanguage,
    required String sourceLanguage,
  }) {
    final String omittedLocale =
        isSelectingSourceLng ? targetLanguage : sourceLanguage;

    return languages
        .where((language) => language.localeCode != omittedLocale)
        .toList(growable: false);
  }

  LanguageOption getLanguageOption(String localeCode) {
    for (final language in _supportedLanguages) {
      if (language.localeCode == localeCode) {
        return language;
      }
    }

    return _supportedLanguages.firstWhere(
      (language) => language.localeCode == 'en_US',
    );
  }

  String getCountryCode(String localeCode) {
    return getLanguageOption(localeCode).countryCode;
  }

  String getDisplayName(String localeCode) {
    return getLanguageOption(localeCode).displayName;
  }

  String getTranslationCode(String localeCode) {
    return getLanguageOption(localeCode).translationCode;
  }

  String getSpeechLocale(String localeCode) {
    return getLanguageOption(localeCode).localeCode;
  }
}
