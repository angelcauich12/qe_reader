import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qe_reader/providers/scan_list_provider.dart';
import 'package:qe_reader/utils/utils.dart';

class ScansTiles extends StatelessWidget {
  final String type;
  const ScansTiles({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
   final scanListProv = Provider.of<ScanListProvider>(context);
    final scans = scanListProv.scans;
    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (BuildContext context, i) => Dismissible(
        key: UniqueKey(),
        background: Container(
          color: const Color(0xffCCDDDD),
        ),
        onDismissed: (DismissDirection direction) {
          Provider.of<ScanListProvider>(context, listen: false).deleteScanById(scans[i].id!);
        },
        child: ListTile(
          leading: Icon(
            type == 'http'
            ? Icons.link_outlined
            : Icons.map, 
            color: Theme.of(context).primaryColor,),
          title: Text(scans[i].valor.toString()),
          subtitle: Text(scans[i].id.toString()),
          trailing: const Icon(Icons.keyboard_arrow_right_outlined),
          onTap: () => launchURL(context, scans[i]),
        ),
      )
      );
  }
}