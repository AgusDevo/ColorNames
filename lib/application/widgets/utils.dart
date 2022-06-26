import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pruebagemi/application/input_provider.dart';
import 'dart:math' as math;

class Utils {
  static generateRandomList(BuildContext context) {
    final inputProvider = Provider.of<InputProvider>(context);
    inputProvider.spacelessName =
        inputProvider.nameController.text.replaceAll(' ', '');

    List<int> newList = fillList(length: 3, range: inputProvider.nameLength!);
    inputProvider.randomNumberList = newList;
    _dialog(inputProvider, context);
  }

  static Future<void> _dialog(
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

  static RichText _colorearTexto(InputProvider inputProvider) {
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

  static List<int> fillList({required int length, required int range}) {
    List<int> randomNumberList = [];
    late int value;
    for (int i = 0; i < length; i++) {
      do {
        value = math.Random().nextInt(5);
      } while (randomNumberList.contains(value));
      randomNumberList.add(value);
    }
    randomNumberList.sort();
    return randomNumberList;
  }
}
