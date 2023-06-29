import 'package:flutter/material.dart';
import 'package:final_project/auth/login.dart';
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'home/theme_cubit.dart';
class splash_screen extends StatefulWidget {
  const splash_screen({super.key}) ;

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds:10), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder:(context){
        return loginScreen();
      }));
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Text(""),
      ),
      drawer: Drawer(
        child: Column(children: [
          Container(height: 80,),
          BlocBuilder<ThemeCubit,bool>(
              builder: (context, state) {
                return SwitchListTile(
                  value: state,
                  onChanged:(value){
                    BlocProvider.of<ThemeCubit>(context).toggleTheme(value: value);
                  },
                  title: Text("mode"),
                );
              }
          ),
          ListTile(
            title: Text("help"),
            leading: Icon(Icons.help),
          ),
          ListTile(
            title: Text("about"),
            leading: Icon(Icons.help_center),
          )
        ],),
      ),
      body:
          Center(
            child: CircleAvatar(
              radius: 150,
              backgroundImage: AssetImage("assets/images/logo3.jpg"),
            ),
          )
    );
  }
}