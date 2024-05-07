import 'package:chatapp/src/presentation/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyDrawer extends StatelessWidget {
  final Future<String> username;

  const MyDrawer({
    super.key,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<String>(
              future: username,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const DrawerHeader(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else if (snapshot.hasError) {
                  return const DrawerHeader(
                    child: Text('Error: An error occurred'),
                  );
                } else {
                  return DrawerHeader(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 45,
                          child: Text(
                              // Display the first letter of the username
                              snapshot.data![0].toUpperCase(),
                              style: const TextStyle(fontSize: 30)),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Hello, ${snapshot.data}',
                          style: const TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 20),
            DrawerTile(
                text: 'S E T T I N G S',
                icon: Icons.settings,
                onTap: () {
                  Navigator.pushNamed(context, '/settings');
                }),
            DrawerTile(
                text: 'L O G O U T',
                icon: Icons.logout,
                onTap: () {
                  context.read<SignInBloc>().add(const SignOutRequired());
                }),
            DrawerTile(
                text: 'A B O U T',
                icon: Icons.info,
                onTap: () {
                  Navigator.pushNamed(context, '/about');
                }),
          ],
        ),
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? onTap;

  const DrawerTile({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: ListTile(
        title: Text(text),
        leading: Icon(icon),
        onTap: () {
          Navigator.pop(context);
          onTap?.call();
        },
      ),
    );
  }
}
