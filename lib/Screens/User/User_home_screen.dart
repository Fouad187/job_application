import 'package:flutter/material.dart';
import 'package:job_app/Screens/User/Taps/UserUploadCvScreen.dart';
import 'package:job_app/Screens/User/Taps/user_all_job_screen.dart';
import 'package:job_app/constant.dart';

class UserHomeScreen extends StatefulWidget {
  static String id='UserHomeScreenID';
  @override
  _UserHomeScreenState createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  int selectedIndex=0;

  final taps=[
    UserAllJobsScreen(),
    UserUploadCvScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jobiny'),
        backgroundColor: kColor,
      ),
      drawer: Drawer(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,

        selectedItemColor: Color(0xFF6BCEFF),
        currentIndex: selectedIndex,
        onTap: (index){
          setState(() {
            selectedIndex=index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'All Jobs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.upload_file),
            label: 'Upload Cv',
          ),
        ],
      ),
      body: taps[selectedIndex],
    );

  }
}
