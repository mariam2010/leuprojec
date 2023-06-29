import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/doctor/Doctor.dart';
import 'package:final_project/home/theme_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:final_project/home/Choose.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class choose1 extends StatefulWidget {
  const choose1({super.key});

  @override
  State<choose1> createState() => _choose1State();
}

class _choose1State extends State<choose1> {
  CollectionReference notesref = FirebaseFirestore.instance.collection("notes");

  getUser() {
    var user = FirebaseAuth.instance.currentUser;
    print(user!.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Text(""),
        ),
        drawer:Drawer(
          child: Column(
            children: [
              Container(
                height: 80
              ),
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
            ],
          ),
        ) ,
        body: Padding(
          padding: const EdgeInsets.only(top: 200),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("choose who are you",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Color(0xFF439be8))),
              SizedBox(height: 30,),
              Container(
                padding: EdgeInsets.only(left: 50),
                child: Center(
                      child: Row(children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return Doctor();
                            }));
                          },
                          child: Text("Doctor"),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF439be8),
                            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            textStyle: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return CHoose();
                            }));
                          },
                          child: Text("Patient"),
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xFF439be8),
                              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              textStyle: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )),
                        )
                      ]))
                  ),
            ],
          ),
        ));
  }
}
