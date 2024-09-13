import 'package:flutter/material.dart';
import 'package:shuei_ai_chat/core/helpers/app_constants.dart';
import 'package:shuei_ai_chat/core/theme/app_colors.dart';

class ThemeStyle {
  // ---------- Dark Theme ---------- //
  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: ColorScheme.dark(
        primary: AppColors.dark.colorBrandBlue,
        secondary: AppColors.dark.colorBrandBlue10,
        primaryContainer: AppColors.dark.colorBackgroundPrimary,
        secondaryContainer: AppColors.dark.colorBackgroundSecondary,
        surface: AppColors.dark.colorTextLink,
        surfaceDim: AppColors.dark.colorTextPrimary,
        surfaceTint: AppColors.dark.colorTextSecondary,
        secondaryFixedDim: AppColors.dark.colorGrey10,
        error: AppColors.dark.colorSystemError,
        scrim: AppColors.dark.colorGrey10,
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.dark.colorBrandBlue,
        selectionColor: AppColors.dark.colorBrandBlue10,
        selectionHandleColor: AppColors.dark.colorBrandBlue10,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: AppConstants.textButtonLarge.copyWith(
          color: AppColors.dark.colorGrey50,
        ),
        errorStyle: AppConstants.textFootNoteRegular.copyWith(
          color: AppColors.dark.colorSystemError,
        ),
        errorMaxLines: 2,
        isDense: true,
        isCollapsed: true,
      ),
      splashFactory: NoSplash.splashFactory,
      brightness: Brightness.dark,
      primaryColor: AppColors.dark.colorBrandBlue,
      scaffoldBackgroundColor: AppColors.dark.colorBackgroundPrimary,
      fontFamily: AppConstants.defaultFont,
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        actionsIconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      // Checkbox Theme
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.all(
          AppColors.dark.colorBrandBlue,
        ),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            2.0,
          ),
        ),
      ),
      // Dialog Theme
      dialogTheme: DialogTheme(
        backgroundColor: AppColors.dark.colorBackgroundPrimary,
        titleTextStyle: AppConstants.textHeadingH5.copyWith(
          color: AppColors.dark.colorTextPrimary,
        ),
        contentTextStyle: AppConstants.textBody1Regular.copyWith(
          color: AppColors.dark.colorTextSecondary,
        ),
      ),
      // Switch Theme
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.all(
          Colors.white,
        ),
        trackColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(
            WidgetState.selected,
          )
              ? AppColors.dark.colorBrandBlue
              : null,
        ),
      ),
      useMaterial3: true,
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return null;
            }
            if (states.contains(WidgetState.selected)) {
              return AppColors.dark.colorBrandBlue;
            }
            return null;
          },
        ),
      ),
    );
  }

  // ---------- Light Theme ---------- //
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.light(
        primary: AppColors.light.colorBrandBlue,
        secondary: AppColors.light.colorBrandBlue10,
        primaryContainer: AppColors.light.colorBackgroundPrimary,
        secondaryContainer: AppColors.light.colorBackgroundSecondary,
        surface: AppColors.light.colorTextLink,
        surfaceDim: AppColors.light.colorTextPrimary,
        surfaceTint: AppColors.light.colorTextSecondary,
        secondaryFixedDim: AppColors.light.colorGrey10,
        error: AppColors.light.colorSystemError,
        scrim: AppColors.light.colorBackgroundPrimary,
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.light.colorBrandBlue,
        selectionColor: AppColors.light.colorBrandBlue10,
        selectionHandleColor: AppColors.light.colorBrandBlue10,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: AppConstants.textButtonLarge.copyWith(
          color: AppColors.light.colorGrey50,
        ),
        errorStyle: AppConstants.textFootNoteRegular.copyWith(
          color: AppColors.light.colorSystemError,
        ),
        errorMaxLines: 2,
        isDense: true,
        isCollapsed: true,
      ),
      splashFactory: NoSplash.splashFactory,
      brightness: Brightness.light,
      primaryColor: AppColors.light.colorBrandBlue,
      scaffoldBackgroundColor: AppColors.light.colorBackgroundPrimary,
      fontFamily: AppConstants.defaultFont,
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actionsIconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.all(
          AppColors.light.colorBrandBlue,
        ),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            2.0,
          ),
        ),
      ),
      dialogTheme: DialogTheme(
        backgroundColor: AppColors.light.colorBackgroundPrimary,
        titleTextStyle: AppConstants.textHeadingH5.copyWith(
          color: AppColors.light.colorTextPrimary,
        ),
        contentTextStyle: AppConstants.textBody1Regular.copyWith(
          color: AppColors.light.colorTextSecondary,
        ),
      ),
      // Switch Theme
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.all(
          Colors.black,
        ),
        trackColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? AppColors.light.colorBrandBlue
              : null,
        ),
      ),
      useMaterial3: true,
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return null;
            }
            if (states.contains(WidgetState.selected)) {
              return AppColors.light.colorBrandBlue;
            }
            return null;
          },
        ),
      ),
    );
  }
}
