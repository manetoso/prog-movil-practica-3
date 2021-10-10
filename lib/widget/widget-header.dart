import 'package:flutter/material.dart';
import 'package:tarea_3_todo_app/constants.dart';

class HeaderWidget extends StatelessWidget {
  final Widget child;

  const HeaderWidget({
    Key? key,
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      width: double.infinity,
      child: Stack(
        children: [
          _PurpleBox(),
          this.child
        ],
      ),
    );
  }
}

class _PurpleBox extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.18,
      //decoration: _decorationPurpleBackground(),
      color: kBackgroundColor,
      child: Stack(
        children: [
          _HeaderContent(),
        ],
      ),
    );
  }

  BoxDecoration _decorationPurpleBackground() => BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color.fromRGBO(63, 63, 156, 1),
        Color.fromRGBO(90, 70, 178, 1)
      ]
    )
  );
}

class _HeaderContent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    DateTime today = new DateTime.now();
    String? month;
    switch (today.month) {
      case 1:
        month = 'Enero';
        break;
      case 2:
        month = 'Febrero';
        break;
      case 3:
        month = 'Marzo';
        break;
      case 4:
        month = 'Abril';
        break;
      case 5:
        month = 'Mayo';
        break;
      case 6:
        month = 'Junio';
        break;
      case 7:
        month = 'Julio';
        break;
      case 8:
        month = 'Agosto';
        break;
      case 9:
        month = 'Septiembre';
        break;
      case 10:
        month = 'Octubre';
        break;
      case 11:
        month = 'Noviembre';
        break;
      case 12:
        month = 'Diciembre';
        break;
    }
    String dateSlug ="$month ${today.day.toString().padLeft(2,'0')}, ${today.year.toString()}";

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: 60,
          // color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('$dateSlug', style: TextStyle(
                color: kTextSubTitle,
                fontSize: sTextSubTitle,
              ),),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: kBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                      offset: Offset.zero,
                      blurRadius: 3
                    )
                  ],
                ),
                child: Image.asset('assets/images/default-avatar.png', fit: BoxFit.scaleDown,),
              )
            ],
          ),
        )
      ],
    );
  }
}