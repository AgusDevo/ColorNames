import 'package:flutter/material.dart';

class RecentlyColored extends StatelessWidget {
  const RecentlyColored({
    Key? key,
    required this.coloredNumberList,
  }) : super(key: key);

  final List<String> coloredNumberList;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade100,
        gradient: LinearGradient(
            colors: [Colors.grey.shade200, Colors.grey.shade100]),
      ),
      child: Center(
        child: Text(
          'Las últimas letras en ser coloreadas fueron: \n \n$coloredNumberList',
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
      ),
    );
  }
}
