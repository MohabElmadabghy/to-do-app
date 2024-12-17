import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:prac/modules/settings.dart';
import 'package:sqflite/sqflite.dart';
import '../modules/archived_tasks.dart';
import '../modules/done_tasks.dart';
import '../modules/new_tasks.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());


  static TodoCubit get(context)=>BlocProvider.of(context);

  int currentindex=0;
  IconData fabicon=Icons.edit;
  bool isBottomSheetShown=false;
  late Database database;
  List<Map> newtasks =[];
  List<Map> donetasks =[];
  List<Map> archivedtasks =[];


  bool isdark=false;

  List<String> titles = [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
    'Settings', // إضافة النص الخاص بالصفحة الجديدة
  ];

  List<Widget> screens = [
    NewTaskScreen(),
    DoneTaskScreen(),
    ArchivedTaskScreen(),
    SettingsScreen(), // إضافة الصفحة الجديدة
  ];

  void changeNavBar(index)
  {
    currentindex=index;
    emit(ChangeBottomNavBar());
  }

  void changeBottomSheet ({
    required bool isShow,
    required IconData icon ,
  })
  {
    isBottomSheetShown=isShow;
    fabicon=icon;
    emit(ChangeBottomSheet());
  }

  void createDataBase() async
  {
    database = await openDatabase(
      'todo_App.db',
      version: 1,
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, time TEXT, date TEXT,status TEXT)').then((value){
          print('table created');

        });
      },
      onOpen: (database)
      {
        print('database opened');
        emit(CreateDataBaseState());
        getFromDataBase(database);

      },
    );

  }

  void insertIntoDataBase({
    required String title,
    required String time,
    required String date,
  })async
  {
    await database.transaction((txn) =>
        txn.rawInsert('INSERT INTO tasks(title, time, date, status) VALUES("${title}","${time}", "${date}","new")')).then((value)
    {
      print('${value} inserted successfully');
      emit(InsertIntoDataBaseState());
      getFromDataBase(database);
    });
  }

  void getFromDataBase(database) async
  {
    newtasks=[];
    donetasks=[];
    archivedtasks=[];
    await database.rawQuery('SELECT * FROM tasks').then((value)
    {
      value.forEach((element)
      {
        if(element['status']=='new'){newtasks.add(element);}
        else if(element['status']=='done'){donetasks.add(element);}
        else{archivedtasks.add(element);}

      });

      emit(GetFromDataBaseState());
    });
  }

  void updateDataBase({
    required String status,
    required int id,

  })async
  {
    await database.rawUpdate(
        'UPDATE tasks SET status = ? WHERE id = ?',
        [ '${status}',id]).then((value) {
      emit(UpdateDataBaseState());
      getFromDataBase(database);
    });
  }
  void deleteFromDataBase({
    required int id,
  })async
  {
    await database
        .rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
      emit(DeleteFromDataBaseState());
      getFromDataBase(database);
    });
  }

  void themeMode()
  {
    isdark=!isdark;
    emit(ThemeModeState());
  }


}
