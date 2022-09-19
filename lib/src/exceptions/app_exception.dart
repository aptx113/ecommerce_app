import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_exception.freezed.dart';
part 'app_exception.g.dart';

// Reference: https://codewithandrea.com/articles/app-localizations-outside-widgets-riverpod/#bonus-using-applocalizations-for-error-handling
@freezed
class AppException with _$AppException {
  const factory AppException.permissionDenied() = PermissionDenied;
  const factory AppException.paymentfailed() = PaymentFailed;

  factory AppException.fromJson(Map<String, dynamic> json) =>
      _$AppExceptionFromJson(json);
}

extension AppExceptionMessage on AppException {
  String message(AppLocalizations loc) {
    return when(
        permissionDenied: () => loc.permissionDenied,
        paymentfailed: () => loc.paymentFail);
  }
}
