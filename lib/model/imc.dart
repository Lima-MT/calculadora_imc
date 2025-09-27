class Imc {
  final int id;
  final double peso;
  final double altura;
  double? imcNumber;
  String? resultadoImc;

  Imc({
    required this.id,
    required this.altura,
    required this.peso,
    this.imcNumber,
    this.resultadoImc,
  });
}
