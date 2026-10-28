import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qe_reader/providers/scan_list_provider.dart';
import 'package:qe_reader/utils/utils.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#3D8BEF', 'Cancelar', false, ScanMode.QR);
        //  const barcodeScanRes = 'https://fernado-herrera.com';
        //  const barcodeScanRes = 'geo:20.926275,-89.614500';

       if(barcodeScanRes == '-1'){
          return;
       }  
       
       final scanListProv = Provider.of<ScanListProvider>(context, listen: false);
       final newScan = await scanListProv.newScan(barcodeScanRes);

       launchURL(context, newScan);
        
      }, 
      child: const Icon(Icons.center_focus_strong_outlined),
      );
}
}