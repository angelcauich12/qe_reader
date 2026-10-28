import 'package:flutter/material.dart';
import 'package:qe_reader/Models/scan_model.dart';
import 'package:qe_reader/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier{


  List<ScanModel> scans = [];
  String typeSelected = 'http';

  Future<ScanModel>newScan(String value) async{
    final newScan = ScanModel(valor: value);
    final id = await DBProvider.db.newScan(newScan);
    newScan.id = id;

    if(typeSelected == newScan.tipo){
    scans.add(newScan);
    notifyListeners();
    }

    return newScan;
  }

  uploadScans() async {
    final scans = await DBProvider.db.getAllScans();
    this.scans = [...?scans];
    notifyListeners();
  }

  uploadScansByType(String type) async {
    final scans = await DBProvider.db.getScansByType(type);
    this.scans = [...?scans];
    typeSelected = type;
    notifyListeners();
  }

  deleteAll() async {
    await DBProvider.db.deleteAllScans();
    scans = [];
    notifyListeners();
  }

  deleteScanById(int id) async {
    await DBProvider.db.deleteScan(id);
  }




}