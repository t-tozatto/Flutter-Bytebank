class Transferencia {
  Transferencia(
    this.valor,
    this.numeroConta,
  );

  final double valor;
  final int numeroConta;

  @override
  String toString() {
    return 'Valor: $valor, Número da Conta: $numeroConta';
  }
}
