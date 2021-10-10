import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarea_3_todo_app/constants.dart';
import 'package:tarea_3_todo_app/providers/providers.dart';
import 'package:tarea_3_todo_app/screens/screens.dart';
import 'package:tarea_3_todo_app/widget/widgets.dart';

class TasksList extends StatelessWidget {
  final String? headerText;
  const TasksList({Key? key, this.headerText,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              _TasksListHeader(headerText: headerText != null ? headerText! : null,),
              _TasksList(),
              Fab(
                icon: Icons.add_rounded,
                isRounded: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TasksListHeader extends StatelessWidget {
  final String? headerText;
  const _TasksListHeader({Key? key, this.headerText,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final taskListProvider = Provider.of<TaskListProvider>(context);
    final tasks = taskListProvider.tasks;

    return Column(
      children: [
        SizedBox(height: size.height * 0.18,),
        Container(
          height: 80,
          width: double.infinity,
          // color: Colors.red,
          child: Padding(
            padding: EdgeInsets.only(left: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image.asset('assets/images/calendar.png', height: 50, width: 50,),
                Text( headerText != null ? headerText! : 'Mis Tareas', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: sTextTitle
                ),),
                SizedBox(height: 5,),
                Text('${tasks.length} Tareas en total', style: TextStyle(
                  fontSize: sTextSecondary,
                  fontWeight: FontWeight.bold,
                  color: kTextSecondary
                ),),
                SizedBox(height: 20,),
                Container(
                  height: 2,
                  width: double.infinity,
                  color: kTextSecondary,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _TasksList extends StatelessWidget {
  const _TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final taskListProvider = Provider.of<TaskListProvider>(context);
    final tasks = taskListProvider.tasks;

    compareDate( String dateFormated, int taskId ) {
      final dateNow = DateTime.now();

      final dateToCompare = DateTime.parse(dateFormated);

      print('id task: $taskId');
      if (dateToCompare.compareTo(dateNow) > 0) {
        print('true');
        return true;
      } else {
        print('false');
        return false;
      }
    }

    tasks.forEach((value) {
      
    });

    return SizedBox(
      height: size.height * 0.55,
      width: double.infinity,
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: ( _ , i) => Dismissible(
          onDismissed: (DismissDirection direction) {
            Provider.of<TaskListProvider>(context, listen: false)
            .deleteTaskById(tasks[i]!.id);
          },
          direction: DismissDirection.endToStart,
          key: UniqueKey(),
          background: Container(
            padding: EdgeInsets.only(right: 30),
            color: kred,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(Icons.delete, color: Colors.white, size: 30,)
              ],
            ),
          ),
          child: ListTile(
            onTap: () {
              compareDate(tasks[i]!.dateTask!, tasks[i]!.id!);
              Navigator.pushNamed( _ , 'info', arguments: ScreenArguments(
                tasks[i]!.titleTask,
                tasks[i]!.descTask,
                tasks[i]!.dateTask,
                tasks[i]!.id,
                tasks[i]!.doneTask,
                compareDate(tasks[i]!.dateTask!, tasks[i]!.id!),
              ));
              compareDate(tasks[i]!.dateTask!, tasks[i]!.id!);
            },
            title: Text(
              '${tasks[i]!.titleTask} ${tasks[i]!.doneTask == 0 ? "" : "- ( COMPLETADA )"}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: sTextPrimary,
                color: tasks[i]!.doneTask == 0 ? kTextPrimary : kgreen
              )
            ),
            subtitle: Text(
              '${tasks[i]!.dateTask} ${compareDate(tasks[i]!.dateTask!, tasks[i]!.id!) ? "" : "- ( EXPIRADA )"}',
              style: compareDate(tasks[i]!.dateTask!, tasks[i]!.id!)
                ? TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: sTextSecondary,
                  color: kTextSecondary
                )
                : TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: sTextPrimary,
                  color: kred,
                  decoration: TextDecoration.lineThrough
                ) 
            ),
            trailing: Icon(Icons.chevron_right, color: Colors.grey,),
          ),
        ),
      ),
    );
  }
}