import 'package:equatable/equatable.dart';

class Name extends Equatable {
  final String? value;

  const Name({
    required this.value,
  });

  bool isValid() =>
      value != null &&
      value!.isNotEmpty &&
      RegExp(
        '^[a-zA-Z ]*\$',
        //^(?![\s.]+$)[a-zA-Z\s.]*$
      ).hasMatch(value!);

  @override
  List<Object?> get props => [value];
}
