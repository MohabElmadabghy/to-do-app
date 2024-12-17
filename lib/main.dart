import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prac/cubit/bloc_observer.dart';
import 'package:prac/cubit/todo_cubit.dart';
import 'package:prac/layout/layout.dart';
import 'package:prac/modules/login_screen.dart';
import 'package:prac/modules/signup_screen.dart';
import 'package:prac/shared/constants.dart';


Future main() async {
  Bloc.observer = MyBlocObserver();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(),
      child: BlocConsumer<TodoCubit,TodoState>(
        listener: (context, state) => TodoCubit(),
        builder: (context, state) => MaterialApp(
          theme: ThemeData(
            iconTheme: IconThemeData(
              color: textColor,
            ),

            scaffoldBackgroundColor:appBarColor ,
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.brown[400],
            ),
            appBarTheme: AppBarTheme(
              backgroundColor: appBarColor,
              elevation: 0,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.white,

              ),
              titleTextStyle: TextStyle(
                color:textColor,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: appBarColor,
              elevation: 30,
              selectedItemColor:Colors.brown,
              unselectedItemColor: Colors.grey[600],
            ),
            bottomSheetTheme: BottomSheetThemeData(
              backgroundColor: Colors.black26,
            ),

          ),
          darkTheme: ThemeData(
            iconTheme: IconThemeData(
              color: textColor,
            ),
            scaffoldBackgroundColor:appBarColor ,
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.brown[400],
            ),
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.black,
              elevation: 0,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.white,

              ),
              titleTextStyle: TextStyle(
                color:textColor,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: appBarColor,
              elevation: 30,
              selectedItemColor:Colors.brown,
              unselectedItemColor: Colors.grey[600],
            ),
            bottomSheetTheme: BottomSheetThemeData(
              backgroundColor: Colors.black26,
            ),

          ),
          themeMode:TodoCubit.get(context).isdark?ThemeMode.dark:ThemeMode.light,
          debugShowCheckedModeBanner: false,
          home: Signup(),

        ),

      ),
    );
  }
}