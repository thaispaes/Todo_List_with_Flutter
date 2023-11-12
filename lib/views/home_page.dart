import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState()  => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Variáveis
  final _adicionarTarefaController = TextEditingController();
  late FToast fToast;


  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  void dispose() {
    super.dispose();
    _adicionarTarefaController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: SingleChildScrollView(
        child:  Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _headerAppbar(),
              _addTaskTextField()
            ],
        ),
      ),
    );
  }

  //Widgets
  Widget _headerAppbar() {
    return const Center(
      child: Row(
        children: [
          Text(
            'Teste'
          )
        ],
      ),
    );
  }

  Widget _addTaskTextField() {
    return Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: _adicionarTarefaController,
              decoration: InputDecoration(
                labelText: 'Adicionar tarefa',
                hintText: 'Escreva a tarefa desejada',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                    onPressed: () {
                        String tarefa = _adicionarTarefaController.text;
                        if (tarefa.isEmpty){
                          _showToastError();
                        } else {
                          _adicionarTarefaController.clear();
                        }
                      },
                    icon: const Icon(Icons.close)
                ),
              ),
            ),
          )
    );
  }

  void _showToastError() {
    Widget toast = Container(
      padding:
      const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration:
      BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.red[600],
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.error),
          SizedBox(
            width: 12.0,
          ),
          Text("Campo já está limpo"),
        ],
      ),
    );


    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }

}