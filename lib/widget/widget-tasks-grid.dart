import 'package:flutter/material.dart';
import 'package:tarea_3_todo_app/constants.dart';

class TasksGrid extends StatelessWidget {
  const TasksGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Mis Tareas', style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: sTextTitle
        ),),
        SizedBox(
          height: size.height * 0.65,
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 18,
            mainAxisSpacing: 18,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      kCardColor1_1,
                      kCardColor1_2,
                    ]
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: kCardColor1_1,
                      spreadRadius: -20,
                      offset: Offset(7, 22),
                      blurRadius: 20
                    )
                  ]
                ),
                child: const Text('hi, testing'),
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      kCardColor2_1,
                      kCardColor2_2,
                    ]
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: kCardColor2_1,
                      spreadRadius: -20,
                      offset: Offset(7, 22),
                      blurRadius: 20
                    )
                  ]
                ),
                child: const Text('hi, testing'),
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      kCardColor3_1,
                      kCardColor3_2,
                    ]
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: kCardColor3_1,
                      spreadRadius: -20,
                      offset: Offset(7, 22),
                      blurRadius: 20
                    )
                  ]
                ),
                child: const Text('hi, testing'),
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      kCardColor4_1,
                      kCardColor4_2,
                    ]
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: kCardColor4_1,
                      spreadRadius: -20,
                      offset: Offset(7, 22),
                      blurRadius: 20
                    )
                  ]
                ),
                child: const Text('hi, testing'),
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      kCardColor1_1,
                      kCardColor1_2,
                    ]
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: kCardColor1_1,
                      spreadRadius: -20,
                      offset: Offset(7, 22),
                      blurRadius: 20
                    )
                  ]
                ),
                child: const Text('hi, testing'),
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      kCardColor2_1,
                      kCardColor2_2,
                    ]
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: kCardColor2_1,
                      spreadRadius: -20,
                      offset: Offset(7, 22),
                      blurRadius: 20
                    )
                  ]
                ),
                child: const Text('hi, testing'),
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      kCardColor3_1,
                      kCardColor3_2,
                    ]
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: kCardColor3_1,
                      spreadRadius: -20,
                      offset: Offset(7, 22),
                      blurRadius: 20
                    )
                  ]
                ),
                child: const Text('hi, testing'),
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      kCardColor4_1,
                      kCardColor4_2,
                    ]
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: kCardColor4_1,
                      spreadRadius: -20,
                      offset: Offset(7, 22),
                      blurRadius: 20
                    )
                  ]
                ),
                child: const Text('hi, testing'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}