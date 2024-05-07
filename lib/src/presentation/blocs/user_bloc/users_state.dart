part of 'users_bloc.dart';

sealed class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

final class UsersInitial extends UsersState {}

class UsersLoading extends UsersState {}

class UsersLoaded extends UsersState {
  final List<Map<String, dynamic>> users;

  const UsersLoaded(this.users);

  @override
  List<Object> get props => [users];
}

class UsersError extends UsersState {}
