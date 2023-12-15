import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multi_role_app/home_screen.dart';
import 'package:multi_role_app/login_screen.dart';
import 'package:multi_role_app/student_screen.dart';
import 'package:multi_role_app/teacher_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    isLogin();
  }

  void isLogin() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogin = sp.getBool('isLogin') ?? false;
    String userType = sp.getString('userType') ?? '';

    if(isLogin) {

      if(userType == 'student'){
        Timer(Duration(seconds: 3), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => StudentScreen())
          );
        });
      }else if(userType == 'teacher'){
        Timer(Duration(seconds: 3), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => TeacherScreen())
          );
        });
      }


    } else{
      Timer(Duration(seconds: 3), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => LoginScreen())
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image(
        height: double.infinity,
        fit: BoxFit.fitHeight,
        image: NetworkImage('https://images.pexels.com/photos/15564188/pexels-photo-15564188/free-photo-of-pancakes-with-berries-and-marple-syrup.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
      ),
    );
  }
}
