import 'package:core/core.dart';
import 'package:flutter/material.dart';

class UserNameInput extends StatelessWidget {
  const UserNameInput({
    Key? key,
    required TextEditingController nameController,
  })  : _nameController = nameController,
        super(key: key);

  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: GeminusTextFormField(
        inputDecoration: InputDecoration(
          hintText: 'Nombre y apellido', //'Nombre y apellido'
          border: const OutlineInputBorder(),
          suffixIcon: IconButton(
              onPressed: () {
                _nameController.clear();
              },
              icon: const Icon(Icons.clear)),
        ),
        controller: _nameController,
      ),
    );
  }
}
