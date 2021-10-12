import 'package:flutter/material.dart';
import 'package:job_app/Models/Applied_job.dart';
import 'package:job_app/Models/Post.dart';
import 'package:job_app/Providers/user_data.dart';
import 'package:job_app/Services/User_Services.dart';
import 'package:provider/provider.dart';

import '../constant.dart';

class UserPostWidget extends StatelessWidget {
  late Post post;
  late int index;
  UserPostWidget({required this.post , required this.index});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${post.companyName} Company' , style: TextStyle(fontWeight: FontWeight.w600),),
                      SizedBox(height: 5,),
                      Text(post.date , style: TextStyle(color: Colors.grey),),
                    ],
                  ),
                ],
              ),
              Divider(),
              Text(post.post),
              SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  if(!post.isApplied)
                    {
                     final userInstance=Provider.of<UserData>(context,listen: false).user;
                      AppliedJob job=AppliedJob(postId: post.id, companyName: post.companyName, userId: userInstance.id, userMail: userInstance.email, userAddress: userInstance.address, userPhone: userInstance.phone);
                      Provider.of<UserData>(context,listen: false).apply(job: job, postIndex: index , appliedNumber: post.appliedNumber);
                    }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: post.isApplied ?Colors.blueGrey :Colors.blue,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Text('${post.appliedNumber}', style: TextStyle(fontSize: 18),),
                     // SizedBox(width: 10,),
                      post.isApplied ? Text('Applied' , style: TextStyle(fontSize: 18 , color: Colors.white),):Text('Apply For job' , style: TextStyle(fontSize: 18 , color: Colors.white),),
                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );

  }
}
