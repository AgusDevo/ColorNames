import 'package:flutter/material.dart';

abstract class NavigationManager {
  Future<T?> navigateTo<T>(
    BuildContext context,
    String route, {
    Object? arguments,
  });

  Future<T?> navigateToAndRemoveUntil<T>(
    BuildContext context,
    String route, {
    Object? arguments,
  });

  void navigatePop(
    BuildContext context,
  );
}
