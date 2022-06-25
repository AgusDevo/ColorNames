import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GeminusTextFormField extends StatelessWidget {
  final TextEditingController _controller;
  final InputDecoration? _inputDecoration;
  final bool _obscureText;
  final bool _readOnly;
  final TextStyle? _textStyle;
  final TextInputType? _textInputType;
  final Function(String)? _onSubmitted;
  final TextInputAction? _textInputAction;
  final String? _initialVlue;
  final void Function(String)? _onChanged;
  final String? Function(String?)? _validator;
  final List<TextInputFormatter>? _inputFormatters;

  const GeminusTextFormField({
    Key? key,
    required TextEditingController controller,
    Function(String)? onSubmitted,
    Icon? icon,
    InputDecoration? inputDecoration,
    bool obscureText = false,
    bool readOnly = false,
    TextStyle? textStyle,
    TextInputType? textInputType,
    TextInputAction? textInputAction,
    void Function(String)? onChanged,
    String? Function(String?)? validator,
    String? onError,
    String? initialValue,
    String? labelText,
    List<TextInputFormatter>? inputFormatters,
  })  : _controller = controller,
        _inputDecoration = inputDecoration,
        _obscureText = obscureText,
        _readOnly = readOnly,
        _textStyle = textStyle,
        _textInputType = textInputType,
        _onSubmitted = onSubmitted,
        _textInputAction = textInputAction,
        _initialVlue = initialValue,
        _onChanged = onChanged,
        _validator = validator,
        _inputFormatters = inputFormatters,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      decoration: _inputDecoration,
      obscureText: _obscureText,
      style: _textStyle,
      keyboardType: _textInputType,
      onFieldSubmitted: _onSubmitted,
      textInputAction: _textInputAction,
      initialValue: _initialVlue,
      onChanged: _onChanged,
      validator: _validator,
      readOnly: _readOnly,
      inputFormatters: _inputFormatters,
    );
  }
}
