import 'package:flutter/material.dart';
import 'package:places/ui_commons/ui_image_paths.dart';
import 'package:places/ui_commons/ui_strings.dart';
import 'package:places/ui_screens/onboarding_screen/widget_onboarding_page_template.dart';

List<Widget> widgetsAllOnboardingPages = const [
  WidgetOnboargindPageTemplate(
    onboardingImgPath: UiImagePaths.onboardingPage1,
    onboardingText1: UiStrings.onboarding11,
    onboardingText2: UiStrings.onboarding12,
    isFinalPage: false,
  ),
  WidgetOnboargindPageTemplate(
    onboardingImgPath: UiImagePaths.onboardingPage2,
    onboardingText1: UiStrings.onboarding21,
    onboardingText2: UiStrings.onboarding22,
    isFinalPage: false,
  ),
  WidgetOnboargindPageTemplate(
    onboardingImgPath: UiImagePaths.onboardingPage3,
    onboardingText1: UiStrings.onboarding31,
    onboardingText2: UiStrings.onboarding32,
    isFinalPage: true,
  ),
];
