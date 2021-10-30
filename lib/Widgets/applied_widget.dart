import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:job_app/Models/Applied_job.dart';
import 'package:job_app/Screens/Company/View_Cv_Screen.dart';
import 'package:job_app/constant.dart';

class AppliedWidget extends StatefulWidget {
  AppliedJob userApply;
  AppliedWidget({required this.userApply});

  @override
  State<AppliedWidget> createState() => _AppliedWidgetState();
}

class _AppliedWidgetState extends State<AppliedWidget> {
  bool isConsidiration=false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Card(
        elevation: 2,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                        image: widget.userApply.userImage !='' ? NetworkImage(widget.userApply.userImage) as ImageProvider : AssetImage('assets/images/user.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.userApply.userName,  style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w500),),
                        Text(widget.userApply.jobTitle , style: TextStyle(color: Colors.grey),),
                        SizedBox(height: 10,),

                        Text(widget.userApply.userMail, style: TextStyle(), maxLines: 1, overflow: TextOverflow.ellipsis,),
                        SizedBox(height: 5,),
                        Text(widget.userApply.userAddress),
                      ],
                    ),
                  ),
                  SizedBox(width: 10,),
                  InkWell(
                      onTap: () async {
                        if(widget.userApply.userCv !='')
                          {
                            final doc = await PDFDocument.fromURL(widget.userApply.userCv).then((value) {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ViewCvScreen(doc: value, userName: widget.userApply.userName),));
                            });
                          }
                        else
                          {
                            Fluttertoast.showToast(
                                msg: "User didn\'t Upload her Cv",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                backgroundColor: Colors.black,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                          }
                      },
                      child: Text('View Cv' , style: TextStyle(fontSize: 16 , fontWeight: FontWeight.w500 , color: kColor),)),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      onPressed: (){},
                      child: Text('Rejected',style: TextStyle(color: Colors.white),),
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                        ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: MaterialButton(
                      onPressed: (){
                        setState(() {
                          isConsidiration=true;
                        });
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: isConsidiration == false ? Text('In Considiration',style: TextStyle(color: Colors.white),) :
                      Text('Send Message',style: TextStyle(color: Colors.white),),
                      color: Colors.green,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
