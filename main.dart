import 'packagefluttermaterial.dart';
import 'remedios_dia.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner false,
      title 'Lembrete de Remédios',
      home TelaRemediosDia(),
    );
  }
}
