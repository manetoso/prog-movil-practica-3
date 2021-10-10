import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarea_3_todo_app/constants.dart';
import 'package:tarea_3_todo_app/providers/providers.dart';
import 'package:tarea_3_todo_app/screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => new UiProvider()),
        ChangeNotifierProvider(create: ( _ ) => new TaskListProvider()),
      ],
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'TODO App',
          initialRoute: 'home',
          routes: {
            'home': ( _ ) => HomeScreen(),
            'info': ( _ ) => ChangeNotifierProvider(
              create: ( _ ) => TaskFormProvider(),
              child: TaskInfoScreen(),
            ),
          },
          theme: ThemeData(
            fontFamily: 'Montserrat',
            scaffoldBackgroundColor: kBackgroundColor,
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: kBackgroundColor,
              selectedItemColor: kTextTitle
            ),
          ),
        ),
      ),
    );
  }
}