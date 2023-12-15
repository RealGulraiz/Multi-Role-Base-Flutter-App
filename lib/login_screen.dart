import 'package:flutter/material.dart';
import 'package:multi_role_app/home_screen.dart';
import 'package:multi_role_app/student_screen.dart';
import 'package:multi_role_app/teacher_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();
  final typeController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Age',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: typeController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'techer, student etc.',
              ),
            ),
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: ()async{
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString('email', emailController.text.toString());
                sp.setString('age', ageController.text.toString());
                //student, teacher etc.
                sp.setString('userType', typeController.text.toString());

                sp.setBool('isLogin', true);

                if(typeController.text=='student'){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StudentScreen()));
                }else if(typeController.text=='teacher'){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TeacherScreen()));
                }else{
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                }

              },
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.green,
                child: Center(
                  child: Text('Sign Up'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> realGulraiz() async {
    await Future.delayed(Duration(seconds: 3));

    print('delayed');
  }
}
