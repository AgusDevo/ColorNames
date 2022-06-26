import 'package:flutter/material.dart';
import 'package:name_input/src/presentation/validators/name_validator.dart';
import 'package:name_input/src/presentation/widgets/name_input.dart';

class NameForm extends StatelessWidget {
  final String _emptyNameText;
  final String _invalidNameText;
  final String _hintText;
  final bool _isLoading;
  final TextEditingController _nameController;

  const NameForm({
    Key? key,
    required String emptyNameText,
    required String invalidNameText,
    required String hintText,
    required bool isLoading,
    required TextEditingController nameController,
  })  : _emptyNameText = emptyNameText,
        _nameController = nameController,
        _hintText = hintText,
        _invalidNameText = invalidNameText,
        _isLoading = isLoading,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        NameInput(
          nameController: _nameController,
          validator: (value) => NameValidator.isNameValid(
            value,
            _emptyNameText,
            _invalidNameText,
          ),
          hintText: _hintText,
        ),
        _isLoading
            ? const Center(child: CircularProgressIndicator())
            : const SizedBox(),
      ],
    );
  }
}
