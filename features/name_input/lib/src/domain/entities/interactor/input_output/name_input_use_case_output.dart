class NameInputUseCaseOutput {
  late List<String>? errors = [];

  NameInputUseCaseOutput.withData();

  NameInputUseCaseOutput.withErrors({
    required this.errors,
  });

  bool get hasErrors => errors?.isNotEmpty ?? false;
}
