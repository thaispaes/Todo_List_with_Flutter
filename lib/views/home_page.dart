import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/widgets/todo_list_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState()  => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Variáveis
  final TextEditingController _adicionarTarefaController = TextEditingController();
  late FToast fToast;
  late bool isMorning = false;
  final List<String> tarefas = [];

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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Todo List'),
        ),
        body: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _headerAppbar(),
              _addTaskTextField(),
              _listTaksView(),
              _cleaningTextField()
            ],
        ),
      ),
    );
  }

  //Functions
  void cumprimento() {
    DateTime now = DateTime.now();
    int momentoAtual = DateFormat('HH:mm').format(now) as int;
    isMorning = momentoAtual >= 00.00 && momentoAtual <= 17.00;
  }

  void cleaningTextField() {
    String tarefa = _adicionarTarefaController.text;
    if (tarefa.isEmpty){
      _showToastError();
    } else {
      _adicionarTarefaController.clear();
    }
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
    return Column(
      children: [
        Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20, top: 14),
                      child: TextField(
                        controller: _adicionarTarefaController,
                        decoration: const InputDecoration(
                          labelText: 'Adicionar tarefa',
                          hintText: 'Escreva a tarefa desejada',
                          border: OutlineInputBorder(),
                          /*suffixIcon: IconButton(
                              onPressed: () {cleaningTextFiel();},
                              icon: const Icon(Icons.close)
                          ),*/
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, top: 14),
                    child: ElevatedButton(
                        onPressed: addTaskInList,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(25)
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 20,
                          color: Colors.white,
                        ),
                    ),
                  )
                ],
              ),
      ],
    );
  }

  Widget _listTaksView() {
    return Flexible(
      child: ListView(
          shrinkWrap: true,
        children: [
          for(String tarefa in tarefas)
            ListTile(
              title: todoListItem(tarefa: tarefa)
            )
        ],
        ),
    );
  }

  Widget _cleaningTextField() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          const Expanded(
              child: Text(
                'Você possui 0 tarefas pendentes'
              ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
              onPressed: cleaningTextField,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(14)
              ),
              child: const Text('Limpar Tudo'))
        ],
      ),
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

  void addTaskInList () {
    String text = _adicionarTarefaController.text;

    setState(() {
      tarefas.add(text);
    });

    cleaningTextField();

  }

}