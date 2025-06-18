import 'package:flutter/material.dart';
import 'cadastro_remedio.dart';
import 'historico_remedios.dart';

class Remedio {
  String nome;
  String horario;
  bool tomado;

  Remedio({required this.nome, required this.horario, this.tomado = false});
}

class TelaRemediosDia extends StatefulWidget {
  const TelaRemediosDia({super.key});

  @override
  State<TelaRemediosDia> createState() => _TelaRemediosDiaState();
}

class _TelaRemediosDiaState extends State<TelaRemediosDia> {
  List<Remedio> listaRemedios = [];

  void _adicionarRemedio(Remedio remedio) {
    setState(() {
      listaRemedios.add(remedio);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Remédios do Dia'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TelaHistoricoRemedios(remedios: listaRemedios),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              final novoRemedio = await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const TelaCadastroRemedio()),
              );
              if (novoRemedio != null) _adicionarRemedio(novoRemedio);
            },
          )
        ],
      ),
      body: listaRemedios.isEmpty
          ? const Center(child: Text('Nenhum remédio adicionado para hoje.'))
          : ListView.builder(
              itemCount: listaRemedios.length,
              itemBuilder: (context, index) {
                final remedio = listaRemedios[index];
                return ListTile(
                  leading: Checkbox(
                    value: remedio.tomado,
                    onChanged: (value) {
                      setState(() {
                        remedio.tomado = value!;
                      });
                    },
                  ),
                  title: Text(remedio.nome),
                  subtitle: Text('Horário: ${remedio.horario}'),
                );
              },
            ),
    );
  }
}
