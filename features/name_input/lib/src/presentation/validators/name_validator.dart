import 'package:name_input/src/domain/entities/name_entity.dart';

class NameValidator {
  static String? isNameValid(
    String? value,
    String emptyNameText,
    String invalidNameText,
  ) {
    var name = Name(value: value);

    if (name.isValid()) {
      return null;
    }

    if (value == null || value.isEmpty) {
      return emptyNameText;
    }

    return invalidNameText;
  }
}
