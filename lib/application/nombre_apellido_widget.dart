import 'package:flutter/material.dart';
import 'package:pruebagemi/application/input_provider.dart';
import 'package:pruebagemi/application/widgets/colored_history.dart';
import 'package:pruebagemi/application/widgets/user_name_input.dart';
import 'dart:math' as math;

class NombreApellido extends StatelessWidget {
  final int _nameLength;
  final String _userInput;
  final String _spacelessName;
  final List<int> _randomNumberList;
  final List<String> _coloredNumberList;
  const NombreApellido({
    Key? key,
    required int nameLength,
    required String userInput,
    required String spacelessName,
    required List<int> randomNumberList,
    required List<String> coloredNumberList,
  })  : _nameLength = nameLength,
        _userInput = userInput,
        _spacelessName = spacelessName,
        _randomNumberList = randomNumberList,
        _coloredNumberList = coloredNumberList,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class NombreApellidoWidget extends StatefulWidget {
  const NombreApellidoWidget({Key? key}) : super(key: key);

  @override
  State<NombreApellidoWidget> createState() => _NombreApellidoWidgetState();
}

class _NombreApellidoWidgetState extends State<NombreApellidoWidget> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  int nameLength = 0;
  String userInput = '';
  String spacelessName = '';
  List<int> randomNumberList = [];
  List<String> coloredNumberList = [];

  @override
  Widget build(BuildContext context) {
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
                  UserNameInput(nameController: _nameController),
                  Image.network('https://i.imgur.com/A3evXUF.png'),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                      onPressed: _generateRandomList,
                      child: const Text('Colorear Nombre'),
                    ),
                  ),
                ],
              ),
              ColoredHistory(coloredNumberList: coloredNumberList),
            ],
          ),
        ),
      ),
    );
  }

  Container colorButton() {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(10)),
      child: TextButton(
        onPressed: _generateRandomList,
        child: const Text('Colorear Nombre'),
      ),
    );
  }

  _generateRandomList() {
    userInput = _nameController.text;
    spacelessName = _nameController.text.replaceAll(' ', '');
    nameLength = spacelessName.length;

    List<int> newList = fillList(length: 3, range: nameLength);
    _dialog(newList);
    setState(() {});
  }

  Future<void> _dialog(List<int> randomNumberList) async {
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
          content: _colorearTexto(randomNumberList),
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

  RichText _colorearTexto(List<int> randomNumberList) {
    coloredNumberList.clear();
    for (var i = 0; i < 3; i++) {
      coloredNumberList.add(spacelessName[randomNumberList[i]]);
    }

    return RichText(
      text: TextSpan(
        text: 'El nombre ingresado es: \n',
        style: const TextStyle(color: Colors.black, fontSize: 22),
        children: <TextSpan>[
          TextSpan(
            text: spacelessName.substring(0, randomNumberList[0]),
          ),
          TextSpan(
            text: spacelessName[randomNumberList[0]],
            style: TextStyle(color: Colors.red.shade800),
          ),
          TextSpan(
            text: spacelessName.substring(
                randomNumberList[0] + 1, randomNumberList[1]),
          ),
          TextSpan(
            text: spacelessName[randomNumberList[1]],
            style: TextStyle(color: Colors.red.shade800),
          ),
          TextSpan(
            text: spacelessName.substring(
                randomNumberList[1] + 1, randomNumberList[2]),
          ),
          TextSpan(
            text: spacelessName[randomNumberList[2]],
            style: TextStyle(color: Colors.red.shade800),
          ),
          TextSpan(
            text: spacelessName.substring(randomNumberList[2] + 1),
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
