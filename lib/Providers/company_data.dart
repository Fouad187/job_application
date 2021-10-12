import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:job_app/Models/Post.dart';
import 'package:job_app/Models/User.dart';
import 'package:job_app/Services/Company_Services.dart';

class CompanyData extends ChangeNotifier
{
  late UserModel user;
  CompanyServices companyServices=CompanyServices();
  List<Post> companyPosts=[];

  setUser(UserModel userModel)
  {
    this.user=userModel;
  }

  getCompanyPosts({required String companyName})
  {
    companyServices.getCompanyPosts(companyName: companyName).then((value) {
      companyPosts=value;
      notifyListeners();
    });
  }
  addToCompanyPostList(Post post)
  {
    companyPosts.add(post);
    notifyListeners();
  }
}