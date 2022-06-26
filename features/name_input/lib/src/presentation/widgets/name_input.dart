import 'package:core/core.dart';
import 'package:flutter/material.dart';

class NameInput extends StatelessWidget {
  final TextEditingController _nameController;
  final String? Function(String?)? _validator;
  final String _hintText;

  const NameInput({
    Key? key,
    required String? Function(String?) validator,
    required TextEditingController nameController,
    required String hintText,
  })  : _nameController = nameController,
        _validator = validator,
        _hintText = hintText,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.08,
      ),
      child: SizedBox(
        width: double.infinity,
        child: GeminusTextFormField(
          inputDecoration: InputDecoration(
            prefixIcon: const Icon(Icons.contact_mail_outlined),
            hintText: _hintText,
          ),
          controller: _nameController,
          textStyle: const TextStyle(color: Colors.grey),
          validator: _validator,
        ),
      ),
    );
  }
}
