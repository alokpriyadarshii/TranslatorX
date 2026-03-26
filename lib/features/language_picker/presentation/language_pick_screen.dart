// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:country_flags/country_flags.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:translatorx/features/language_picker/domain/models/language_option.dart';
import 'package:translatorx/features/language_picker/presentation/cubit/language_picker/language_picker_cubit.dart';
import 'package:translatorx/features/user_settings/presentation/cubits/user_settings/user_settings_cubit.dart';
import 'package:translatorx/features/voice_record/presentation/cubits/voice_record/voice_record_cubit.dart';
import 'package:translatorx/utils/l10n/localization.dart';

class LanguagePickScreen extends StatelessWidget {
  final bool isSelectingSourceLng;

  const LanguagePickScreen({
    super.key,
    required this.isSelectingSourceLng,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<UserSettingsCubit, UserSettingsState>(
        builder: (context, userSettingsState) {
          if (userSettingsState is UserSettingsInitial) {
            final List<LanguageOption> languages =
                context.read<LanguagePickerCubit>().getLanguageList();

            return Scaffold(
              backgroundColor: const Color.fromARGB(255, 213, 210, 210),
              appBar: AppBar(
                backgroundColor: const Color.fromARGB(255, 75, 207, 143),
                title: isSelectingSourceLng
                    ? Text(
                        context.l10n.sourceLanguage,
                        style: TextStyle(
                          fontSize:
                              context.read<UserSettingsCubit>().getFontSize() +
                                  3,
                        ),
                      )
                    : Text(
                        context.l10n.targetLanguage,
                        style: TextStyle(
                          fontSize:
                              context.read<UserSettingsCubit>().getFontSize() +
                                  3,
                        ),
                      ),
                centerTitle: true,
              ),
              body: BlocBuilder<LanguagePickerCubit, LanguagePickerState>(
                builder: (context, languagePickerState) {
                  if (languagePickerState is! LanguagesSelected) {
                    return const SizedBox.shrink();
                  }

                  final String targetLanguage = languagePickerState.targetLanguage;
                  final String sourceLanguage = languagePickerState.sourceLanguage;

                  final List<LanguageOption> availableLanguages =
                      context.read<LanguagePickerCubit>().getAvailableLanguages(
                            isSelectingSourceLng: isSelectingSourceLng,
                            languages: languages,
                            targetLanguage: targetLanguage,
                            sourceLanguage: sourceLanguage,
                          );

                  return BlocBuilder<VoiceRecordCubit, VoiceRecordState>(
                    builder: (context, voiceRecordState) {
                      return ListView.separated(
                        itemCount: availableLanguages.length,
                        separatorBuilder: (context, index) => const Divider(
                          color: Colors.grey,
                          thickness: 2,
                          height: 1,
                        ),
                        itemBuilder: (context, index) {
                          final LanguageOption option = availableLanguages[index];

                          return InkWell(
                            onTap: () async {
                              final languagePickerCubit =
                                  context.read<LanguagePickerCubit>();

                              if (isSelectingSourceLng) {
                                await languagePickerCubit.setSourceLanguage(
                                  language: option.localeCode,
                                );
                                if (!context.mounted) return;
                                context.read<VoiceRecordCubit>().setInitialState();
                              } else {
                                await languagePickerCubit.setTargetLanguage(
                                  language: option.localeCode,
                                );
                                if (!context.mounted) return;

                                if (voiceRecordState is VoiceRecordInitial &&
                                    (voiceRecordState.speechText.isNotEmpty ||
                                        voiceRecordState.translation.isNotEmpty)) {
                                  await context
                                      .read<VoiceRecordCubit>()
                                      .updateSpeechText(
                                        text: voiceRecordState.speechText,
                                        sourceLanguage: languagePickerCubit
                                            .getTranslationCode(sourceLanguage),
                                        targetLanguage: option.translationCode,
                                        userSpeaking:
                                            voiceRecordState.userSpeaking,
                                      );
                                }
                              }

                              if (!context.mounted) return;
                              Navigator.of(context).pop();
                            },
                            child: Row(
                              children: [
                                const SizedBox(width: 10),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: context
                                            .read<UserSettingsCubit>()
                                            .getFontSize() *
                                        0.8,
                                    horizontal: 15,
                                  ),
                                  child: CountryFlag.fromCountryCode(
                                    option.countryCode,
                                    height: 30.7,
                                    width: 39.7,
                                    borderRadius: 8,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Flexible(
                                  child: Text(
                                    option.displayName,
                                    style: TextStyle(
                                      fontSize: context
                                              .read<UserSettingsCubit>()
                                              .getFontSize() -
                                          1,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
