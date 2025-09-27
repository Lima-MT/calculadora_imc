import 'dart:math';

import 'package:calculadora_imc/feature/home.dart';
import 'package:calculadora_imc/model/imc.dart';
import 'package:flutter/material.dart';

class NewImc extends StatefulWidget {
  const NewImc({super.key});

  @override
  State<NewImc> createState() => _NewImcState();
}

class _NewImcState extends State<NewImc> {
  late double imcNumber;
  late String resultadoImc;
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
            child: Text('Cancelar', style: TextStyle(color: Colors.blueAccent)),
          ),
        ],
        centerTitle: true,
        title: Text('Adicione IMC'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            TextField(
              keyboardType: TextInputType.number,
              controller: pesoController,
              decoration: InputDecoration(
                label: Text('Peso'),
                hint: Text('Informe seu Peso'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              keyboardType: TextInputType.number,
              controller: alturaController,
              decoration: InputDecoration(
                label: Text('Altura'),
                hint: Text('Informe sua Altura'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: AlignmentGeometry.center,
              child: ElevatedButton(
                onPressed: () {
                  var random = Random();
                  int id = random.nextInt(100);
                  double peso = double.tryParse(pesoController.text) ?? 0;
                  double altura = double.tryParse(alturaController.text) ?? 0;
                  _calculandoImc(peso, altura);
                  _getResultado(imcNumber);
                  debugPrint(
                    'Salvei usuário com peso: ${pesoController.text}, altura: ${alturaController.text} , imc: $imcNumber e resultado: $resultadoImc',
                  );
                  final imc = Imc(
                    id: id,
                    altura: altura,
                    peso: peso,
                    imcNumber: imcNumber,
                    resultadoImc: resultadoImc,
                  );
                  Navigator.pop(context, imc);
                  pesoController.clear();
                  alturaController.clear();
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                child: Text('Salvar', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _calculandoImc(double peso, double altura) {
    double imc = peso / (altura * altura);
    return imcNumber = imc;
  }

  String _getResultado(double imc) {
    String resultado = 'Informe peso e altura';
    if (imc < 16) {
      return resultado = 'Magreza grave';
    } else if (imc < 17 && imc >= 16) {
      return resultado = 'Magreza moderada';
    } else if (imc < 18.5 && imc >= 17) {
      return resultado = 'Magreza Leve';
    } else if (imc < 25 && imc >= 18.5) {
      return resultado = 'Saudável';
    } else if (imc < 30 && imc >= 25) {
      resultado = 'Sobrepeso';
    } else if (imc < 35 && imc >= 30) {
      resultado = 'Obesidade Grau 1';
    } else if (imc < 40 && imc >= 35) {
      resultado = 'Obesidade Grau 2';
    } else {
      resultado = 'Obesidade Grau 3';
    }
    return resultadoImc = resultado;
  }
}
