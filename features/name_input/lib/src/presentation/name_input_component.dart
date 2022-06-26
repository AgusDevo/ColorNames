import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:name_input/src/presentation/cubit/name_input_cubit.dart';
import 'package:name_input/src/presentation/widgets/name_form.dart';

class NameInputComponent extends StatefulWidget {
  final NameInputCubit _cubit;
  final Function(BuildContext, String name) _onNameInputSuccessful;
  final Function(BuildContext, String errorMessage) _onNameInputError;
  final String _hintText;
  final String _nameEmptyText;
  final String _nameFormatInvalid;
  NameInputComponent(
      {Key? key,
      required NameInputCubit cubit,
      required Function(BuildContext, String name) onNameInputSuccessful,
      required Function(BuildContext, String errorMessage) onNameInputError,
      required String hintText,
      required String nameEmptyText,
      required String nameFormatInvalid})
      : _cubit = cubit,
        _onNameInputSuccessful = onNameInputSuccessful,
        _onNameInputError = onNameInputError,
        _hintText = hintText,
        _nameEmptyText = nameEmptyText,
        _nameFormatInvalid = nameFormatInvalid,
        super(key: key);

  @override
  State<NameInputComponent> createState() => _NameInputComponentState();
}

class _NameInputComponentState extends State<NameInputComponent> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController();
    _nameController.addListener(
      () => widget._cubit.enableOrDisableButton(_nameController.text),
    );
  }

  @override
  void dispose() {
    super.dispose();

    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NameInputCubit, NameInputState>(
      bloc: widget._cubit,
      listener: (context, state) {
        if (state is NameInputSuccessful) {
          widget._onNameInputSuccessful;
        }
        if (state is NameInputError) {
          widget._onNameInputError(context, state.error);
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: NameForm(
            emptyNameText: widget._nameEmptyText,
            invalidNameText: widget._nameFormatInvalid,
            nameController: _nameController,
            isLoading: state is NameInputLoading,
            hintText: widget._hintText,
          ),
        );
      },
    );
  }
}
