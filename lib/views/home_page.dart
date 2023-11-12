import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState()  => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Variáveis
  final _adicionarTarefaController = TextEditingController();
  late FToast fToast;
  late bool isMorning = false;

  get usuario => 'Thais';

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

  //Functions
  void Cumprimento() {
    DateTime now = DateTime.now();
    int momentoAtual = DateFormat('HH:mm').format(now) as int;
    isMorning = momentoAtual >= 00.00 && momentoAtual <= 17.00;
  }

  //Widgets
  Widget _headerAppbar() {

    String fraseDaManha = 'Espero que sua manhã seja incrível';
    String fraseDaNoite = 'Que você tenha otimos sonhos!';

    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 18),
                    child: Text(
                      isMorning ? 'Bom dia, $usuario' : 'Boa noite, $usuario',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      isMorning ? fraseDaManha : fraseDaNoite
                    ),
                  )
                ],

            ),
          ],
      ),
    );
  }

  Widget _addTaskTextField() {
    return Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 14),
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