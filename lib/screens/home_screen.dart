import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qe_reader/providers/scan_list_provider.dart';
import 'package:qe_reader/providers/ui_provider.dart';
import 'package:qe_reader/screens/screens.dart';
import 'package:qe_reader/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Historial', style: TextStyle(color: Colors.white),), 
        actions: [IconButton(onPressed: () async {
          final scanListProv = Provider.of<ScanListProvider>(context, listen: false);
          scanListProv.deleteAll();
        }, icon: const Icon(Icons.delete_forever_outlined, color: Colors.white,))],),
      body: const _HomePageBody(),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      );
      
  }
}

class _HomePageBody
 extends StatelessWidget {
  const _HomePageBody
  ({super.key});

  @override
  Widget build(BuildContext context) {
    final  uiProv = Provider.of<UiProvider>(context);
    final currentIndex = uiProv.selectedMenuOpt;

    final scanListProv = Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex){
      case 0:
      scanListProv.uploadScansByType('geo');
      return const MapsSCreen();
      case 1:  
      scanListProv.uploadScansByType('http');
      return const LinksSCreen();
      default: return const MapsSCreen();
    }
  }
}