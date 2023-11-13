import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../models/Todo.dart';

class TodoListItem extends StatelessWidget{

  const TodoListItem({Key? key, required this.tarefa, required this.onDelete}) :super(key: key);
  final Todo tarefa;
  final Function(Todo tarefa) onDelete;



  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.25,
        children: [
          SlidableAction(
            label: 'Delete',
            backgroundColor: Colors.red,
            icon: Icons.delete,
            onPressed: onDelete(tarefa),
          )
        ],
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 2),
        //Separa os elementos da lista
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
                tarefa.dateTime.toString(),
                style: const TextStyle(
                  fontSize: 12,
                )
            ),
            Text(
                tarefa.title ?? 'Null',
                style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w600,
                )
            ),
          ],
        ),
      ),
    );
  }
}