import 'package:flutter/material.dart';
import 'package:tarea_3_todo_app/constants.dart';
import 'package:tarea_3_todo_app/screens/screen-task-info.dart';

class Fab extends StatelessWidget {
  final IconData? icon;
  final bool? isRounded;
  const Fab({Key? key, required this.icon, required this.isRounded}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'info', arguments: ScreenArguments(
                '',
                '',
                '',
                0,
                0,
                true,
              ));
            },
            child: Ink(
              height: 50,
              width: 50,
              // color: kred,
              decoration: BoxDecoration(
                color: kred,
                borderRadius: isRounded == true
                  ? BorderRadius.circular(50)
                  : BorderRadius.zero,
                boxShadow: [
                  BoxShadow(
                    color: kred,
                    blurRadius: 10,
                    offset: Offset(5, 10),
                    spreadRadius: -10
                  ),
                ]
              ),
              child: Icon(icon, color: Colors.white, size: 40,),
            ),
          )
        ],
      ),
    );
  }
}