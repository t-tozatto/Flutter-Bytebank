import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Criando Transferência'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: TextField(
                controller: _controladorCampoNumeroConta,
                style: TextStyle(
                  fontSize: 24,
                ),
                decoration: InputDecoration(
                  labelText: 'Número da Conta',
                  hintText: '0000',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: TextField(
                controller: _controladorCampoValor,
                style: TextStyle(
                  fontSize: 24,
                ),
                decoration: InputDecoration(
                  labelText: 'Valor',
                  hintText: '0.00',
                  icon: Icon(Icons.monetization_on),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            RaisedButton(
              onPressed: () {
                final int numeroConta =
                    int.tryParse(_controladorCampoNumeroConta.text);
                final double valor =
                    double.tryParse(_controladorCampoValor.text);
                if (numeroConta != null && valor != null) {
                  final transferenciaCriada = Transferencia(valor, numeroConta);
                  debugPrint('$transferenciaCriada');
                }
              },
              child: Text('Confirmar'),
            )
          ],
        ));
  }
}

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: Column(
        children: [
          ItemTransferencia(Transferencia(100, 1000)),
          ItemTransferencia(Transferencia(200, 1000)),
          ItemTransferencia(Transferencia(300, 1000)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}

class Transferencia {
  Transferencia(this.valor, this.numeroConta);

  final double valor;
  final int numeroConta;

  @override
  String toString() {
    return 'Valor: $valor, Número da Conta: $numeroConta';
  }
}
