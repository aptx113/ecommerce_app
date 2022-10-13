import 'package:flutter/material.dart';

import '../../../../localization/string_hardcoded.dart';

class ProductsSearchTextField extends StatefulWidget {
  const ProductsSearchTextField({super.key});

  @override
  State<ProductsSearchTextField> createState() => _ProductsSearchTextFieldState();
}

class _ProductsSearchTextFieldState extends State<ProductsSearchTextField> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: _controller,
      builder: (context, value, _) => TextField(
        controller: _controller,
        autofocus: false,
        style: Theme.of(context).textTheme.headline6,
        decoration: InputDecoration(
          hintText: 'Search products'.hardcoded,
          icon: const Icon(Icons.search),
          suffixIcon: value.text.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    _controller.clear();
                  },
                  icon: const Icon(Icons.clear),
                )
              : null,
        ),
        onChanged: null,
      ),
    );
  }
}
