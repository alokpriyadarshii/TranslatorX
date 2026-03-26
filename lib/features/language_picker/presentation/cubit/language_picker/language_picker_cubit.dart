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
      displayName: 'Afrikaans (South Africa)',
      localeCode: 'af_ZA',
      translationCode: 'af',
      countryCode: 'ZA',
    ),
    LanguageOption(
      displayName: 'Albanian (Albania)',
      localeCode: 'sq_AL',
      translationCode: 'sq',
      countryCode: 'AL',
    ),
    LanguageOption(
      displayName: 'Amharic (Ethiopia)',
      localeCode: 'am_ET',
      translationCode: 'am',
      countryCode: 'ET',
    ),
    LanguageOption(
      displayName: 'Arabic (Algeria)',
      localeCode: 'ar_DZ',
      translationCode: 'ar',
      countryCode: 'DZ',
    ),
    LanguageOption(
      displayName: 'Arabic (Bahrain)',
      localeCode: 'ar_BH',
      translationCode: 'ar',
      countryCode: 'BH',
    ),
    LanguageOption(
      displayName: 'Arabic (Egypt)',
      localeCode: 'ar_EG',
      translationCode: 'ar',
      countryCode: 'EG',
    ),
    LanguageOption(
      displayName: 'Arabic (Iraq)',
      localeCode: 'ar_IQ',
      translationCode: 'ar',
      countryCode: 'IQ',
    ),
    LanguageOption(
      displayName: 'Arabic (Jordan)',
      localeCode: 'ar_JO',
      translationCode: 'ar',
      countryCode: 'JO',
    ),
    LanguageOption(
      displayName: 'Arabic (Kuwait)',
      localeCode: 'ar_KW',
      translationCode: 'ar',
      countryCode: 'KW',
    ),
    LanguageOption(
      displayName: 'Arabic (Lebanon)',
      localeCode: 'ar_LB',
      translationCode: 'ar',
      countryCode: 'LB',
    ),
    LanguageOption(
      displayName: 'Arabic (Libya)',
      localeCode: 'ar_LY',
      translationCode: 'ar',
      countryCode: 'LY',
    ),
    LanguageOption(
      displayName: 'Arabic (Morocco)',
      localeCode: 'ar_MA',
      translationCode: 'ar',
      countryCode: 'MA',
    ),
    LanguageOption(
      displayName: 'Arabic (Oman)',
      localeCode: 'ar_OM',
      translationCode: 'ar',
      countryCode: 'OM',
    ),
    LanguageOption(
      displayName: 'Arabic (Qatar)',
      localeCode: 'ar_QA',
      translationCode: 'ar',
      countryCode: 'QA',
    ),
    LanguageOption(
      displayName: 'Arabic (Saudi Arabia)',
      localeCode: 'ar_SA',
      translationCode: 'ar',
      countryCode: 'SA',
    ),
    LanguageOption(
      displayName: 'Arabic (Syria)',
      localeCode: 'ar_SY',
      translationCode: 'ar',
      countryCode: 'SY',
    ),
    LanguageOption(
      displayName: 'Arabic (Tunisia)',
      localeCode: 'ar_TN',
      translationCode: 'ar',
      countryCode: 'TN',
    ),
    LanguageOption(
      displayName: 'Arabic (United Arab Emirates)',
      localeCode: 'ar_AE',
      translationCode: 'ar',
      countryCode: 'AE',
    ),
    LanguageOption(
      displayName: 'Arabic (Yemen)',
      localeCode: 'ar_YE',
      translationCode: 'ar',
      countryCode: 'YE',
    ),
    LanguageOption(
      displayName: 'Armenian (Armenia)',
      localeCode: 'hy_AM',
      translationCode: 'hy',
      countryCode: 'AM',
    ),
    LanguageOption(
      displayName: 'Assamese (India)',
      localeCode: 'as_IN',
      translationCode: 'as',
      countryCode: 'IN',
    ),
    LanguageOption(
      displayName: 'Azerbaijani (Azerbaijan)',
      localeCode: 'az_AZ',
      translationCode: 'az',
      countryCode: 'AZ',
    ),
    LanguageOption(
      displayName: 'Basque (Spain)',
      localeCode: 'eu_ES',
      translationCode: 'eu',
      countryCode: 'ES',
    ),
    LanguageOption(
      displayName: 'Belarusian (Belarus)',
      localeCode: 'be_BY',
      translationCode: 'be',
      countryCode: 'BY',
    ),
    LanguageOption(
      displayName: 'Bengali (Bangladesh)',
      localeCode: 'bn_BD',
      translationCode: 'bn',
      countryCode: 'BD',
    ),
    LanguageOption(
      displayName: 'Bengali (India)',
      localeCode: 'bn_IN',
      translationCode: 'bn',
      countryCode: 'IN',
    ),
    LanguageOption(
      displayName: 'Bosnian (Bosnia and Herzegovina)',
      localeCode: 'bs_BA',
      translationCode: 'bs',
      countryCode: 'BA',
    ),
    LanguageOption(
      displayName: 'Bulgarian (Bulgaria)',
      localeCode: 'bg_BG',
      translationCode: 'bg',
      countryCode: 'BG',
    ),
    LanguageOption(
      displayName: 'Burmese (Myanmar)',
      localeCode: 'my_MM',
      translationCode: 'my',
      countryCode: 'MM',
    ),
    LanguageOption(
      displayName: 'Catalan (Spain)',
      localeCode: 'ca_ES',
      translationCode: 'ca',
      countryCode: 'ES',
    ),
    LanguageOption(
      displayName: 'Chinese (China)',
      localeCode: 'zh_CN',
      translationCode: 'zh-cn',
      countryCode: 'CN',
    ),
    LanguageOption(
      displayName: 'Chinese (Hong Kong)',
      localeCode: 'zh_HK',
      translationCode: 'zh-tw',
      countryCode: 'HK',
    ),
    LanguageOption(
      displayName: 'Chinese (Macau)',
      localeCode: 'zh_MO',
      translationCode: 'zh-tw',
      countryCode: 'MO',
    ),
    LanguageOption(
      displayName: 'Chinese (Singapore)',
      localeCode: 'zh_SG',
      translationCode: 'zh-cn',
      countryCode: 'SG',
    ),
    LanguageOption(
      displayName: 'Chinese (Taiwan)',
      localeCode: 'zh_TW',
      translationCode: 'zh-tw',
      countryCode: 'TW',
    ),
    LanguageOption(
      displayName: 'Croatian (Croatia)',
      localeCode: 'hr_HR',
      translationCode: 'hr',
      countryCode: 'HR',
    ),
    LanguageOption(
      displayName: 'Czech (Czechia)',
      localeCode: 'cs_CZ',
      translationCode: 'cs',
      countryCode: 'CZ',
    ),
    LanguageOption(
      displayName: 'Danish (Denmark)',
      localeCode: 'da_DK',
      translationCode: 'da',
      countryCode: 'DK',
    ),
    LanguageOption(
      displayName: 'Dutch (Belgium)',
      localeCode: 'nl_BE',
      translationCode: 'nl',
      countryCode: 'BE',
    ),
    LanguageOption(
      displayName: 'Dutch (Netherlands)',
      localeCode: 'nl_NL',
      translationCode: 'nl',
      countryCode: 'NL',
    ),
    LanguageOption(
      displayName: 'English (Australia)',
      localeCode: 'en_AU',
      translationCode: 'en',
      countryCode: 'AU',
    ),
    LanguageOption(
      displayName: 'English (Canada)',
      localeCode: 'en_CA',
      translationCode: 'en',
      countryCode: 'CA',
    ),
    LanguageOption(
      displayName: 'English (Hong Kong)',
      localeCode: 'en_HK',
      translationCode: 'en',
      countryCode: 'HK',
    ),
    LanguageOption(
      displayName: 'English (India)',
      localeCode: 'en_IN',
      translationCode: 'en',
      countryCode: 'IN',
    ),
    LanguageOption(
      displayName: 'English (Ireland)',
      localeCode: 'en_IE',
      translationCode: 'en',
      countryCode: 'IE',
    ),
    LanguageOption(
      displayName: 'English (Malaysia)',
      localeCode: 'en_MY',
      translationCode: 'en',
      countryCode: 'MY',
    ),
    LanguageOption(
      displayName: 'English (New Zealand)',
      localeCode: 'en_NZ',
      translationCode: 'en',
      countryCode: 'NZ',
    ),
    LanguageOption(
      displayName: 'English (Pakistan)',
      localeCode: 'en_PK',
      translationCode: 'en',
      countryCode: 'PK',
    ),
    LanguageOption(
      displayName: 'English (Philippines)',
      localeCode: 'en_PH',
      translationCode: 'en',
      countryCode: 'PH',
    ),
    LanguageOption(
      displayName: 'English (Singapore)',
      localeCode: 'en_SG',
      translationCode: 'en',
      countryCode: 'SG',
    ),
    LanguageOption(
      displayName: 'English (South Africa)',
      localeCode: 'en_ZA',
      translationCode: 'en',
      countryCode: 'ZA',
    ),
    LanguageOption(
      displayName: 'English (United Kingdom)',
      localeCode: 'en_GB',
      translationCode: 'en',
      countryCode: 'GB',
    ),
    LanguageOption(
      displayName: 'English (United States)',
      localeCode: 'en_US',
      translationCode: 'en',
      countryCode: 'US',
    ),
    LanguageOption(
      displayName: 'Estonian (Estonia)',
      localeCode: 'et_EE',
      translationCode: 'et',
      countryCode: 'EE',
    ),
    LanguageOption(
      displayName: 'Filipino (Philippines)',
      localeCode: 'fil_PH',
      translationCode: 'tl',
      countryCode: 'PH',
    ),
    LanguageOption(
      displayName: 'Finnish (Finland)',
      localeCode: 'fi_FI',
      translationCode: 'fi',
      countryCode: 'FI',
    ),
    LanguageOption(
      displayName: 'French (Belgium)',
      localeCode: 'fr_BE',
      translationCode: 'fr',
      countryCode: 'BE',
    ),
    LanguageOption(
      displayName: 'French (Canada)',
      localeCode: 'fr_CA',
      translationCode: 'fr',
      countryCode: 'CA',
    ),
    LanguageOption(
      displayName: 'French (France)',
      localeCode: 'fr_FR',
      translationCode: 'fr',
      countryCode: 'FR',
    ),
    LanguageOption(
      displayName: 'French (Luxembourg)',
      localeCode: 'fr_LU',
      translationCode: 'fr',
      countryCode: 'LU',
    ),
    LanguageOption(
      displayName: 'French (Morocco)',
      localeCode: 'fr_MA',
      translationCode: 'fr',
      countryCode: 'MA',
    ),
    LanguageOption(
      displayName: 'French (Senegal)',
      localeCode: 'fr_SN',
      translationCode: 'fr',
      countryCode: 'SN',
    ),
    LanguageOption(
      displayName: 'French (Switzerland)',
      localeCode: 'fr_CH',
      translationCode: 'fr',
      countryCode: 'CH',
    ),
    LanguageOption(
      displayName: 'Galician (Spain)',
      localeCode: 'gl_ES',
      translationCode: 'gl',
      countryCode: 'ES',
    ),
    LanguageOption(
      displayName: 'Georgian (Georgia)',
      localeCode: 'ka_GE',
      translationCode: 'ka',
      countryCode: 'GE',
    ),
    LanguageOption(
      displayName: 'German (Austria)',
      localeCode: 'de_AT',
      translationCode: 'de',
      countryCode: 'AT',
    ),
    LanguageOption(
      displayName: 'German (Germany)',
      localeCode: 'de_DE',
      translationCode: 'de',
      countryCode: 'DE',
    ),
    LanguageOption(
      displayName: 'German (Liechtenstein)',
      localeCode: 'de_LI',
      translationCode: 'de',
      countryCode: 'LI',
    ),
    LanguageOption(
      displayName: 'German (Luxembourg)',
      localeCode: 'de_LU',
      translationCode: 'de',
      countryCode: 'LU',
    ),
    LanguageOption(
      displayName: 'German (Switzerland)',
      localeCode: 'de_CH',
      translationCode: 'de',
      countryCode: 'CH',
    ),
    LanguageOption(
      displayName: 'Greek (Greece)',
      localeCode: 'el_GR',
      translationCode: 'el',
      countryCode: 'GR',
    ),
    LanguageOption(
      displayName: 'Gujarati (India)',
      localeCode: 'gu_IN',
      translationCode: 'gu',
      countryCode: 'IN',
    ),
    LanguageOption(
      displayName: 'Haitian Creole (Haiti)',
      localeCode: 'ht_HT',
      translationCode: 'ht',
      countryCode: 'HT',
    ),
    LanguageOption(
      displayName: 'Hausa (Nigeria)',
      localeCode: 'ha_NG',
      translationCode: 'ha',
      countryCode: 'NG',
    ),
    LanguageOption(
      displayName: 'Hebrew (Israel)',
      localeCode: 'he_IL',
      translationCode: 'he',
      countryCode: 'IL',
    ),
    LanguageOption(
      displayName: 'Hindi (India)',
      localeCode: 'hi_IN',
      translationCode: 'hi',
      countryCode: 'IN',
    ),
    LanguageOption(
      displayName: 'Hungarian (Hungary)',
      localeCode: 'hu_HU',
      translationCode: 'hu',
      countryCode: 'HU',
    ),
    LanguageOption(
      displayName: 'Icelandic (Iceland)',
      localeCode: 'is_IS',
      translationCode: 'is',
      countryCode: 'IS',
    ),
    LanguageOption(
      displayName: 'Igbo (Nigeria)',
      localeCode: 'ig_NG',
      translationCode: 'ig',
      countryCode: 'NG',
    ),
    LanguageOption(
      displayName: 'Indonesian (Indonesia)',
      localeCode: 'id_ID',
      translationCode: 'id',
      countryCode: 'ID',
    ),
    LanguageOption(
      displayName: 'Irish (Ireland)',
      localeCode: 'ga_IE',
      translationCode: 'ga',
      countryCode: 'IE',
    ),
    LanguageOption(
      displayName: 'Italian (Italy)',
      localeCode: 'it_IT',
      translationCode: 'it',
      countryCode: 'IT',
    ),
    LanguageOption(
      displayName: 'Italian (Switzerland)',
      localeCode: 'it_CH',
      translationCode: 'it',
      countryCode: 'CH',
    ),
    LanguageOption(
      displayName: 'Japanese (Japan)',
      localeCode: 'ja_JP',
      translationCode: 'ja',
      countryCode: 'JP',
    ),
    LanguageOption(
      displayName: 'Kannada (India)',
      localeCode: 'kn_IN',
      translationCode: 'kn',
      countryCode: 'IN',
    ),
    LanguageOption(
      displayName: 'Kazakh (Kazakhstan)',
      localeCode: 'kk_KZ',
      translationCode: 'kk',
      countryCode: 'KZ',
    ),
    LanguageOption(
      displayName: 'Khmer (Cambodia)',
      localeCode: 'km_KH',
      translationCode: 'km',
      countryCode: 'KH',
    ),
    LanguageOption(
      displayName: 'Korean (South Korea)',
      localeCode: 'ko_KR',
      translationCode: 'ko',
      countryCode: 'KR',
    ),
    LanguageOption(
      displayName: 'Lao (Laos)',
      localeCode: 'lo_LA',
      translationCode: 'lo',
      countryCode: 'LA',
    ),
    LanguageOption(
      displayName: 'Latvian (Latvia)',
      localeCode: 'lv_LV',
      translationCode: 'lv',
      countryCode: 'LV',
    ),
    LanguageOption(
      displayName: 'Lithuanian (Lithuania)',
      localeCode: 'lt_LT',
      translationCode: 'lt',
      countryCode: 'LT',
    ),
    LanguageOption(
      displayName: 'Macedonian (North Macedonia)',
      localeCode: 'mk_MK',
      translationCode: 'mk',
      countryCode: 'MK',
    ),
    LanguageOption(
      displayName: 'Malay (Malaysia)',
      localeCode: 'ms_MY',
      translationCode: 'ms',
      countryCode: 'MY',
    ),
    LanguageOption(
      displayName: 'Malayalam (India)',
      localeCode: 'ml_IN',
      translationCode: 'ml',
      countryCode: 'IN',
    ),
    LanguageOption(
      displayName: 'Maori (New Zealand)',
      localeCode: 'mi_NZ',
      translationCode: 'mi',
      countryCode: 'NZ',
    ),
    LanguageOption(
      displayName: 'Marathi (India)',
      localeCode: 'mr_IN',
      translationCode: 'mr',
      countryCode: 'IN',
    ),
    LanguageOption(
      displayName: 'Mongolian (Mongolia)',
      localeCode: 'mn_MN',
      translationCode: 'mn',
      countryCode: 'MN',
    ),
    LanguageOption(
      displayName: 'Nepali (Nepal)',
      localeCode: 'ne_NP',
      translationCode: 'ne',
      countryCode: 'NP',
    ),
    LanguageOption(
      displayName: 'Norwegian (Norway)',
      localeCode: 'nb_NO',
      translationCode: 'no',
      countryCode: 'NO',
    ),
    LanguageOption(
      displayName: 'Odia (India)',
      localeCode: 'or_IN',
      translationCode: 'or',
      countryCode: 'IN',
    ),
    LanguageOption(
      displayName: 'Pashto (Afghanistan)',
      localeCode: 'ps_AF',
      translationCode: 'ps',
      countryCode: 'AF',
    ),
    LanguageOption(
      displayName: 'Persian (Iran)',
      localeCode: 'fa_IR',
      translationCode: 'fa',
      countryCode: 'IR',
    ),
    LanguageOption(
      displayName: 'Polish (Poland)',
      localeCode: 'pl_PL',
      translationCode: 'pl',
      countryCode: 'PL',
    ),
    LanguageOption(
      displayName: 'Portuguese (Angola)',
      localeCode: 'pt_AO',
      translationCode: 'pt',
      countryCode: 'AO',
    ),
    LanguageOption(
      displayName: 'Portuguese (Brazil)',
      localeCode: 'pt_BR',
      translationCode: 'pt',
      countryCode: 'BR',
    ),
    LanguageOption(
      displayName: 'Portuguese (Mozambique)',
      localeCode: 'pt_MZ',
      translationCode: 'pt',
      countryCode: 'MZ',
    ),
    LanguageOption(
      displayName: 'Portuguese (Portugal)',
      localeCode: 'pt_PT',
      translationCode: 'pt',
      countryCode: 'PT',
    ),
    LanguageOption(
      displayName: 'Punjabi (India)',
      localeCode: 'pa_IN',
      translationCode: 'pa',
      countryCode: 'IN',
    ),
    LanguageOption(
      displayName: 'Romanian (Moldova)',
      localeCode: 'ro_MD',
      translationCode: 'ro',
      countryCode: 'MD',
    ),
    LanguageOption(
      displayName: 'Romanian (Romania)',
      localeCode: 'ro_RO',
      translationCode: 'ro',
      countryCode: 'RO',
    ),
    LanguageOption(
      displayName: 'Russian (Kazakhstan)',
      localeCode: 'ru_KZ',
      translationCode: 'ru',
      countryCode: 'KZ',
    ),
    LanguageOption(
      displayName: 'Russian (Russia)',
      localeCode: 'ru_RU',
      translationCode: 'ru',
      countryCode: 'RU',
    ),
    LanguageOption(
      displayName: 'Serbian (Serbia)',
      localeCode: 'sr_RS',
      translationCode: 'sr',
      countryCode: 'RS',
    ),
    LanguageOption(
      displayName: 'Sinhala (Sri Lanka)',
      localeCode: 'si_LK',
      translationCode: 'si',
      countryCode: 'LK',
    ),
    LanguageOption(
      displayName: 'Slovak (Slovakia)',
      localeCode: 'sk_SK',
      translationCode: 'sk',
      countryCode: 'SK',
    ),
    LanguageOption(
      displayName: 'Slovenian (Slovenia)',
      localeCode: 'sl_SI',
      translationCode: 'sl',
      countryCode: 'SI',
    ),
    LanguageOption(
      displayName: 'Somali (Somalia)',
      localeCode: 'so_SO',
      translationCode: 'so',
      countryCode: 'SO',
    ),
    LanguageOption(
      displayName: 'Spanish (Argentina)',
      localeCode: 'es_AR',
      translationCode: 'es',
      countryCode: 'AR',
    ),
    LanguageOption(
      displayName: 'Spanish (Bolivia)',
      localeCode: 'es_BO',
      translationCode: 'es',
      countryCode: 'BO',
    ),
    LanguageOption(
      displayName: 'Spanish (Chile)',
      localeCode: 'es_CL',
      translationCode: 'es',
      countryCode: 'CL',
    ),
    LanguageOption(
      displayName: 'Spanish (Colombia)',
      localeCode: 'es_CO',
      translationCode: 'es',
      countryCode: 'CO',
    ),
    LanguageOption(
      displayName: 'Spanish (Costa Rica)',
      localeCode: 'es_CR',
      translationCode: 'es',
      countryCode: 'CR',
    ),
    LanguageOption(
      displayName: 'Spanish (Dominican Republic)',
      localeCode: 'es_DO',
      translationCode: 'es',
      countryCode: 'DO',
    ),
    LanguageOption(
      displayName: 'Spanish (Ecuador)',
      localeCode: 'es_EC',
      translationCode: 'es',
      countryCode: 'EC',
    ),
    LanguageOption(
      displayName: 'Spanish (El Salvador)',
      localeCode: 'es_SV',
      translationCode: 'es',
      countryCode: 'SV',
    ),
    LanguageOption(
      displayName: 'Spanish (Guatemala)',
      localeCode: 'es_GT',
      translationCode: 'es',
      countryCode: 'GT',
    ),
    LanguageOption(
      displayName: 'Spanish (Honduras)',
      localeCode: 'es_HN',
      translationCode: 'es',
      countryCode: 'HN',
    ),
    LanguageOption(
      displayName: 'Spanish (Mexico)',
      localeCode: 'es_MX',
      translationCode: 'es',
      countryCode: 'MX',
    ),
    LanguageOption(
      displayName: 'Spanish (Nicaragua)',
      localeCode: 'es_NI',
      translationCode: 'es',
      countryCode: 'NI',
    ),
    LanguageOption(
      displayName: 'Spanish (Panama)',
      localeCode: 'es_PA',
      translationCode: 'es',
      countryCode: 'PA',
    ),
    LanguageOption(
      displayName: 'Spanish (Paraguay)',
      localeCode: 'es_PY',
      translationCode: 'es',
      countryCode: 'PY',
    ),
    LanguageOption(
      displayName: 'Spanish (Peru)',
      localeCode: 'es_PE',
      translationCode: 'es',
      countryCode: 'PE',
    ),
    LanguageOption(
      displayName: 'Spanish (Puerto Rico)',
      localeCode: 'es_PR',
      translationCode: 'es',
      countryCode: 'PR',
    ),
    LanguageOption(
      displayName: 'Spanish (Spain)',
      localeCode: 'es_ES',
      translationCode: 'es',
      countryCode: 'ES',
    ),
    LanguageOption(
      displayName: 'Spanish (United States)',
      localeCode: 'es_US',
      translationCode: 'es',
      countryCode: 'US',
    ),
    LanguageOption(
      displayName: 'Spanish (Uruguay)',
      localeCode: 'es_UY',
      translationCode: 'es',
      countryCode: 'UY',
    ),
    LanguageOption(
      displayName: 'Spanish (Venezuela)',
      localeCode: 'es_VE',
      translationCode: 'es',
      countryCode: 'VE',
    ),
    LanguageOption(
      displayName: 'Swahili (Kenya)',
      localeCode: 'sw_KE',
      translationCode: 'sw',
      countryCode: 'KE',
    ),
    LanguageOption(
      displayName: 'Swahili (Tanzania)',
      localeCode: 'sw_TZ',
      translationCode: 'sw',
      countryCode: 'TZ',
    ),
    LanguageOption(
      displayName: 'Swedish (Sweden)',
      localeCode: 'sv_SE',
      translationCode: 'sv',
      countryCode: 'SE',
    ),
    LanguageOption(
      displayName: 'Tamil (India)',
      localeCode: 'ta_IN',
      translationCode: 'ta',
      countryCode: 'IN',
    ),
    LanguageOption(
      displayName: 'Tamil (Singapore)',
      localeCode: 'ta_SG',
      translationCode: 'ta',
      countryCode: 'SG',
    ),
    LanguageOption(
      displayName: 'Telugu (India)',
      localeCode: 'te_IN',
      translationCode: 'te',
      countryCode: 'IN',
    ),
    LanguageOption(
      displayName: 'Thai (Thailand)',
      localeCode: 'th_TH',
      translationCode: 'th',
      countryCode: 'TH',
    ),
    LanguageOption(
      displayName: 'Turkish (Turkey)',
      localeCode: 'tr_TR',
      translationCode: 'tr',
      countryCode: 'TR',
    ),
    LanguageOption(
      displayName: 'Ukrainian (Ukraine)',
      localeCode: 'uk_UA',
      translationCode: 'uk',
      countryCode: 'UA',
    ),
    LanguageOption(
      displayName: 'Urdu (India)',
      localeCode: 'ur_IN',
      translationCode: 'ur',
      countryCode: 'IN',
    ),
    LanguageOption(
      displayName: 'Urdu (Pakistan)',
      localeCode: 'ur_PK',
      translationCode: 'ur',
      countryCode: 'PK',
    ),
    LanguageOption(
      displayName: 'Uzbek (Uzbekistan)',
      localeCode: 'uz_UZ',
      translationCode: 'uz',
      countryCode: 'UZ',
    ),
    LanguageOption(
      displayName: 'Vietnamese (Vietnam)',
      localeCode: 'vi_VN',
      translationCode: 'vi',
      countryCode: 'VN',
    ),
    LanguageOption(
      displayName: 'Welsh (United Kingdom)',
      localeCode: 'cy_GB',
      translationCode: 'cy',
      countryCode: 'GB',
    ),
    LanguageOption(
      displayName: 'Xhosa (South Africa)',
      localeCode: 'xh_ZA',
      translationCode: 'xh',
      countryCode: 'ZA',
    ),
    LanguageOption(
      displayName: 'Yoruba (Nigeria)',
      localeCode: 'yo_NG',
      translationCode: 'yo',
      countryCode: 'NG',
    ),
    LanguageOption(
      displayName: 'Zulu (South Africa)',
      localeCode: 'zu_ZA',
      translationCode: 'zu',
      countryCode: 'ZA',
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
