import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pruebagemi/application/input_provider.dart';
import 'package:pruebagemi/application/widgets/colored_history.dart';
import 'package:pruebagemi/application/widgets/user_name_input.dart';
import 'dart:math' as math;

class NombreApellidoWidget extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  NombreApellidoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<InputProvider>(context);
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Column(
                  children: [
                    UserNameInput(nameController: _nameController),
                    Image.network('https://i.imgur.com/A3evXUF.png'),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10)),
                      child: TextButton(
                        onPressed: () {
                          _generateRandomList(context);
                        },
                        child: const Text('Colorear Nombre'),
                      ),
                    ),
                  ],
                ),
                ColoredHistory(
                    coloredNumberList: userProvider.coloredNumberList),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container colorButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(10)),
      child: TextButton(
        onPressed: () {
          _generateRandomList(context);
        },
        child: const Text('Colorear Nombre'),
      ),
    );
  }

  _generateRandomList(BuildContext context) {
    final userProvider = Provider.of<InputProvider>(context, listen: false);
    userProvider.userInput = _nameController.text;
    userProvider.spacelessName = _nameController.text.replaceAll(' ', '');
    int nameLength = userProvider.nameLength ?? 0;

    userProvider.randomNumberList = fillList(length: 3, range: nameLength);
    _dialog(userProvider.randomNumberList, context);
  }

  Future<void> _dialog(List<int> randomNumberList, BuildContext context) async {
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
          content: _colorearTexto(context),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                randomNumberList.clear();
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  RichText _colorearTexto(BuildContext context) {
    final userProvider = Provider.of<InputProvider>(context);
    userProvider.coloredNumberList.clear();
    for (int i = 0; i < 3; i++) {
      userProvider.coloredNumberList
          .add(userProvider.spacelessName[userProvider.randomNumberList[i]]);
    }

    return RichText(
      text: TextSpan(
        text: 'El nombre ingresado es: \n',
        style: const TextStyle(color: Colors.black, fontSize: 22),
        children: <TextSpan>[
          TextSpan(
            text: userProvider.spacelessName
                .substring(0, userProvider.randomNumberList[0]),
          ),
          TextSpan(
            text: userProvider.spacelessName[userProvider.randomNumberList[0]],
            style: TextStyle(color: Colors.red.shade800),
          ),
          TextSpan(
            text: userProvider.spacelessName.substring(
                userProvider.randomNumberList[0] + 1,
                userProvider.randomNumberList[1]),
          ),
          TextSpan(
            text: userProvider.spacelessName[userProvider.randomNumberList[1]],
            style: TextStyle(color: Colors.red.shade800),
          ),
          TextSpan(
            text: userProvider.spacelessName.substring(
                userProvider.randomNumberList[1] + 1,
                userProvider.randomNumberList[2]),
          ),
          TextSpan(
            text: userProvider.spacelessName[userProvider.randomNumberList[2]],
            style: TextStyle(color: Colors.red.shade800),
          ),
          TextSpan(
            text: userProvider.spacelessName
                .substring(userProvider.randomNumberList[2] + 1),
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
