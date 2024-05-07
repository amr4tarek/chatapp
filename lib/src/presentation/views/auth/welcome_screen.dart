import 'dart:ui';

import 'package:chatapp/src/presentation/views/auth/sign_in_screen.dart';
import 'package:chatapp/src/presentation/views/auth/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../blocs/authentication_bloc/authentication_bloc.dart';
import '../../blocs/sign_in_bloc/sign_in_bloc.dart';
import '../../blocs/sign_up_bloc/sign_up_bloc.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(initialIndex: 0, length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              CircleShape(
                height: MediaQuery.of(context).size.width,
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).colorScheme.tertiary,
                alignment: AlignmentDirectional(20, -1.2),
              ),
              CircleShape(
                height: MediaQuery.of(context).size.width / 1.3,
                width: MediaQuery.of(context).size.width / 1.3,
                color: Theme.of(context).colorScheme.secondary,
                alignment: const AlignmentDirectional(-2.7, -1.2),
              ),
              CircleShape(
                height: MediaQuery.of(context).size.width / 1.3,
                width: MediaQuery.of(context).size.width / 1.3,
                color: Theme.of(context).colorScheme.primary,
                alignment: const AlignmentDirectional(2.7, -1.2),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 50.0),
                child: Container(),
              ),
              Align(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    SvgPicture.asset(
                      'assets/images/Hello.svg',
                      height: 250,
                      width: 250,
                    ),
                    Text(
                      'C H A T T Y',
                      style: TextStyle(
                        fontSize: 25,
                        color: Theme.of(context).colorScheme.onBackground,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 1.8,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50.0),
                        child: buildTabBar(context),
                      ),
                      Expanded(
                        child: buildTabBarView(context),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTabBar(BuildContext context) {
    return TabBar(
      controller: tabController,
      unselectedLabelColor:
          Theme.of(context).colorScheme.onBackground.withOpacity(0.5),
      labelColor: Theme.of(context).colorScheme.onBackground,
      tabs: const [
        Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            'Sign In',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            'Sign Up',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTabBarView(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: [
        BlocProvider<SignInBloc>(
          create: (context) => SignInBloc(
            userRepository: context.read<AuthenticationBloc>().userRepository,
          ),
          child: const SignInScreen(),
        ),
        BlocProvider<SignUpBloc>(
          create: (context) => SignUpBloc(
            userRepository: context.read<AuthenticationBloc>().userRepository,
          ),
          child: const SignUpScreen(),
        ),
      ],
    );
  }
}

class CircleShape extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final AlignmentDirectional alignment;
  const CircleShape({
    required this.height,
    required this.width,
    required this.color,
    required this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}
