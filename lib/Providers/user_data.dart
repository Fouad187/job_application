import 'package:flutter/cupertino.dart';
import 'package:job_app/Models/Applied_job.dart';
import 'package:job_app/Models/Post.dart';
import 'package:job_app/Models/User.dart';
import 'package:job_app/Services/User_Services.dart';

class UserData extends ChangeNotifier
{
  late UserModel user;
  UserServices userServices=UserServices();
  List<Post> posts=[];
  List<AppliedJob> applied=[];
  setUser(UserModel userModel)
  {
    this.user=userModel;
  }
  getPosts({required userId , required context})
  {
    userServices.getAllPosts(userId: userId , context: context).then((value) {
      posts=value;
      notifyListeners();
    });
  }
  apply({required AppliedJob job , required int postIndex, required String appliedNumber})
  {
    userServices.applyForJob(job: job , appliedNumber: appliedNumber).then((value) {
      posts[postIndex].isApplied=true;
      notifyListeners();
    });
  }
}