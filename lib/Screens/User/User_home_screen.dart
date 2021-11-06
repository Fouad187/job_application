import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_app/Models/User.dart';
import 'package:job_app/Providers/user_data.dart';
import 'package:job_app/Screens/Auth/Login_Screen.dart';
import 'package:job_app/Screens/User/Taps/UserUploadCvScreen.dart';
import 'package:job_app/Screens/User/Taps/user_all_job_screen.dart';
import 'package:job_app/Screens/User/user_chat_list.dart';
import 'package:job_app/constant.dart';
import 'package:provider/provider.dart';

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
    UserModel userInstance=Provider.of<UserData>(context,listen: true).user;

    return Scaffold(
      appBar: AppBar(
        title: Text('Jobiny'),
        backgroundColor: kColor,
      ),
      drawer: Drawer(
        child: Scaffold(
          body: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          await Provider.of<UserData>(context,listen: false).saveAndUploadImage(src: ImageSource.gallery , context: context);
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(
                              image: Provider.of<UserData>(context,listen:true).user.image!='' ? NetworkImage(Provider.of<UserData>(context,listen:true).user.image) as ImageProvider : AssetImage('assets/images/empty.png') ,
                              fit:Provider.of<UserData>(context,listen:true).user.image!='' ? BoxFit.fill : BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(userInstance.name , style: TextStyle(fontSize: 18 , color: Colors.white),),
                    Text('Flutter Developer', style: TextStyle(color: Colors.white),),
                  ],

                ),
              ),
              ListTile(
                title: Text('Profile', style: TextStyle(color: Colors.black),),
                leading: Icon(Icons.person, color: Colors.blueAccent),
                onTap: (){

                },
              ),
              ListTile(
                title: Text('Chats', style: TextStyle(color: Colors.black),),
                leading: Icon(Icons.message, color: Colors.blueAccent),
                onTap: (){
                  Navigator.pushNamed(context, UserChatList.id);
                },
              ),
              ListTile(
                title: Text('Log Out', style: TextStyle(color: Colors.black),),
                leading: Icon(Icons.logout, color: Colors.blueAccent),
                onTap: (){
                  Provider.of<UserData>(context,listen: false).logOut().then((value) {
                    Navigator.pushNamedAndRemoveUntil(context, LoginScreen.id, (route) => false);
                  });
                },
              ),
            ],
          ),
        ),
      ),
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
