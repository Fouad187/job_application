import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_app/Providers/Modal_hud.dart';
import 'package:job_app/Services/Auth_Services.dart';
import 'package:job_app/Widgets/auth_button.dart';
import 'package:job_app/Widgets/text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'Registration_Screen.dart';

class LoginScreen extends StatelessWidget {
  static String id='LoginScreenID';

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

   Auth auth=Auth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<ModalHud>(context).isChange,
        child: SingleChildScrollView(
          child: Column(
            children: [

              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  color: Color(0xFF6BCEFF),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(120)),
                ),
                child: Center(child: SvgPicture.asset('assets/images/login.svg' , width: 150, height: 150,)),
              ),
              SizedBox(height: 40,),
              Text('Welcome Back!' , style: TextStyle(fontSize: 22 , fontWeight: FontWeight.w700),),
              Padding(
                  padding:const EdgeInsets.all(20),
                  child: Container(
                    child: Form(
                      key: _globalKey,
                      child: Column(
                        children: [
                          MyTextField(label: 'Email', picon: Icon(Icons.person , color: Color(0xFF6BCEFF), size: 30,), controller: emailController, validate: (value){}),
                          SizedBox(height: 20,),
                          MyTextField(label: 'Password', picon: Icon(Icons.lock , color: Color(0xFF6BCEFF), size: 30,), security: true , controller: passwordController, validate: (value){}),
                          SizedBox(height: 40,),
                          Center(child: AuthButton(
                              tap: () async {
                                final instance = Provider.of<ModalHud>(context, listen: false);
                                instance.changeIsLoading(true);
                                if (_globalKey.currentState!.validate()) {
                                  _globalKey.currentState!.save();
                                  try
                                  {
                                    await auth.signIn(email: emailController.text , password: passwordController.text , context: context);

                                  }
                                  catch (e) {
                                    instance.changeIsLoading(false);
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Wrong Email or Password')));
                                  }
                                }
                              }, text: 'Login')),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Don\'t have an account?'),
                              SizedBox(width: 5,),
                              InkWell(
                                  onTap: (){
                                    Navigator.pushNamed(context, RegistrationScreen.id);
                                  },
                                  child: Text('Sing Up' , style: TextStyle(fontWeight: FontWeight.w500 , color: Colors.blueAccent),)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),),
            ],
          ),
        ),
      ),
    );
  }
}
