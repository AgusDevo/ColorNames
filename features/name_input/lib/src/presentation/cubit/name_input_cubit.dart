import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:name_input/src/domain/entities/interactor/input_output/name_input_use_case_input.dart';
import 'package:name_input/src/domain/entities/interactor/name_input_use_case.dart';
import 'package:name_input/src/domain/entities/name_entity.dart';

part 'name_input_state.dart';

class NameInputCubit extends Cubit<NameInputState> {
  final NameInputUseCase _nameInputUseCase;

  NameInputCubit({
    required NameInputUseCase loginUseCase,
  })  : _nameInputUseCase = loginUseCase,
        super(NameInputInitial());

  void enableOrDisableButton(String text) {
    emit(NameInputLoading());

    if (text.isEmpty) {
      emit(NameInputDisabled());
    } else {
      emit(NameInputInitial());
    }
  }

  Future<void> nameInput(Name name) async {
    try {
      emit(NameInputLoading());

      var input = NameInputUseCaseInput(
        name: name,
      );
      var result = await _nameInputUseCase.execute(input);

      if (result.hasErrors) {
        emit(NameInputError(result.errors!.toString()));
        return;
      }

      emit(NameInputSuccessful());
    } catch (_) {}
  }
}
