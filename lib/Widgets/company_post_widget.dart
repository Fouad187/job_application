import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_app/Models/Post.dart';
import 'package:job_app/constant.dart';

class CompanyPostWidget extends StatelessWidget {
  late Post post;
  CompanyPostWidget({required this.post});
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
                  Spacer(),
                  InkWell(
                      onTap: (){},
                      child: Icon(Icons.delete , color: Colors.grey,)),
                ],
              ),
              Divider(),
              Text(post.post),
              SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  
                },
                child: Container(
                  color: kColor,
                  padding: EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${post.appliedNumber}', style: TextStyle(fontSize: 18),),
                      SizedBox(width: 10,),
                      Text('Applied' , style: TextStyle(fontSize: 18),),
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
