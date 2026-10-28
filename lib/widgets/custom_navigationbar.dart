import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qe_reader/providers/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final  uiProv = Provider.of<UiProvider>(context);
    final currentIndex = uiProv.selectedMenuOpt ;
    return BottomNavigationBar(
      onTap: (value) => uiProv.selectedMenuOpt = value,
      currentIndex: currentIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.map_outlined, color: Colors.white,),
          label: 'Mapa'
          ),

        BottomNavigationBarItem(
          icon: Icon(Icons.compass_calibration_outlined, color: Colors.white,),
          label: 'Direcciones'
          
          )
      ]
      );
  }
}