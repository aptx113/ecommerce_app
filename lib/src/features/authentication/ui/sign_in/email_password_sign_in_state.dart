// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: avoid_web_libraries_in_flutter

import '../../../../localization/app_localizations_context.dart';
import 'string_validators.dart';

enum EmailPasswordSignInFormType { signIn, register }

mixin EmailAndPasswordValidators {
  final StringValidator emailSubmitValidator = EmailSubmitRegexValidator();
  final StringValidator passwordRegisterSubmitValidator =
      MinLengthStringValidator(8);
  final StringValidator passwordSignInSubmitValidator =
      NonEmptyStringValidator();
}

class EmailPasswordSignInState with EmailAndPasswordValidators {
  EmailPasswordSignInState({
    this.formType = EmailPasswordSignInFormType.signIn,
    this.value = const AsyncValue.data(null),
  });

  final EmailPasswordSignInFormType formType;
  final AsyncValue<void> value;

  bool get isLoading => value.isLoading;

  EmailPasswordSignInState copyWith({
    EmailPasswordSignInFormType? formType,
    AsyncValue<void>? value,
  }) {
    return EmailPasswordSignInState(
      formType: formType ?? this.formType,
      value: value ?? this.value,
    );
  }

  @override
  String toString() =>
      'EmailPasswordSignInState(formType: $formType, value: $value)';

  @override
  bool operator ==(covariant EmailPasswordSignInState other) {
    if (identical(this, other)) return true;

    return other.formType == formType && other.value == value;
  }

  @override
  int get hashCode => formType.hashCode ^ value.hashCode;
}

extension EmailPasswordSignInStateX on EmailPasswordSignInState {
  String passwordLabelText(BuildContext context) {
    if (formType == EmailPasswordSignInFormType.register) {
      return context.loc.password8CharactersLabel;
    } else {
      return AppLocalizations.of(context).passwordLabel;
    }
  }

  String primaryButtonText(BuildContext context) {
    if (formType == EmailPasswordSignInFormType.register) {
      return context.loc.createAnAccount;
    } else {
      return context.loc.signIn;
    }
  }

  String secondaryButtonText(BuildContext context) {
    if (formType == EmailPasswordSignInFormType.register) {
      return context.loc.haveAnAccount;
    } else {
      return context.loc.needAnAccount;
    }
  }

  EmailPasswordSignInFormType get secondaryActionFormType {
    if (formType == EmailPasswordSignInFormType.register) {
      return EmailPasswordSignInFormType.signIn;
    } else {
      return EmailPasswordSignInFormType.register;
    }
  }

  String errorAlertTitle(BuildContext context) {
    if (formType == EmailPasswordSignInFormType.register) {
      return context.loc.registrationFailed;
    } else {
      return context.loc.signInFailed;
    }
  }

  String title(BuildContext context) {
    if (formType == EmailPasswordSignInFormType.register) {
      return context.loc.register;
    } else {
      return context.loc.signIn;
    }
  }

  bool canSubmitEmail(String email) {
    return emailSubmitValidator.isValid(email);
  }

  bool canSubmitPassword(String password) {
    if (formType == EmailPasswordSignInFormType.register) {
      return passwordRegisterSubmitValidator.isValid(password);
    }
    return passwordSignInSubmitValidator.isValid(password);
  }

  String? emailErrorText(String email, BuildContext context) {
    final bool showErrorText = !canSubmitEmail(email);
    final String errorText = email.isEmpty
        ? context.loc.invalidEmailEmpty
        : context.loc.invalidEmail;
    return showErrorText ? errorText : null;
  }

  String? passwordErrorText(String password, BuildContext context) {
    final bool showerrorText = !canSubmitPassword(password);
    final String errorText = password.isEmpty
        ? context.loc.invalidPasswordEmpty
        : context.loc.invalidPasswordTooShort;
    return showerrorText ? errorText : null;
  }
}
