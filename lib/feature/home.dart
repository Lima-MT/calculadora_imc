import 'package:calculadora_imc/feature/new_imc.dart';
import 'package:calculadora_imc/model/imc.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Imc> imcsSalvo = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final imc = await Navigator.push<Imc>(
            context,
            MaterialPageRoute(builder: (context) => NewImc()),
          );

          if (imc != null) {
            return imcsSalvo.add(imc);
          }
        },
        backgroundColor: Colors.purple,
        elevation: 2,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      appBar: AppBar(
        title: Text(
          'Calculadora de Imc',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bem Vindo:',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Seu peso:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16),
            Text(
              'Sua alturo:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            Text(
              'Seu IMC:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: const Text(
                'Seus Últimos dados',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: imcsSalvo.length,
                itemBuilder: (context, index) {
                  final imc = imcsSalvo[index];
                  return _buildImcIten(imc);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImcIten(Imc imc) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.purple.withValues(alpha: 0.1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Text('Seu peso: ${imc.peso}'),
                const SizedBox(width: 8),
                Text('Sua altura: ${imc.altura}'),
                const SizedBox(width: 8),
                Text('Seu Imc: ${imc.imcNumber}'),
              ],
            ),
            const SizedBox(height: 8),
            Text('Resultado: ${imc.resultadoImc}'),
          ],
        ),
      ),
    );
  }
}
