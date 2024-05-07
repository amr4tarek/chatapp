import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chatapp/src/presentation/blocs/theme_cubit/theme_cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey.withOpacity(0.8),
            height: 1.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(16.0),
            title: const Text('Dark Mode'),
            //  subtitle: const Text('Toggle the dark mode theme'),
            // make icon change based on theme
            leading: Icon(
              context.read<ThemeCubit>().state.theme.brightness ==
                      Brightness.dark
                  ? Icons.nightlight_round
                  : Icons.wb_sunny,
            ),
            trailing: BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) {
                return Switch(
                  activeColor: Theme.of(context).colorScheme.secondary,
                  value: context.read<ThemeCubit>().state.theme.brightness ==
                      Brightness.dark,
                  onChanged: (value) {
                    context.read<ThemeCubit>().toggleTheme();
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
