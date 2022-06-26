import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pruebagemi/application/input_provider.dart';
import 'package:pruebagemi/application/widgets/colored_history.dart';
import 'package:pruebagemi/application/widgets/user_name_input.dart';
import 'dart:math' as math;

class NombreApellido extends StatelessWidget {
  const NombreApellido({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputProvider = Provider.of<InputProvider>(context);
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Geminus',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Column(
                children: [
                  UserNameInput(nameController: inputProvider.nameController),
                  Image.network('https://i.imgur.com/A3evXUF.png'),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                      onPressed: _generateRandomList(inputProvider, context),
                      child: const Text('Colorear Nombre'),
                    ),
                  ),
                ],
              ),
              ColoredHistory(
                  coloredNumberList: inputProvider.coloredNumberList),
            ],
          ),
        ),
      ),
    );
  }

  _generateRandomList(InputProvider inputProvider, BuildContext context) {
    inputProvider.userInput = inputProvider.nameController.text;
    inputProvider.spacelessName =
        inputProvider.nameController.text.replaceAll(' ', '');
    if (inputProvider.nameLength == null) {
      return;
    }
    List<int> newList = fillList(length: 3, range: inputProvider.nameLength!);
    inputProvider.randomNumberList = newList;
    _dialog(inputProvider, context);
  }

  Future<void> _dialog(
      InputProvider inputProvider, BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          elevation: 10,
          title: const Text('¡Colores!'),
          content: _colorearTexto(inputProvider),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                inputProvider.randomNumberList.clear();
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  RichText _colorearTexto(InputProvider inputProvider) {
    inputProvider.coloredNumberList.clear();
    for (var i = 0; i < 3; i++) {
      inputProvider.coloredNumberList
          .add(inputProvider.spacelessName[inputProvider.randomNumberList[i]]);
    }

    return RichText(
      text: TextSpan(
        text: 'El nombre ingresado es: \n',
        style: const TextStyle(color: Colors.black, fontSize: 22),
        children: <TextSpan>[
          TextSpan(
            text: inputProvider.spacelessName
                .substring(0, inputProvider.randomNumberList[0]),
          ),
          TextSpan(
            text:
                inputProvider.spacelessName[inputProvider.randomNumberList[0]],
            style: TextStyle(color: Colors.red.shade800),
          ),
          TextSpan(
            text: inputProvider.spacelessName.substring(
                inputProvider.randomNumberList[0] + 1,
                inputProvider.randomNumberList[1]),
          ),
          TextSpan(
            text:
                inputProvider.spacelessName[inputProvider.randomNumberList[1]],
            style: TextStyle(color: Colors.red.shade800),
          ),
          TextSpan(
            text: inputProvider.spacelessName.substring(
                inputProvider.randomNumberList[1] + 1,
                inputProvider.randomNumberList[2]),
          ),
          TextSpan(
            text:
                inputProvider.spacelessName[inputProvider.randomNumberList[2]],
            style: TextStyle(color: Colors.red.shade800),
          ),
          TextSpan(
            text: inputProvider.spacelessName
                .substring(inputProvider.randomNumberList[2] + 1),
          ),
        ],
      ),
    );
  }
}

List<int> fillList({required int length, required int range}) {
  List<int> randomNumberList = [];
  late int value;
  for (int i = 0; i < length; i++) {
    do {
      value = math.Random().nextInt(range);
    } while (randomNumberList.contains(value));
    randomNumberList.add(value);
  }
  randomNumberList.sort();
  return randomNumberList;
}
