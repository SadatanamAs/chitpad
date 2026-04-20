import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  ThemeData get appTheme => Theme.of(this);
  ColorScheme get appColors => Theme.of(this).colorScheme;
  // textTheme not redefined — use context.theme.textTheme to avoid ambiguous_extension_member_access
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get screenSize => MediaQuery.of(this).size;
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  void showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? colors.error : null,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
