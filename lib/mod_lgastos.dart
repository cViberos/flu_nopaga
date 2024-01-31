import 'package:flutter/material.dart' show IconData, Color;

class GastosOption {
  final IconData icono;
  final Color colorbase;
  final String titulo;
  final String subtitle;
  final String fecha;

  GastosOption({
    required this.titulo,
    required this.colorbase,
    required this.icono,
    required this.subtitle,
    required this.fecha,
  });
}
