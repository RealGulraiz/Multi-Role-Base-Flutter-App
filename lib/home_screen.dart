import 'package:flutter/material.dart';
import 'package:multi_role_app/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String email='', age='';
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

    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('HOME SCREEN'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Email'),
                Text(email.toString()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Age'),
                Text(age.toString()),
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
