import 'package:flutter/material.dart';

class InfoMenu extends StatelessWidget {
  const InfoMenu({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: EdgeInsets.only(left:30),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
          TextButton( 
            onPressed: (){},
            style: TextButton.styleFrom(
              primary: Colors.black,
            ),
            child: Text('이용내역', style: TextStyle(fontSize: 14.0)), 
          ),
          const Padding(
                padding: EdgeInsets.only(bottom: 25.0)),
          TextButton( 
            onPressed: (){},
            style: TextButton.styleFrom(
              primary: Colors.black,
            ),
            child: Text('내 정보 수정', style: TextStyle(fontSize: 14.0)), 
          ),
          const Padding(
                padding: EdgeInsets.only(bottom: 25.0)),
          TextButton( 
            onPressed: (){},
            style: TextButton.styleFrom(
              primary: Colors.black,
            ),
            child: Text('공지사항', style: TextStyle(fontSize: 14.0)), 
          ),
          const Padding(
                padding: EdgeInsets.only(bottom: 25.0)),
          TextButton( 
            onPressed: (){},
            style: TextButton.styleFrom(
              primary: Colors.black,
            ),
            child: Text('자주하는 질문', style: TextStyle(fontSize: 14.0)), 
          ),   
          const Padding(
                padding: EdgeInsets.only(bottom: 25.0)),
          TextButton( 
            onPressed: (){},
            style: TextButton.styleFrom(
              primary: Colors.black,
            ),
            child: Text('이용방법', style: TextStyle(fontSize: 14.0)), 
          ),          
          const Padding(
                padding: EdgeInsets.only(bottom: 25.0)),
          TextButton( 
            onPressed: (){},
            style: TextButton.styleFrom(
              primary: Colors.black,
            ),
            child: Text('사고센터 접수', style: TextStyle(fontSize: 14.0)), 
          ),    
          const Padding(
                padding: EdgeInsets.only(bottom: 25.0)),
          TextButton( 
            onPressed: (){},
            style: TextButton.styleFrom(
              primary: Colors.black,
            ),
            child: Text('앱 권한 설정', style: TextStyle(fontSize: 14.0)), 
          ),    
          const Padding(
                padding: EdgeInsets.only(bottom: 25.0)),
          TextButton( 
            onPressed: (){},
            style: TextButton.styleFrom(
              primary: Colors.black,
            ),
            child: Text('개인정보처리방침', style: TextStyle(fontSize: 14.0)), 
          ),
        ]
      )
    );
  }
}