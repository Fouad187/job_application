import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:job_app/Models/Applied_job.dart';
import 'package:job_app/Models/Cv.dart';
import 'package:job_app/Models/Post.dart';

class CompanyServices
{

  Future<void> addNewPost(Post post) async
  {
    await FirebaseFirestore.instance.collection('Posts').doc(post.id).set(post.toJson());
  }
 Future<List<Post>> getCompanyPosts({required String companyName}) async
 {
   List<Post> posts=[];
   await FirebaseFirestore.instance.collection('Posts').where('companyName' , isEqualTo: companyName).get().then((value) => {
       for(int i=0 ; i<value.docs.length ; i++)
         {
           posts.add(Post.fromJson(value.docs[i].data())),
         }
   });
   return posts;
 }
  Future<List<AppliedJob>> getAppiedForPost({required String postId}) async
  {
    List<AppliedJob> appliedPosts = [];
    await FirebaseFirestore.instance.collection('Applied').where(
        'postId', isEqualTo: postId).get().then((value) =>
    {
      for(int i = 0; i < value.docs.length; i++)
        {
          appliedPosts.add(AppliedJob.fromJson(value.docs[i].data())),
        }
    });
    return appliedPosts;
  }

  Future<List<CvModel>> getCvByCategory({required String category}) async
  {
    List<CvModel> Cvs=[];
    await FirebaseFirestore.instance.collection('Cv').where('category' , isEqualTo: category).get().then((value) {
      for(int i = 0; i < value.docs.length; i++)
      {
        Cvs.add(CvModel.fromJson(value.docs[i].data()));
      }
    });
    return Cvs;
  }
}