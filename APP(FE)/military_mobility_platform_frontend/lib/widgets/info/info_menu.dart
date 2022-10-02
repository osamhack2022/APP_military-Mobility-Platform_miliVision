import 'package:flutter/material.dart';

class InfoMenu extends StatelessWidget {
  const InfoMenu({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: Column(
        children: [
          TextButton( child: Text('이용내역'), onPressed: (){} ),
          TextButton( child: Text('내 정보 수정'), onPressed: (){} ),
          TextButton( child: Text('공지사항'), onPressed: (){} ),
          TextButton( child: Text('자주하는 질문'), onPressed: (){} ),
          TextButton( child: Text('이용방법'), onPressed: (){} ),
          TextButton( child: Text('사고센터 접수'), onPressed: (){} ),
          TextButton( child: Text('앱 권한 설정'), onPressed: (){} ),
          TextButton( child: Text('개인정보처리방침'), onPressed: (){} ),
        ]
      )
    );
  }
}