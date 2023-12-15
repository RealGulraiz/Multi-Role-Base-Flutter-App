import 'package:flutter/material.dart';
import 'package:multi_role_app/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeacherScreen extends StatefulWidget {
  const TeacherScreen({Key? key}) : super(key: key);

  @override
  State<TeacherScreen> createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {
  String email='', age='', type='';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString('email') ?? '';
    age = sp.getString('age') ?? '';
    type = sp.getString('userType') ?? '';

    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TEACHER VIEW'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('TEACHER PORTAL'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Email'),
                Text(email.toString()),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Age'),
                Text(age.toString()),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Type'),
                Text(type.toString()),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: ()async{
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.clear(); //to clear all data in shared preference (for logout)

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));

              },
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.green,
                child: Center(
                  child: Text('Logout'),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
