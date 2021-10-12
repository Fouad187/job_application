class AppliedJob
{
  late String postId;
  late String companyName;
  late String userId;
  late String userMail;
  late String userPhone;
  late String userAddress;

  AppliedJob({required this.postId , required this.companyName ,required this.userId ,required this.userMail ,required this.userAddress ,required this.userPhone});
  AppliedJob.fromJson(Map<String,dynamic> map)
  {
    if(map==null)
      {
        return;
      }
    else
      {
        postId=map['postId'];
        companyName=map['companyName'];
        userId=map['userId'];
        userMail=map['userMail'];
        userAddress=map['userAddress'];
        userPhone=map['userPhone'];
      }
  }

  toJson()
  {
    return {
      'postId':postId,
      'companyName':companyName,
      'userId' : userId,
      'userMail':userMail,
      'userAddress' :userAddress,
      'userPhone' : userPhone,
    };
  }

}