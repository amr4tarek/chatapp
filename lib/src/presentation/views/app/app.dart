import 'package:chatapp/src/data/repo/user_repo.dart';
import 'package:chatapp/src/presentation/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:chatapp/src/presentation/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:chatapp/src/presentation/blocs/theme_cubit/theme_cubit.dart';
import 'package:chatapp/src/presentation/views/about/about.dart';
import 'package:chatapp/src/presentation/views/auth/welcome_screen.dart';
import 'package:chatapp/src/presentation/views/home/home_screen.dart';
import 'package:chatapp/src/presentation/views/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  final UserRepository userRepository;
  const MyApp(this.userRepository, {super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<AuthenticationBloc>(
      create: (context) => AuthenticationBloc(userRepository: userRepository),
      child: BlocProvider(
          create: (context) => ThemeCubit(),
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return ScreenUtilInit(
                designSize: const Size(375, 812),
                minTextAdapt: true,
                splitScreenMode: true,
                builder: (_, child) {
                  return MaterialApp(
                    routes: {
                      '/settings': (context) => const SettingsPage(),
                      '/about': (context) => const MyAbout(),
                    },
                    debugShowCheckedModeBanner: false,
                    title: 'C H A T T Y',
                    theme: state.theme,
                    home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                        builder: (context, state) {
                      if (state.status == AuthenticationStatus.authenticated) {
                        return BlocProvider(
                          create: (context) => SignInBloc(
                              userRepository: context
                                  .read<AuthenticationBloc>()
                                  .userRepository),
                          child: HomeScreen(userid: state.user?.uid),
                        );
                      } else {
                        return const WelcomeScreen();
                      }
                    }),
                  );
                },
              );
            },
          )),
    );
  }
}
