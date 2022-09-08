// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../common_widgets/custom_text_button.dart';
import '../../../../common_widgets/primary_button.dart';
import '../../../../common_widgets/responsive_scrollable_card.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../localization/app_localizations_of.dart';
import 'email_password_sign_in_state.dart';
import 'string_validators.dart';

class EmailPasswordSignInScreen extends StatelessWidget {
  const EmailPasswordSignInScreen({
    Key? key,
    required this.formType,
  }) : super(key: key);
  final EmailPasswordSignInFormType formType;

  static const emailKey = Key('email');
  static const passwordKey = Key('password');

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class EmailPasswordSignInContents extends StatefulWidget {
  const EmailPasswordSignInContents({
    Key? key,
    this.onSignedIn,
    required this.formType,
  }) : super(key: key);

  final VoidCallback? onSignedIn;
  final EmailPasswordSignInFormType formType;
  @override
  State<EmailPasswordSignInContents> createState() =>
      _EmailPasswordSignInContentsState();
}

class _EmailPasswordSignInContentsState
    extends State<EmailPasswordSignInContents> {
  final _formKey = GlobalKey<FormState>();
  final _node = FocusScopeNode();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String get email => _emailController.text;
  String get password => _passwordController.text;

  var _submitted = false;

  late var _state = EmailPasswordSignInState(formType: widget.formType);

  @override
  void dispose() {
    _node.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit(EmailPasswordSignInState state) async {
    setState(() {
      _submitted = true;
    });
    if (_formKey.currentState!.validate()) {
      widget.onSignedIn?.call();
    }
  }

  void _emailEditingComplete(EmailPasswordSignInState state) {
    if (state.canSubmitEmail(email)) {
      _node.nextFocus();
    }
  }

  void _passwordEditingComplete(EmailPasswordSignInState state) {
    if (!state.canSubmitEmail(email)) {
      _node.previousFocus();
      return;
    }
    _submit(state);
  }

  void _updateFormType(EmailPasswordSignInFormType formType) {
    setState(() {
      _state = _state.copyWith(formType: formType);
    });
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveScrollableCard(
      child: FocusScope(
        node: _node,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              gapH8,
              TextFormField(
                key: EmailPasswordSignInScreen.emailKey,
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: context.localizations!.emailLabel,
                  hintText: context.localizations!.emailHint,
                  enabled: !_state.isLoading,
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) => !_submitted
                    ? null
                    : _state.emailErrorText(email ?? '', context),
                autocorrect: false,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                keyboardAppearance: Brightness.light,
                onEditingComplete: () => _emailEditingComplete(_state),
                inputFormatters: <TextInputFormatter>[
                  ValidatorInputFormatter(
                      editingValidator: EmailEditingRegexValidator())
                ],
              ),
              gapH8,
              TextFormField(
                key: EmailPasswordSignInScreen.passwordKey,
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: _state.passwordLabelText(context),
                  enabled: !_state.isLoading,
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (password) => !_submitted
                    ? null
                    : _state.passwordErrorText(password ?? '', context),
                obscureText: true,
                autocorrect: false,
                textInputAction: TextInputAction.done,
                keyboardAppearance: Brightness.light,
                onEditingComplete: () => _passwordEditingComplete(_state),
              ),
              gapH8,
              PrimaryButton(
                text: _state.primaryButtonText(context),
                isLoading: _state.isLoading,
                onPressed: _state.isLoading ? null : () => _submit(_state),
              ),
              gapH8,
              CustomTextButton(
                text: _state.secondaryButtonText(context),
                onPressed: _state.isLoading
                    ? null
                    : () => _updateFormType(_state.secondaryActionFormType),
              )
            ],
          ),
        ),
      ),
    );
  }
}
