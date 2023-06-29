import 'package:final_project/doctor/Doctor.dart';
import 'package:final_project/home/choose1.dart';
import 'package:final_project/governorates.dart';
import 'package:final_project/auth/login.dart';
import 'package:final_project/patient/patient.dart';
import 'package:final_project/patient/patientpage.dart';
import 'package:final_project/patient/question.dart';
import 'package:final_project/auth/signup.dart';
import 'package:final_project/patient/support.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:final_project/home/Choose.dart';
import 'package:final_project/doctor/classification.dart';
import 'package:final_project/splach_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'home/theme_cubit.dart';

late bool islogin;

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage=await HydratedStorage.build(storageDirectory: await getApplicationDocumentsDirectory());
  await Firebase.initializeApp();

  //FirebaseMessaging.onBackgroundMessage(backgroudMessage) ;

  var user = FirebaseAuth.instance.currentUser;
  if (user == null) {
      islogin = false;
  } else {
      islogin = true;
  }
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
      create: (_)=>ThemeCubit(),
      child: BlocBuilder<ThemeCubit,bool>(
          builder: (context, state) {
            return MaterialApp(
              home:splash_screen(),
              debugShowCheckedModeBanner: false,
              themeMode: state ? ThemeMode.dark:ThemeMode.light,
              darkTheme: ThemeData.dark(),
              routes: {
                "signup": (context) => signup(),
                "choose1": (context) => choose1(),
              },
            );
          }
      ),
    );
  }
}
