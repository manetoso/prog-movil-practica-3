import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarea_3_todo_app/providers/providers.dart';
import 'package:tarea_3_todo_app/widget/widgets.dart';

class HomeScreen extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
      // final taskListProvider = Provider.of<TaskListProvider>(context, listen: false);
      // taskListProvider.loadTask();
      return Scaffold(
        body: HeaderWidget(
          child: _HeaderChildContent()
        ),
        bottomNavigationBar: CustomNavigationBar(),
      );
    }
}

class _HeaderChildContent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //OBTAIN THE selectedMenuOpt FROM UiProvider.dart
    //THE <> SPECIFIES A UNIQUE PROVIDER!!!
    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    final taskListProvider = Provider.of<TaskListProvider>(context, listen: false);

    switch( currentIndex ) {
      case 0:
        taskListProvider.loadTask();
        return TasksList();

      case 1:
      taskListProvider.loadTaskWhereDone(0);
        return TasksList(headerText: 'Tareas por Hacer',);

      case 2:
      taskListProvider.loadTaskWhereDone(1);
        return TasksList(headerText: 'Tareas completadas',);

      default:
        return TasksList();
    }
  }
}