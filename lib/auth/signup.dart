// import 'package:final_project/home/choose1.dart';
// import 'package:flutter/material.dart';
// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:final_project/component/alert.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:final_project/main.dart';
//
// class signup extends StatefulWidget {
//   const signup({super.key}) ;
//
//   @override
//   State<signup> createState() => _signupState();
// }
//
// class _signupState extends State<signup> {
//   var myusername,mypassword, myemail;
//   GlobalKey<FormState> formstate = new GlobalKey<FormState>();
//   signUp() async {
//     var formdata = formstate.currentState;
//     if (formdata!.validate()) {
//       formdata.save();
//
//       try {
//         showLoading(context);
//         UserCredential userCredential = await FirebaseAuth.instance
//             .createUserWithEmailAndPassword(
//             email: myemail, password: mypassword);
//         return userCredential;
//       } on FirebaseAuthException catch (e) {
//         if (e.code == 'weak-password') {
//           Navigator.of(context).pop();
//           AwesomeDialog(
//               context: context,
//               title: "Error",
//               body: Text("Password is to weak"))
//             ..show();
//         } else if (e.code == 'email-already-in-use') {
//           Navigator.of(context).pop();
//           AwesomeDialog(
//               context: context,
//               title: "Error",
//               body: Text("The account already exists for that email"))
//             ..show();
//         }
//       } catch (e) {
//         print(e);
//       }
//     } else {}
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       body: ListView(
//         children: <Widget>[
//
//           Container(
//
//             height: MediaQuery.of(context).size.height * 0.25,
//             decoration: BoxDecoration(
//                 color: Color(0xff439be8),
//                 borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(50),
//                     bottomRight: Radius.circular(50))),
//           ),
//           SingleChildScrollView(
//             child: Form(
//               key: formstate,
//               child: Column(
//                 children: <Widget>[
//                   //Container(
//
//                     //padding: EdgeInsets.only(top:220,left: 15,right: 15),
//                      TextFormField(
//                       onSaved: (val) {
//                         myusername = val;
//                       },
//                       validator: (val) {
//                         if (val!.length > 100) {
//                           return "username can't to be larger than 100 letter";
//                         }
//                         if (val.length < 2) {
//                           return "username can't to be less than 2 letter";
//                         }
//                         return null;
//                       },
//                       decoration: InputDecoration(
//                         hintText: 'User Name',
//                         prefixIcon: const Icon(Icons.person),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: const BorderSide(
//                             color: Colors.black,
//                             width: 2,
//                           ),
//                         ),
//                         disabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: const BorderSide(
//                             color: Colors.black,
//                             width: 2,
//                           ),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: const BorderSide(
//                             color: Colors.black,
//                             width: 2,
//                           ),
//                         ),
//                       ),
//                     ),
//
//                   const SizedBox(height: 25),
//                   //Container(
//                     //padding: EdgeInsets.symmetric(horizontal: 15),
//                     //child:
//                     TextFormField(
//                       onSaved: (val) {
//                         myemail = val;
//                       },
//                       validator: (val) {
//                         if (val!.length > 100) {
//                           return "Email can't to be larger than 100 letter";
//                         }
//                         if (val.length < 2) {
//                           return "Email can't to be less than 2 letter";
//                         }
//                         return null;
//                       },
//
//                       decoration: InputDecoration(
//                         hintText: 'Email',
//                         prefixIcon: const Icon(Icons.email),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: const BorderSide(
//                             color: Colors.black,
//                             width: 2,
//                           ),
//                         ),
//                         disabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: const BorderSide(
//                             color: Colors.black,
//                             width: 2,
//                           ),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: const BorderSide(
//                             color: Colors.black,
//                             width: 2,
//                           ),
//                         ),
//                       ),
//                     ),
//                   //),
//                   const SizedBox(height: 25),
//                   //Container(
//                     //padding: EdgeInsets.symmetric(horizontal: 15),
//                     //child:
//                     TextFormField(
//                       onSaved: (val) {
//                         mypassword = val;
//                       },
//                       validator: (val) {
//                         if (val!.length > 100) {
//                           return "Password can't to be larger than 100 letter";
//                         }
//                         if (val.length < 4) {
//                           return "Password can't to be less than 4 letter";
//                         }
//                         return null;
//                       },
//                       decoration: InputDecoration(
//                         hintText: 'Create Password',
//                         prefixIcon: const Icon(Icons.password),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: const BorderSide(
//                             color: Colors.black,
//                             width: 2,
//                           ),
//                         ),
//                         disabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: const BorderSide(
//                             color: Colors.black,
//                             width: 2,
//                           ),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: const BorderSide(
//                             color: Colors.black,
//                             width: 2,
//                           ),
//                         ),
//                       ),
//                     ),
//                   //),
//                   const SizedBox(height: 25),
//
//                     TextFormField(
//                       decoration: InputDecoration(
//                         hintText: 'Confirm Password',
//                         prefixIcon: const Icon(Icons.password),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: const BorderSide(
//                             color: Colors.black,
//                             width: 2,
//                           ),
//                         ),
//                         disabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: const BorderSide(
//                             color: Colors.black,
//                             width: 2,
//                           ),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: const BorderSide(
//                             color: Colors.black,
//                             width: 2,
//                           ),
//                         ),
//                       ),
//                     ),
//                  // ),
//                   const SizedBox(height: 10),
//                   Container(
//                       margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
//                       width: 270,
//                       height: 60,
//                       child: Center(
//                           child: ElevatedButton(
//                             onPressed: () async {
//                               UserCredential response = await signUp();
//                               print("===================");
//                               if (response != null) {
//                                 await FirebaseFirestore.instance
//                                     .collection("users")
//                                     .add({'User Name': myusername, 'Email': myemail});
//                                 Navigator.of(context)
//                                     .pushReplacementNamed("choose1");
//                               } else {
//                                 print("Sign Up Faild");
//                               }
//                               print("===================");
//                             },
//                             // onPressed: ()  {
//                             //
//                             //   Navigator.of(context).push(MaterialPageRoute(builder: (context){
//                             //     return choose1();
//                             //   }));
//                             // },
//                             child: Text("sign up"),
//                             style: ElevatedButton.styleFrom(
//                               primary: Color(0xff439BE8),
//                               padding:
//                               EdgeInsets.symmetric(horizontal: 50, vertical: 10),
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(15)),
//                               textStyle: TextStyle(
//                                   fontSize: 25,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white),
//                             ),
//                           )
//                       )
//                   ),
//
//
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/home/choose1.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:final_project/component/alert.dart';
import 'package:final_project/component/my_button.dart';
import 'package:final_project/component/my_textfield.dart';
import 'package:final_project/component/square_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home/theme_cubit.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var myusername,mypassword, myemail;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  signUp() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();

      try {
        showLoading(context);
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
            email: myemail, password: mypassword);
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Navigator.of(context).pop();
          AwesomeDialog(
              context: context,
              title: "Error",
              body: Text("Password is to weak"))
            ..show();
        } else if (e.code == 'email-already-in-use') {
          Navigator.of(context).pop();
          AwesomeDialog(
              context: context,
              title: "Error",
              body: Text("The account already exists for that email"))
            ..show();
        }
      } catch (e) {
        print(e);
      }
    } else {}
  }
  @override
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
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Center(
              child: Form(
                key:formstate ,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 40,),
                    Container(
                        height: 160,
                        width: 400,
                        child: Center(
                          child: CircleAvatar(
                            radius: 70,
                            backgroundImage: AssetImage("assets/images/logo3.jpg"),
                          ),
                        )),

                    const SizedBox(height: 20),

                    // welcome back, you've been missed!
                    Text(
                      'Welcome back you\'ve been missed!',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  child: TextFormField(
                        onSaved: (val) {
                          myusername = val;
                        },
                        validator: (val) {
                          if (val!.length > 100) {
                            return "username can't to be larger than 100 letter";
                          }
                          if (val.length < 2) {
                            return "username can't to be less than 2 letter";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'User Name',
                          prefixIcon: const Icon(Icons.person),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                ),
                    const SizedBox(height: 20),
                    // username textfield

                    Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15),
                      child: TextFormField(
                        onSaved: (val) {
                          myemail = val;
                        },
                        validator: (val) {
                          if (val!.length > 100) {
                            return "Email can't to be larger than 100 letter";
                          }
                          if (val.length < 2) {
                            return "Email can't to be less than 2 letter";
                          }
                          return null;
                        },
                        controller: emailController,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          prefixIcon: const Icon(Icons.email),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // password textfield
                    Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15),
                      child: TextFormField(
                        onSaved: (val) {
                          mypassword = val;
                        },
                        validator: (val) {
                          if (val!.length > 100) {
                            return "Password can't to be larger than 100 letter";
                          }
                          if (val.length < 4) {
                            return "Password can't to be less than 4 letter";
                          }
                          return null;
                        },
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          prefixIcon: const Icon(Icons.password),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          prefixIcon: const Icon(Icons.password),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                        ),
                    obscureText: true,
                      ),
                ),
                 // ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Container(
                    //   height: 50,
                    //   width: 150,
                    //   //padding: const EdgeInsets.all(25),
                    //   margin: const EdgeInsets.symmetric(horizontal: 25),
                    //   decoration: BoxDecoration(
                    //     //color: Colors.black,
                    //     color: Colors.blue,
                    //     borderRadius: BorderRadius.circular(8),
                    //   ),
                    //   child: Center(
                    //     child: ElevatedButton(
                    //       onPressed: () async {
                    //         var user = await signIn();
                    //         if (user != null) {
                    //           Navigator.of(context).pushReplacementNamed("choose1");
                    //         }
                    //       },
                    //       child: Text(
                    //         "Login",
                    //         style: TextStyle(
                    //           color: Colors.white,
                    //           fontWeight: FontWeight.bold,
                    //           fontSize: 16,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),


                Container(
                      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      width: 270,
                      height: 60,
                      child: Center(
                          child: ElevatedButton(
                            onPressed: () async {
                              UserCredential response = await signUp();
                              print("===================");
                              if (response != null) {
                                await FirebaseFirestore.instance
                                    .collection("users")
                                    .add({'User Name': myusername, 'Email': myemail});
                                Navigator.of(context)
                                    .pushReplacementNamed("choose1");
                              } else {
                                print("Sign Up Faild");
                              }
                              print("===================");
                            },
                            // onPressed: ()  {
                            //
                            //   Navigator.of(context).push(MaterialPageRoute(builder: (context){
                            //     return choose1();
                            //   }));
                            // },
                            child: Text("sign up"),
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xff439BE8),
                              padding:
                              EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              textStyle: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          )
                      )
                  ),

                    const SizedBox(height: 20),

                    // or continue with
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey[400],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'Or continue with',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey[400],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // google + apple sign in buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        // google button
                        SquareTile(imagePath: "assets/images/google.png"),

                        SizedBox(width: 25),

                        // apple button
                        SquareTile(imagePath: "assets/images/facebook-icon-24.jpg")
                      ],
                    ),

                    const SizedBox(height: 20),
                    // not a member? register now
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Not a member?',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          'Register now',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),


    );
  }
}

