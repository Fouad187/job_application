import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
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

}