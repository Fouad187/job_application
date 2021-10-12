class Post
{
  late String id;
  late String companyName;
  late String date;
  late String post;
  late String appliedNumber;
  late String companyPhoto;
  bool isApplied=false;
  Post({required this.id , required this.companyName , required this.date , required this.post , required this.appliedNumber , required this.companyPhoto , required this.isApplied});

  Post.fromJson(Map<String , dynamic> map)
  {
    if(map==null)
      {
        return;
      }
    else
      {
        id = map['id'];
        companyName=map['companyName'];
        date=map['date'];
        post=map['post'];
        appliedNumber=map['appliedNumber'];
        companyPhoto=map['companyPhoto'];
      }
  }
  toJson()
  {
    return {
      'id' : id,
      'companyName':companyName,
      'date':date,
      'post':post,
      'appliedNumber' : appliedNumber,
      'companyPhoto':companyPhoto,
    };
  }





}