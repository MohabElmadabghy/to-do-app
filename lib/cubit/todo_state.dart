part of 'todo_cubit.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {}

final class ChangeBottomNavBar extends TodoState {}

final class ChangeBottomSheet extends TodoState {}

final class CreateDataBaseState extends TodoState {}

final class InsertIntoDataBaseState extends TodoState {}

final class GetFromDataBaseState extends TodoState {}

final class UpdateDataBaseState extends TodoState {}

final class DeleteFromDataBaseState extends TodoState {}

final class ThemeModeState extends TodoState {}






