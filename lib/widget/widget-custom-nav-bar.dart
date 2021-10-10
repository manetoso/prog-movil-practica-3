import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarea_3_todo_app/providers/providers.dart';

class CustomNavigationBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //OBTAIN THE selectedMenuOpt FROM UiProvider.dart
    //THE <> SPECIFIES A UNIQUE PROVIDER!!!
    final uiProvider = Provider.of<UiProvider>(context);
    
    final currentIndex = uiProvider.selectedMenuOpt;

    return BottomNavigationBar(
      onTap: ( int i ) => uiProvider.selectedMenuOpt = i,
      currentIndex: currentIndex,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt_rounded),
          label: 'Tareas'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.done_rounded),
          label: 'Por hacer'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.done_all_rounded),
          label: 'Completadas'
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.alarm_off_rounded),
        //   label: 'Sin entregar'
        // ),
      ],
    );
  }
}