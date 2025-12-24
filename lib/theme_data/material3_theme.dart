import 'package:flutter/material.dart';

/// Material 3 Expressive Theme for Earphoria
/// Provides a comprehensive, modern design system with dynamic colors and proper component theming
class Material3Theme {
  // Brand Colors - Expressive palette
  static const Color brandPrimary = Color(0xFFFF4D6D); // Vibrant pink/red
  static const Color brandSecondary = Color(0xFF00D9FF); // Bright cyan
  static const Color brandTertiary = Color(0xFFFFB800); // Warm amber

  // Surface Colors
  static const Color surfaceBase = Color(0xFF0A040C); // Deep dark purple-black
  static const Color surfaceContainer = Color(0xFF1A111B);
  static const Color surfaceContainerHigh = Color(0xFF251C27);
  static const Color surfaceContainerHighest = Color(0xFF302833);

  // Text Colors
  static const Color onSurface = Color(0xFFE8DEF8); // Soft purple-white
  static const Color onSurfaceVariant = Color(0xFFCAC4D0);
  static const Color onPrimary = Color(0xFFFFFFFF);

  // State Colors
  static const Color success = Color(0xFF5EFF43);
  static const Color error = Color(0xFFFF5449);
  static const Color warning = Color(0xFFFFB800);

  /// Dark Color Scheme - Material 3 Expressive
  static ColorScheme darkColorScheme() {
    return const ColorScheme.dark(
      // Primary colors
      primary: brandPrimary,
      onPrimary: onPrimary,
      primaryContainer: Color(0xFF93000A),
      onPrimaryContainer: Color(0xFFFFDAD6),

      // Secondary colors
      secondary: brandSecondary,
      onSecondary: Color(0xFF003544),
      secondaryContainer: Color(0xFF004D61),
      onSecondaryContainer: Color(0xFFB8EAFF),

      // Tertiary colors
      tertiary: brandTertiary,
      onTertiary: Color(0xFF3E2E00),
      tertiaryContainer: Color(0xFF5A4300),
      onTertiaryContainer: Color(0xFFFFDEA6),

      // Error colors
      error: error,
      onError: Color(0xFF690005),
      errorContainer: Color(0xFF93000A),
      onErrorContainer: Color(0xFFFFDAD6),

      // Surface colors
      surface: surfaceBase,
      onSurface: onSurface,
      surfaceContainerLowest: Color(0xFF0F0D13),
      surfaceContainerLow: Color(0xFF1D1B20),
      surfaceContainer: surfaceContainer,
      surfaceContainerHigh: surfaceContainerHigh,
      surfaceContainerHighest: surfaceContainerHighest,

      onSurfaceVariant: onSurfaceVariant,

      // Outline colors
      outline: Color(0xFF938F99),
      outlineVariant: Color(0xFF49454F),

      // Other
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFFE6E1E5),
      onInverseSurface: Color(0xFF313033),
      inversePrimary: Color(0xFFBA1A1A),
    );
  }

  /// Typography - Material 3 with custom fonts
  static TextTheme textTheme() {
    return const TextTheme(
      // Display styles - Fjalla (bold, impactful)
      displayLarge: TextStyle(
        fontFamily: 'Fjalla',
        fontSize: 57,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.25,
        height: 1.12,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Fjalla',
        fontSize: 45,
        fontWeight: FontWeight.w400,
        height: 1.16,
      ),
      displaySmall: TextStyle(
        fontFamily: 'Fjalla',
        fontSize: 36,
        fontWeight: FontWeight.w400,
        height: 1.22,
      ),

      // Headline styles - Fjalla
      headlineLarge: TextStyle(
        fontFamily: 'Fjalla',
        fontSize: 32,
        fontWeight: FontWeight.w400,
        height: 1.25,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Fjalla',
        fontSize: 28,
        fontWeight: FontWeight.w400,
        height: 1.29,
      ),
      headlineSmall: TextStyle(
        fontFamily: 'Fjalla',
        fontSize: 24,
        fontWeight: FontWeight.w400,
        height: 1.33,
      ),

      // Title styles - Gilroy (clean, modern)
      titleLarge: TextStyle(
        fontFamily: 'Gilroy',
        fontSize: 22,
        fontWeight: FontWeight.w700,
        height: 1.27,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Gilroy',
        fontSize: 16,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.15,
        height: 1.50,
      ),
      titleSmall: TextStyle(
        fontFamily: 'Gilroy',
        fontSize: 14,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.1,
        height: 1.43,
      ),

      // Body styles - Gilroy
      bodyLarge: TextStyle(
        fontFamily: 'Gilroy',
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        height: 1.50,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Gilroy',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        height: 1.43,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Gilroy',
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        height: 1.33,
      ),

      // Label styles - Gilroy
      labelLarge: TextStyle(
        fontFamily: 'Gilroy',
        fontSize: 14,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.1,
        height: 1.43,
      ),
      labelMedium: TextStyle(
        fontFamily: 'Gilroy',
        fontSize: 12,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.5,
        height: 1.33,
      ),
      labelSmall: TextStyle(
        fontFamily: 'Gilroy',
        fontSize: 11,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.5,
        height: 1.45,
      ),
    );
  }

  /// Shape System - Expressive rounded corners
  static const OutlinedBorder smallShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );

  static const OutlinedBorder mediumShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
  );

  static const OutlinedBorder largeShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(16)),
  );

  static const OutlinedBorder extraLargeShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(28)),
  );

  /// Navigation Bar Theme
  static NavigationBarThemeData navigationBarTheme(ColorScheme colorScheme) {
    return NavigationBarThemeData(
      backgroundColor: surfaceContainer,
      indicatorColor: brandPrimary.withOpacity(0.24),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const IconThemeData(
            color: brandPrimary,
            size: 24,
          );
        }
        return const IconThemeData(
          color: onSurfaceVariant,
          size: 24,
        );
      }),
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const TextStyle(
            fontFamily: 'Gilroy',
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: onSurface,
          );
        }
        return const TextStyle(
          fontFamily: 'Gilroy',
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: onSurfaceVariant,
        );
      }),
      height: 80,
      elevation: 0,
      indicatorShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    );
  }

  /// Navigation Rail Theme
  static NavigationRailThemeData navigationRailTheme(ColorScheme colorScheme) {
    return NavigationRailThemeData(
      backgroundColor: surfaceContainer.withOpacity(0.3),
      indicatorColor: brandPrimary.withOpacity(0.24),
      selectedIconTheme: const IconThemeData(
        color: brandPrimary,
        size: 24,
      ),
      unselectedIconTheme: const IconThemeData(
        color: onSurfaceVariant,
        size: 24,
      ),
      selectedLabelTextStyle: const TextStyle(
        fontFamily: 'Gilroy',
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: onSurface,
      ),
      unselectedLabelTextStyle: const TextStyle(
        fontFamily: 'Gilroy',
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: onSurfaceVariant,
      ),
      indicatorShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    );
  }

  static CardThemeData cardTheme(ColorScheme colorScheme) {
    return CardThemeData(
      color: surfaceContainerHigh,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      margin: const EdgeInsets.all(8),
    );
  }

  /// App Bar Theme
  static AppBarThemeData appBarTheme(ColorScheme colorScheme) {
    return const AppBarThemeData(
      backgroundColor: surfaceBase,
      foregroundColor: onSurface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        fontFamily: 'Fjalla',
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: onSurface,
      ),
      iconTheme: IconThemeData(
        color: onSurface,
        size: 24,
      ),
    );
  }

  /// Filled Button Theme
  static FilledButtonThemeData filledButtonTheme(ColorScheme colorScheme) {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: brandPrimary,
        foregroundColor: onPrimary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        textStyle: const TextStyle(
          fontFamily: 'Gilroy',
          fontSize: 14,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.1,
        ),
      ),
    );
  }

  /// Icon Button Theme
  static IconButtonThemeData iconButtonTheme(ColorScheme colorScheme) {
    return IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: onSurface,
        iconSize: 24,
      ),
    );
  }

  /// Bottom Sheet Theme
  static BottomSheetThemeData bottomSheetTheme(ColorScheme colorScheme) {
    return const BottomSheetThemeData(
      backgroundColor: surfaceContainerHigh,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      elevation: 0,
    );
  }

  /// Search Bar Theme
  static SearchBarThemeData searchBarTheme(ColorScheme colorScheme) {
    return SearchBarThemeData(
      backgroundColor: WidgetStateProperty.all(surfaceContainerHigh),
      surfaceTintColor: WidgetStateProperty.all(Colors.transparent),
      elevation: WidgetStateProperty.all(0),
      shape: WidgetStateProperty.all(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 16),
      ),
      textStyle: WidgetStateProperty.all(
        const TextStyle(
          fontFamily: 'Gilroy',
          fontSize: 16,
          color: onSurface,
        ),
      ),
      hintStyle: WidgetStateProperty.all(
        const TextStyle(
          fontFamily: 'Gilroy',
          fontSize: 16,
          color: onSurfaceVariant,
        ),
      ),
    );
  }

  /// Complete Dark Theme
  static ThemeData darkTheme() {
    final colorScheme = darkColorScheme();

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: textTheme(),

      // Scaffold
      scaffoldBackgroundColor: surfaceBase,

      // Component Themes
      navigationBarTheme: navigationBarTheme(colorScheme),
      navigationRailTheme: navigationRailTheme(colorScheme),
      cardTheme: cardTheme(colorScheme),
      appBarTheme: appBarTheme(colorScheme),
      filledButtonTheme: filledButtonTheme(colorScheme),
      iconButtonTheme: iconButtonTheme(colorScheme),
      bottomSheetTheme: bottomSheetTheme(colorScheme),
      searchBarTheme: searchBarTheme(colorScheme),

      // Icon Theme
      iconTheme: const IconThemeData(
        color: onSurface,
        size: 24,
      ),

      // Progress Indicator
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: brandPrimary,
      ),

      // Text Selection
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: brandPrimary,
        selectionColor: brandPrimary,
        selectionHandleColor: brandPrimary,
      ),

      // Switch
      switchTheme: SwitchThemeData(
        thumbColor: const WidgetStatePropertyAll(onPrimary),
        trackColor: WidgetStateProperty.resolveWith((states) =>
            states.contains(WidgetState.selected)
                ? brandSecondary
                : onSurfaceVariant.withOpacity(0.3)),
        trackOutlineColor: WidgetStateProperty.resolveWith((states) =>
            states.contains(WidgetState.selected)
                ? brandSecondary
                : onSurfaceVariant),
      ),

      // Scrollbar
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: WidgetStateProperty.all(brandPrimary),
        interactive: true,
        radius: const Radius.circular(10),
        thickness: WidgetStateProperty.all(5),
      ),

      // Popup Menu
      popupMenuTheme: PopupMenuThemeData(
        color: surfaceContainerHigh,
        surfaceTintColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        textStyle: const TextStyle(
          fontFamily: 'Gilroy',
          color: onSurface,
        ),
      ),

      // Dropdown Menu
      dropdownMenuTheme: DropdownMenuThemeData(
        menuStyle: MenuStyle(
          backgroundColor: WidgetStateProperty.all(surfaceContainerHigh),
          surfaceTintColor: WidgetStateProperty.all(Colors.transparent),
          shape: WidgetStateProperty.all(mediumShape),
        ),
        textStyle: const TextStyle(
          fontFamily: 'Gilroy',
          color: onSurface,
        ),
      ),

      // Menu
      menuTheme: MenuThemeData(
        style: MenuStyle(
          backgroundColor: WidgetStateProperty.all(surfaceContainerHigh),
          surfaceTintColor: WidgetStateProperty.all(Colors.transparent),
          shape: WidgetStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
        ),
      ),

      // Dialog
      dialogBackgroundColor: surfaceContainerHigh,
      dialogTheme: const DialogThemeData(
        backgroundColor: surfaceContainerHigh,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
    );
  }
}
