import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final FirebaseFirestore firestore;

  UsersBloc({required this.firestore}) : super(UsersLoading()) {
    on<LoadUsers>(_onLoadUsers);
  }

  void _onLoadUsers(LoadUsers event, Emitter<UsersState> emit) async {
    emit(UsersLoading());
    try {
      var usersCollection = firestore.collection('users');
      var snapshot = await usersCollection.get();
      emit(UsersLoaded(snapshot.docs.map((doc) => doc.data()).toList()));
    } catch (e) {
      emit(UsersError());
    }
  }
}
