
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prac/cubit/todo_cubit.dart';
import 'package:prac/shared/components.dart';

class ArchivedTaskScreen extends StatelessWidget {
  const ArchivedTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TodoCubit c=TodoCubit.get(context);
    return BlocConsumer<TodoCubit,TodoState>(
      listener: (context, state) => TodoCubit(),
      builder: (context, state) =>  ConditionalBuilder(
        condition: TodoCubit.get(context).archivedtasks.length>0,
        builder: (context) => ListView.separated(
          itemBuilder: (context, index) => ItemBuilder(c.archivedtasks[index] , context),
          separatorBuilder: (context, index)
          => Container(
            height:3 ,
            color: Colors.grey[300],
          ),
          itemCount: TodoCubit.get(context).archivedtasks.length,
        ) ,
        fallback: (context) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.menu,color: Colors.black45),
              Text(
                'No Tasks Yet, Please Add Some Tasks',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}
