import 'package:flutter/material.dart';

class AppConstants {
  // Font.
  static String defaultFont = 'SFProDisplay';

  // Text Style.
  static TextStyle textHeadingH1 = const TextStyle(
    fontSize: 48.0,
    fontWeight: FontWeight.bold,
  );

  static TextStyle textHeadingH2 = const TextStyle(
    fontSize: 40.0,
    fontWeight: FontWeight.bold,
  );

  static TextStyle textHeadingH3 = const TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.w600,
  );

  static TextStyle textHeadingH4 = const TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w600,
  );

  static TextStyle textHeadingH5 = const TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
  );

  static TextStyle textBody1SemiBold = const TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
  );

  static TextStyle textBody1Regular = const TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
  );

  static TextStyle textBody2SemiBold = const TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
  );

  static TextStyle textBody2Regular = const TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
  );

  static TextStyle textButtonLarge = const TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
  );

  static TextStyle textButtonMedium = const TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
  );

  static TextStyle textFootNoteSemiBold = const TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w600,
  );

  static TextStyle textFootNoteRegular = const TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
  );

  // Image
  static String icLogo(BuildContext context) =>
      MediaQuery.platformBrightnessOf(context) == Brightness.dark
          ? 'assets/icon/ic_dark_splash.png'
          : 'assets/icon/ic_splash.png';
  static String icRetry = 'assets/icon/ic_retry.svg';
  static String icPersonalAssistant = 'assets/icon/ic-personal-assistant.jpg';
  static String icPersonalAnimation = 'assets/animation/person-action.gif';
  static String icHomeGrid = 'assets/icon/ic-home-grid.svg';
  static String icHomeList = 'assets/icon/ic-home-list.svg';
  static String icFilter = 'assets/icon/ic-filter.svg';
  static String icFavorite = 'assets/icon/ic-favorite.svg';
  static String icMessage = 'assets/icon/ic-message.svg';
  static String icHolderGrid = 'assets/image/ic-holder-grid.png';
  static String icHolderList = 'assets/image/ic-holder-list.png';
  static String icBottomHomeActive = 'assets/icon/ic-bottom-home-active.svg';
  static String icBottomHomeInActive =
      'assets/icon/ic-bottom-home-inactive.svg';
  static String icBottomFavoriteActive =
      'assets/icon/ic-bottom-favorite-active.svg';
  static String icBottomFavoriteInActive =
      'assets/icon/ic-bottom-favorite-inactive.svg';
  static String icBottomChatActive = 'assets/icon/ic-bottom-chat-active.svg';
  static String icBottomChatInActive =
      'assets/icon/ic-bottom-chat-inactive.svg';
  static String icBottomProfileActive =
      'assets/icon/ic-bottom-profile-active.svg';
  static String icBottomProfileInActive =
      'assets/icon/ic-bottom-profile-inactive.svg';
}
