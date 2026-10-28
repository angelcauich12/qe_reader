import 'package:flutter/material.dart';
import 'package:qe_reader/widgets/widgets.dart';

class LinksSCreen extends StatelessWidget {
  const LinksSCreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScansTiles(type: 'http');
  }
}