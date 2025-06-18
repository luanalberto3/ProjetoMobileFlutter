import 'package:flutter/material.dart';
import 'remedios_dia.dart';

class TelaCadastroRemedio extends StatefulWidget {
  const TelaCadastroRemedio({super.key});

  @override
  State<TelaCadastroRemedio> createState() => _TelaCadastroRemedioState();
}

class _TelaCadastroRemedioState extends State<TelaCadastroRemedio> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController doseController = TextEditingController();
  TimeOfDay? horario;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastrar Remédio')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(labelText: 'Nome do Remédio'),
            ),
            TextField(
              controller: doseController,
              decoration: const InputDecoration(labelText: 'Dose (opcional)'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final TimeOfDay? picked = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (picked != null) {
                  setState(() {
                    horario = picked;
                  });
                }
              },
              child: Text(horario == null
                  ? 'Selecionar Horário'
                  : 'Horário: ${horario!.format(context)}'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (nomeController.text.isNotEmpty && horario != null) {
                  final novo = Remedio(
                    nome: nomeController.text +
                        (doseController.text.isNotEmpty
                            ? ' (${doseController.text})'
                            : ''),
                    horario: horario!.format(context),
                  );
                  Navigator.pop(context, novo);
                }
              },
              child: const Text('Salvar Remédio'),
            )
          ],
        ),
      ),
    );
  }
}
