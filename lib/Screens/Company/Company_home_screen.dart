import 'package:flutter/material.dart';
import 'package:job_app/Providers/company_data.dart';
import 'package:job_app/Screens/Company/Taps/company_chat_screen.dart';
import 'package:job_app/Screens/Company/Taps/company_cvs_screen.dart';
import 'package:job_app/Screens/Company/Taps/company_home_page_screen.dart';
import 'package:provider/provider.dart';

class CompanyHomeScreen extends StatefulWidget {
  static String id='CompanyHomeScreenID';

  @override
  _CompanyHomeScreenState createState() => _CompanyHomeScreenState();
}

class _CompanyHomeScreenState extends State<CompanyHomeScreen> {
  int selectedIndex=0;

  final taps=[
    CompanyHomePageScreen(),
    CompanyCvsScreen(),
    CompanyChatScreen(),
  ];
   

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            icon: Icon(Icons.home),
            label: 'Home Page',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.text_format_outlined),
            label: 'Cv\'s',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Chats',
          ),
        ],
      ),
      body: taps[selectedIndex],
    );
  }
}
