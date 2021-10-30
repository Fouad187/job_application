import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:job_app/Providers/company_data.dart';
import 'package:job_app/Providers/user_data.dart';
import 'package:job_app/Screens/Company/Applied_for_post_screen.dart';
import 'package:job_app/Screens/Company/Company_home_screen.dart';
import 'package:provider/provider.dart';

import 'Providers/Modal_hud.dart';
import 'Screens/Auth/Login_Screen.dart';
import 'Screens/Auth/Registration_Screen.dart';
import 'Screens/User/User_home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ModalHud>(create: (context) => ModalHud(),),
        ChangeNotifierProvider<CompanyData>(create: (context) => CompanyData(),),
        ChangeNotifierProvider<UserData>(create: (context) => UserData(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: LoginScreen.id,
        routes: {
          /// Auth
          LoginScreen.id : (context)=> LoginScreen(),
          RegistrationScreen.id : (context)=> RegistrationScreen(),

          /// User
          UserHomeScreen.id:(context)=>UserHomeScreen(),

          /// Company
          CompanyHomeScreen.id:(context)=>CompanyHomeScreen(),
          AppliedForPostScreen.id:(context)=>AppliedForPostScreen(),
        },
      ),
    );

  }
}
