import 'package:chatapp/src/data/repo/firebase_user_repo.dart';
import 'package:chatapp/src/presentation/views/app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'simple_bloc_observer.dart';

void main() async {
	WidgetsFlutterBinding.ensureInitialized();
	await Firebase.initializeApp();
	Bloc.observer = SimpleBlocObserver();
  runApp(MyApp(FirebaseUserRepo()));
}

/*
amrtarek@gmail.com
Amr2002Tarek&

khaledtarek@gmail.com


Khaled2002Tarek&

AhmedSobhy2000$
AhmedSobhy@gmail.com
sobhy


Ali@gmail.com

Ali2002Tarek&

Ali


Amin@gmail.com

Amin2002Tarek&

Amin



*/