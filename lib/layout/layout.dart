import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:prac/cubit/todo_cubit.dart';
import 'package:prac/shared/components.dart';

class HomeLayout extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TodoCubit()..createDataBase(),
      child: BlocConsumer<TodoCubit, TodoState>(
        listener: (BuildContext context, TodoState state) {
          if (state is InsertIntoDataBaseState) {
            Navigator.pop(context);
          }
        },
        builder: (BuildContext context, TodoState state) {
          TodoCubit cubit = TodoCubit.get(context);

          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(
                cubit.titles[cubit.currentindex],
              ),
            ),
            body: cubit.screens[cubit.currentindex],
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (cubit.isBottomSheetShown) {
                  if (formKey.currentState!.validate()) {
                    cubit.insertIntoDataBase(
                      title: titleController.text,
                      time: timeController.text,
                      date: dateController.text,
                    );
                  }
                } else {
                  scaffoldKey.currentState!
                      .showBottomSheet(
                        (context) => Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(20.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            defaultTextFormField(
                              controller: titleController,
                              type: TextInputType.text,
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'title must not be empty';
                                }
                                return null;
                              },
                              name: 'Task Title',
                              prefix: Icon(
                                Icons.title,
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            defaultTextFormField(
                              controller: timeController,
                              type: TextInputType.datetime,
                              ontap: () {
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then((value) {
                                  if (value != null) {
                                    timeController.text =
                                        value.format(context).toString();
                                  }
                                });
                              },
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'time must not be empty';
                                }
                                return null;
                              },
                              name: 'Task Time',
                              prefix: Icon(
                                Icons.watch_later_outlined,
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            defaultTextFormField(
                              controller: dateController,
                              type: TextInputType.datetime,
                              ontap: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.now().add(
                                    Duration(days: 365),
                                  ),
                                ).then((value) {
                                  if (value != null) {
                                    dateController.text =
                                        DateFormat.yMMMd().format(value);
                                  }
                                });
                              },
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'date must not be empty';
                                }
                                return null;
                              },
                              name: 'Task Date',
                              prefix: Icon(
                                Icons.calendar_today,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    elevation: 20.0,
                  )
                      .closed
                      .then((value) {
                    cubit.changeBottomSheet(
                      isShow: false,
                      icon: Icons.edit,
                    );
                  });

                  cubit.changeBottomSheet(
                    isShow: true,
                    icon: Icons.add,
                  );
                }
              },
              child: Icon(
                cubit.fabicon,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentindex,
              onTap: (index) {
                cubit.changeNavBar(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu,
                  ),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.check_circle_outline,
                  ),
                  label: 'Done',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.archive_outlined,
                  ),
                  label: 'Archived',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                  ),
                  label: 'Settings',
                ),
                // إضافة عنصر جديد للـ BottomNavigationBar

              ],
            ),
          );
        },
      ),
    );
  }
}
