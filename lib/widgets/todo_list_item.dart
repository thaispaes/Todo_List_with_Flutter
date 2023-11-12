import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_list/views/home_page.dart';

Widget build (BuildContext context) {
    return todoListItem();
}

Widget todoListItem({String? tarefa}) {
  DateTime now = DateTime.now();
  String diaAtual = DateFormat('EEE, dd/MM/yy').format(now);

  return Slidable(
    endActionPane: ActionPane(
      motion: const ScrollMotion(),
      extentRatio: 0.25,
      children: [
       SlidableAction(
          label: 'Delete',
           backgroundColor: Colors.red,
           icon: Icons.delete,
           onPressed: (context){},
       )
      ],
    ),
    child:  Container(
      /*decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.grey[200]
      ),*/
      margin: const EdgeInsets.symmetric(vertical: 2), //Separa os elementos da lista
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
    ),
  );
}