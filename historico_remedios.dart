import 'package:flutter/material.dart';
import 'remedios_dia.dart';

class TelaHistoricoRemedios extends StatelessWidget {
  final List<Remedio> remedios;

  const TelaHistoricoRemedios({super.key, required this.remedios});

  @override
  Widget build(BuildContext context) {
    final List<Remedio> tomados = remedios.where((r) => r.tomado).toList();
    final List<Remedio> naoTomados = remedios.where((r) => !r.tomado).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Histórico de Remédios')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Remédios Tomados:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ...tomados.map((r) => ListTile(
                title: Text(r.nome),
                subtitle: Text('Horário: ${r.horario}'),
                leading: const Icon(Icons.check, color: Colors.green),
              )),
          const SizedBox(height: 24),
          const Text(
            'Remédios Não Tomados:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ...naoTomados.map((r) => ListTile(
                title: Text(r.nome),
                subtitle: Text('Horário: ${r.horario}'),
                leading: const Icon(Icons.close, color: Colors.red),
              )),
        ],
      ),
    );
  }
}
