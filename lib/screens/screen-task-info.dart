import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:tarea_3_todo_app/constants.dart';
import 'package:tarea_3_todo_app/providers/providers.dart';

class TaskInfoScreen extends StatefulWidget {

  const TaskInfoScreen({Key? key,}) : super(key: key);

  @override
  State<TaskInfoScreen> createState() => _TaskInfoScreenState();
}

class _TaskInfoScreenState extends State<TaskInfoScreen> {

  DateTime? _dateTime;
  String? _dateFormated;

  @override
  Widget build(BuildContext context) {
    final taskForm = Provider.of<TaskFormProvider>(context);
    final taskListProvider = Provider.of<TaskListProvider>(context, listen: false);
    
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    if ( args.taskId != 0) {
      taskForm.title = args.taskTitle!;
      taskForm.desc = args.taskDesciption!;
      taskForm.date = args.taskDate!;
      _dateTime = DateTime.parse(args.taskDate!);
      if ( args.taskDone == 0 ) {
        taskForm.check = false;
      } else {
        taskForm.check = true;
      }
    }
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: Text(
          'Info. de la Tarea',
          style: TextStyle(
            color: kTextTitle,
            fontWeight: FontWeight.bold
          ),
        ),
        iconTheme: IconThemeData(color: kTextSecondary),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: args.expiredDate! ? () {
              showDatePicker(
                context: context,
                initialDate: _dateTime != null ? _dateTime! : DateTime.now(),
                firstDate: DateTime(DateTime.now().day),
                lastDate: DateTime(DateTime.now().year + 5),
                cancelText: 'Cancelar',
                helpText: 'Selecciona una fecha',
                builder: (context, child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: ColorScheme.light(
                        primary: kTextSecondary, //HEADER BACKGROUND COLOR
                        onPrimary: kTextSubTitle, //HEADER TEXT COLOR
                        onSurface: kTextPrimary //BODY TEXT COLOR
                      ),
                      textButtonTheme: TextButtonThemeData(
                        style: TextButton.styleFrom(
                          primary: kTextPrimary, //BUTTON TEXT COLOR
                        ),
                      ),
                    ),
                    child: child!,
                  );
                }
              ).then((date) {
                setState((){
                  if (date == null) return print('Date Not Selected!');
                  String dayFormated = checkDate(date, false);
                  String monthFormated = checkDate(date, true);
                  _dateTime = date;
                  _dateFormated = '${_dateTime!.year}-$monthFormated-$dayFormated';
                  taskForm.date = _dateFormated!;
                });
              });
            }
            : null,
            icon: Icon(Icons.calendar_today),
          ),
          IconButton(
            onPressed: args.expiredDate! ? () async {
              if (args.taskDone == 0) {
                taskForm.check = true;
              } else {
                taskForm.check = false;
              }
              print('taskForm onTap');
              print(taskForm.check);

              taskForm.isLoading = true;
              await taskListProvider.updateTask(
                args.taskId!,
                taskForm.title,
                taskForm.desc,
                taskForm.date,
                taskForm.check
              );
              await Future.delayed(Duration(milliseconds: 2000));
              taskForm.isLoading = false;
              
              taskListProvider.loadTask();
              Navigator.pop(context);
            }
            : null,
            icon: Icon(Icons.done_rounded)
          ),
        ],
      ),
      body: taskForm.isLoading
        ? Center(
          child: Lottie.asset('assets/images/loading-animation.json'),
        )
        : Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              enabled: args.expiredDate,
              initialValue: args.taskId != 0 ? args.taskTitle : null,
              decoration: _inputTitleDecoration(),
              style: _inputTitleTextStyle(),
              onChanged: (value) => taskForm.title = value,
            ),
            Expanded(
              child: TextFormField(
                enabled: args.expiredDate,
                initialValue: args.taskId != 0 ? args.taskDesciption : null,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: _inputDescDecoration(),
                style: _inputDescTextStyle(),
                onChanged: (value) => taskForm.desc = value,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: args.expiredDate!
        ? FloatingActionButton(
          backgroundColor: kred,
          splashColor: kCardColor3_1,
          elevation: 0,
          foregroundColor: Colors.white,
          child: Container(
            child: Icon(Icons.save_rounded),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  color: kred,
                  blurRadius: 10,
                  offset: Offset(5, 10),
                  spreadRadius: 7
                ),
              ]
            ),
          ),
          onPressed: () async {
            if (taskForm.title.length <=2) _customDialog(context, 'Error', 'Favor de agregar un título a la nota');
            if (taskForm.desc.length <=2) _customDialog(context, 'Error', 'Favor de agregar una descripción a la nota');
            if (taskForm.date.length <=2) _customDialog(context, 'Error', 'Favor de asignar una fecha a la nota');
            if (taskForm.title.length >=2 && taskForm.desc.length >=2 && taskForm.date.length >=2){
              FocusScope.of(context).unfocus();
              taskForm.isLoading = true;
              if ( args.taskId == 0 ) {
                await taskListProvider.newTask(
                  taskForm.title,
                  taskForm.desc,
                  taskForm.date,
                  taskForm.check
                );
              } else {
                await taskListProvider.updateTask(
                  args.taskId!,
                  taskForm.title,
                  taskForm.desc,
                  _dateFormated != null ? _dateFormated! : taskForm.date,
                  taskForm.check
                );
              }
              await Future.delayed(Duration(milliseconds: 2000));
              taskForm.isLoading = false;
              
              taskListProvider.loadTask();
              Navigator.pop(context);
            }
          },
        )
        : null,
    );
  }

  Future<dynamic> _customDialog(BuildContext context, String title, String content) {
    return showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                elevation: 0,
                actions: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.close, color: kTextPrimary,)
                  )
                ],
                content: SizedBox(
                  height: 60,
                  child: Column(
                    children: [
                      Text(title, style: TextStyle(
                        color: kTextPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: sTextPrimary
                      ),),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text(content, style: TextStyle(
                            color: kTextSecondary,
                            fontWeight: FontWeight.normal,
                            fontSize: sTextSecondary
                          ),),
                        ],
                      ),
                    ],
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                backgroundColor: kBackgroundColor,
              );
            });
  }

  TextStyle _inputDescTextStyle() => TextStyle(
    fontSize: sTextPrimary,
    color: kTextPrimary,
    fontWeight: FontWeight.normal,
  );

  InputDecoration _inputDescDecoration() => InputDecoration(
    border: InputBorder.none,
    hintText: 'Agregar una descripción...',
  );

  TextStyle _inputTitleTextStyle() => TextStyle(
    fontSize: sTextTitle,
    color: kTextTitle,
    fontWeight: FontWeight.bold,
  );

  InputDecoration _inputTitleDecoration() => InputDecoration(
    border: InputBorder.none,
    hintText: 'Título',
  );
}

checkDate( DateTime date, bool isMonth) {
  String dayformated;
  switch (isMonth ? date.month.toString() : date.day.toString()) {
    case '1':
      dayformated = '01';
      break;
    case '2':
      dayformated = '02';
      break;
    case '3':
      dayformated = '03';
      break;
    case '4':
      dayformated = '04';
      break;
    case '5':
      dayformated = '05';
      break;
    case '6':
      dayformated = '06';
      break;
    case '7':
      dayformated = '07';
      break;
    case '8':
      dayformated = '08';
      break;
    case '9':
      dayformated = '09';
      break;

    default:
      dayformated = isMonth ? date.month.toString() : date.day.toString();
  }

  return dayformated;
}

class ScreenArguments {
  final String? taskTitle, taskDesciption, taskDate;
  final int? taskId, taskDone;
  final bool? expiredDate;

  ScreenArguments(this.taskTitle, this.taskDesciption, this.taskDate, this.taskId, this.taskDone, this.expiredDate);
}