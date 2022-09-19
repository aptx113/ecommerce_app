// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../common_widgets/primary_button.dart';
import '../../../common_widgets/responsive_scrollable_card.dart';
import '../../../constants/app_sizes.dart';
import '../../../localization/app_localizations_context.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key, this.onSubmit}) : super(key: key);
  final VoidCallback? onSubmit;

  static const addressKey = Key('address');
  static const townCityKey = Key('townCity');
  static const stateKey = Key('state');
  static const postalCodeKey = Key('postalCode');
  static const countryKey = Key('country');
  static const scrollableKey = Key('addressPageScrollable');

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final _formKey = GlobalKey<FormState>();

  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _postalCodeController = TextEditingController();
  final _countryController = TextEditingController();

  final _isLoading = false;

  @override
  void dispose() {
    _addressController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _postalCodeController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      widget.onSubmit?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveScrollableCard(
      key: AddressScreen.scrollableKey,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AddressFormField(
              formFieldKey: AddressScreen.addressKey,
              controller: _addressController,
              labelText: context.loc!.address,
              keyboardType: TextInputType.streetAddress,
              enabled: !_isLoading,
            ),
            gapH8,
            AddressFormField(
              formFieldKey: AddressScreen.townCityKey,
              controller: _cityController,
              labelText: context.loc!.townCity,
              keyboardType: TextInputType.streetAddress,
              enabled: !_isLoading,
            ),
            gapH8,
            AddressFormField(
              formFieldKey: AddressScreen.stateKey,
              controller: _stateController,
              labelText: context.loc!.state,
              keyboardType: TextInputType.streetAddress,
              enabled: !_isLoading,
            ),
            gapH8,
            AddressFormField(
              formFieldKey: AddressScreen.postalCodeKey,
              controller: _postalCodeController,
              labelText: context.loc!.postalCode,
              keyboardType: TextInputType.streetAddress,
              enabled: !_isLoading,
            ),
            gapH8,
            AddressFormField(
              formFieldKey: AddressScreen.countryKey,
              controller: _countryController,
              labelText: context.loc!.country,
              keyboardType: TextInputType.streetAddress,
              enabled: !_isLoading,
            ),
            gapH8,
            PrimaryButton(
              text: context.loc!.submit,
              onPressed: _submit,
              isLoading: _isLoading,
            )
          ],
        ),
      ),
    );
  }
}

class AddressFormField extends StatelessWidget {
  const AddressFormField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.keyboardType,
    this.enabled = true,
    this.formFieldKey,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final TextInputType? keyboardType;
  final bool enabled;
  final Key? formFieldKey;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: formFieldKey,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        enabled: enabled,
      ),
      autocorrect: true,
      textInputAction: TextInputAction.next,
      keyboardType: keyboardType,
      keyboardAppearance: Brightness.light,
      validator: (value) =>
          value?.isNotEmpty == true ? null : context.loc!.cantBeEmpty,
    );
  }
}
