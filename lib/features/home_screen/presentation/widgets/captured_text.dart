// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:translator_plus/translator_plus.dart';

// Project imports:
import 'package:translatorx/constants/enums.dart';
import 'package:translatorx/features/home_screen/presentation/cubit/home_screen_cubit_cubit.dart';
import 'package:translatorx/features/language_picker/presentation/cubit/language_picker/language_picker_cubit.dart';
import 'package:translatorx/features/user_settings/presentation/cubits/user_settings/user_settings_cubit.dart';
import 'package:translatorx/features/voice_record/presentation/cubits/voice_record/voice_record_cubit.dart';
import 'package:translatorx/utils/di.dart';

class CapturedText extends StatelessWidget {
  final String speechText;
  final String translation;
  final User userSpeaking;
  final User userScreenType;

  const CapturedText({
    super.key,
    required this.speechText,
    required this.translation,
    required this.userSpeaking,
    required this.userScreenType,
  });

  @override
  Widget build(BuildContext context) {
    final translator = GoogleTranslator();
    final HomeScreenCubit homeScreenCubit = getIt<HomeScreenCubit>();
    Timer? debounce;

    String displayInitialText() {
      return homeScreenCubit.getInitialText(
        userScreenType: userScreenType,
        userSpeaking: userSpeaking,
        translation: translation,
        speechText: speechText,
      );
    }

    Future<void> updateSpeechText({
      required BuildContext currentContext,
      required String text,
      required String sourceLanguage,
      required String targetLanguage,
    }) async {
      final languagePickerCubit = currentContext.read<LanguagePickerCubit>();
      final String sourceTranslationCode =
          languagePickerCubit.getTranslationCode(sourceLanguage);
      final String targetTranslationCode =
          languagePickerCubit.getTranslationCode(targetLanguage);

      if (text.isEmpty) {
        currentContext.read<VoiceRecordCubit>().setInitialState();
      } else {
        await currentContext.read<VoiceRecordCubit>().updateSpeechText(
              text: text,
              sourceLanguage: sourceTranslationCode,
              targetLanguage: targetTranslationCode,
              userSpeaking: userSpeaking,
            );

        final translation = await translator.translate(
          text,
          from: sourceTranslationCode,
          to: targetTranslationCode,
        );

        final FlutterTts ftts = FlutterTts();
        await ftts.setPitch(1);
        await ftts.setVolume(1.0);
        await ftts.setSpeechRate(0.5);
        await ftts.setLanguage(targetLanguage);
        await ftts.speak(translation.text);
      }
    }

    return BlocBuilder<LanguagePickerCubit, LanguagePickerState>(
      builder: (context, languagePickerState) {
        if (languagePickerState is LanguagesSelected) {
          final languagePickerCubit = context.read<LanguagePickerCubit>();

          return Expanded(
            child: SingleChildScrollView(
              child: BlocBuilder<UserSettingsCubit, UserSettingsState>(
                builder: (context, userSettingsState) {
                  if (userSettingsState is UserSettingsInitial) {
                    return FutureBuilder(
                      future: homeScreenCubit.displayHintText(
                        sourceLanguage: languagePickerCubit.getTranslationCode(
                          languagePickerState.sourceLanguage,
                        ),
                        targetLanguage: languagePickerCubit.getTranslationCode(
                          languagePickerState.targetLanguage,
                        ),
                        userScreenType: userScreenType,
                        translator: translator,
                      ),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return TextField(
                            readOnly: userScreenType == User.guest,
                            controller: TextEditingController()
                              ..text = displayInitialText()
                              ..selection = TextSelection.collapsed(
                                  offset: displayInitialText().length),
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.sentences,
                            maxLines: 7,
                            cursorColor: Colors.greenAccent,
                            decoration: InputDecoration(
                              hintText: snapshot.data,
                              border: InputBorder.none,
                            ),
                            textAlign: TextAlign.center,
                            onSubmitted: (value) async {
                              if (debounce?.isActive ?? false) {
                                debounce?.cancel();
                              }
                              await updateSpeechText(
                                currentContext: context,
                                text: value,
                                sourceLanguage:
                                    languagePickerState.sourceLanguage,
                                targetLanguage:
                                    languagePickerState.targetLanguage,
                              );
                            },
                            style: TextStyle(
                              fontSize: context
                                      .read<UserSettingsCubit>()
                                      .getFontSize() +
                                  1,
                            ),
                            onChanged: (value) async {
                              if (debounce?.isActive ?? false) {
                                debounce?.cancel();
                              }
                              debounce = Timer(
                                const Duration(milliseconds: 2500),
                                () async {
                                  await updateSpeechText(
                                    currentContext: context,
                                    text: value,
                                    sourceLanguage:
                                        languagePickerState.sourceLanguage,
                                    targetLanguage:
                                        languagePickerState.targetLanguage,
                                  );
                                },
                              );
                            },
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
