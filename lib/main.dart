import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pruebagemi/application/input_provider.dart';
import 'package:pruebagemi/application/nombre_apellido_widget.dart';
import 'package:pruebagemi/application/application_theme.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => InputProvider(),
      child: MaterialApp(
        home: NombreApellidoWidget(),
        theme: ApplicationTheme.light,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
