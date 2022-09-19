import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class _LocaleObserver extends WidgetsBindingObserver {
  _LocaleObserver(this._didChangeLocales);
  final void Function(List<Locale>? locales) _didChangeLocales;
  @override
  void didChangeLocales(List<ui.Locale>? locales) {
    _didChangeLocales(locales);
  }
}

final appLocalizationsProvider = Provider<AppLocalizations>((ref) {
  ref.state = lookupAppLocalizations(ui.window.locale);
  final observer = _LocaleObserver((locales) {
    ref.state = lookupAppLocalizations(ui.window.locale);
  });
  final binding = WidgetsBinding.instance;
  binding.addObserver(observer);
  ref.onDispose(
    () => binding.removeObserver(observer),
  );
  return ref.state;
});
