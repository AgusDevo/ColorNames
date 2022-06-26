import 'package:name_input/src/domain/entities/interactor/input_output/name_input_use_case_input.dart';
import 'package:name_input/src/domain/entities/interactor/input_output/name_input_use_case_output.dart';

abstract class NameInputUseCase {
  Future<NameInputUseCaseOutput> execute(NameInputUseCaseInput input);
}
