import 'package:flutter/material.dart';
import 'package:prac/cubit/todo_cubit.dart';

Widget defaultTextFormField({
  required TextEditingController controller,
  required validator,
  ontap,
  required String name,
  required Icon prefix,
  TextInputType? type,
}) =>
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        keyboardType: type,
        controller: controller,
        validator: validator,
        onTap: ontap,
        decoration: InputDecoration(
          labelText: name,
          prefixIcon: prefix,
          border: OutlineInputBorder(),
        ),
      ),
    );

Widget ItemBuilder(Map model, context) => Dismissible(
      key: Key(model['id'].toString()),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Row(
            children: [
              CircleAvatar(
                radius: 40,
                child: Text(
                  '${model['time']}',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '${model['title']}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      '${model['date']}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.black38,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 15,
              ),
              IconButton(
                onPressed: () {
                  TodoCubit.get(context)
                      .updateDataBase(status: 'done', id: model['id']);
                },
                icon: Icon(Icons.check_box),
                color: Colors.green,
              ),
              IconButton(
                onPressed: () {
                  TodoCubit.get(context)
                      .updateDataBase(status: 'archived', id: model['id']);
                },
                icon: Icon(Icons.archive),
                color: Colors.black45,
              ),
            ],
          ),
        ),
      ),
      onDismissed: (direction) {
        TodoCubit.get(context).deleteFromDataBase(id: model['id']);
      },
    );
