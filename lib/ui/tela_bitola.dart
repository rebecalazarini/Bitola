import 'package:flutter/material.dart';
import 'calculo_bitola.dart';

class TelaBitola extends StatefulWidget {
  @override
  _TelaBitolaState createState() => _TelaBitolaState();
}

class _TelaBitolaState extends State<TelaBitola> {
  final correnteCtrl = TextEditingController();
  final distanciaCtrl = TextEditingController();

  double? bitola110;
  double? bitola220;

  // Função simples para formatar valores
  String formatarValor(double valor) {
    return valor.toStringAsFixed(2).replaceAll('.', ',');
  }

  void calcular() {
    final corrente = double.tryParse(correnteCtrl.text) ?? 0;
    final distancia = double.tryParse(distanciaCtrl.text) ?? 0;

    setState(() {
      bitola110 = BitolaHelper.bitola110(corrente, distancia);
      bitola220 = BitolaHelper.bitola220(corrente, distancia);
    });
  }

  @override
  void dispose() {
    correnteCtrl.dispose();
    distanciaCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculadora de Bitola')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: correnteCtrl,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Corrente (A)'),
            ),
            TextField(
              controller: distanciaCtrl,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Distância (m)'),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: calcular, child: Text('Calcular')),
            SizedBox(height: 20),
            if (bitola110 != null && bitola220 != null) ...[
              Text('Bitola para 110V: ${formatarValor(bitola110!)} mm²',
                  style: TextStyle(fontSize: 18)),
              Text('Bitola para 220V: ${formatarValor(bitola220!)} mm²',
                  style: TextStyle(fontSize: 18)),
            ],
          ],
        ),
      ),
    );
  }
}
