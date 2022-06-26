import 'package:flutter_test/flutter_test.dart';
import 'dart:math' as math;

void main() {
  test('Sumando randoms a la lista, verificar y añadir a newList', () async {
    // Arrange
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

    // Act
    List<int> newList = fillList(length: 3, range: 10);

    // Assert
    expect(newList.length, 3);
  });
}

void testHardcodedData() {
  test(
      'La cantidad de numeros aleatorios a buscar es mayor a la cantidad de letras',
      () async {
    // Arrange
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

    // Act
    List<int> newList = fillList(length: 2, range: 1);

    // Assert
    expect(newList.length, 1);
    //Para completar el test tuve que detenerlo porque estaba en loop infinito. La lista quedó en 1 solo miembro añadido.
    //TODO: Check app freeze if RNG length > range
  });
}
