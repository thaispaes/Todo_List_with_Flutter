import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

Widget build (BuildContext context) {
    return todoListItem();
}

Widget todoListItem({String? tarefa}) {
  DateTime now = DateTime.now();
  String diaAtual = DateFormat('EEE, dd/MM/yy').format(now);

  return Container(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            diaAtual,
          style: const TextStyle(
            fontSize: 12,
          )
        ),
        Text(
            tarefa ?? 'Null',
          style: const TextStyle(
            fontSize: 16,fontWeight: FontWeight.w600,
          )
        ),
      ],
    ),
  );
}