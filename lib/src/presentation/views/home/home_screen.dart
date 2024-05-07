import 'package:chatapp/src/presentation/blocs/user_bloc/users_bloc.dart';
import 'package:chatapp/src/presentation/views/home/components/buildUserList.dart';
import 'package:chatapp/src/presentation/views/home/components/my_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  final String? userid;
  const HomeScreen({super.key, required this.userid});

  Future<String> getUserName() async {
    final user =
        await FirebaseFirestore.instance.collection('users').doc(userid).get();
    return user['name'];
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UsersBloc(firestore: FirebaseFirestore.instance)..add(LoadUsers()),
      child: Scaffold(
          appBar: AppBar(
            title: Text('C H A T T Y',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.tertiary,
                    fontSize: 25)),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1.0),
              child: Container(
                color: Colors.grey.withOpacity(0.8),
                height: 1.0,
              ),
            ),
          ),
          //passing the user name from the user id to the drawer
          drawer: MyDrawer(username: getUserName()),
          body: BlocBuilder<UsersBloc, UsersState>(
            builder: (context, state) {
              if (state is UsersLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is UsersLoaded) {
                return buildUserList(state.users);
              } else {
                return const Center(
                  child: Text('Error'),
                );
              }
            },
          )),
    );
  }
}
