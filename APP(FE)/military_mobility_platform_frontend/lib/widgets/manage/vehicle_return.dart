import 'package:flutter/material.dart';
import 'package:military_mobility_platform_frontend/service/toast.dart';

class VehicleReturn extends StatelessWidget {
  const VehicleReturn({super.key});

  @override
  Widget build(BuildContext context) {
    const subtitle = '차량반납';
    return Material( child:
    GestureDetector(
      child: 
        Container(
          width: 168,
          height: 149,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(1.0),
                spreadRadius: 0,
                blurRadius: 7,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0,25,0,20),
                child: Icon(Icons.subdirectory_arrow_left, size: 60),
              ),
              Text(subtitle, style: TextStyle(fontSize: 16)),
            ]
          )
        ),
        onTap: () {
          Toast.showSuccessToast('차량 반납 완료');
          //서버에 반납 완료 보내는 코드
          /*
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Center(
                  child: Container(
                    width: 300.0,
                    height: 200.0,
                    child: Column(
                      children: [
                        Text('차량반납 요청이 완료되었습니다.', style: TextStyle(fontSize: 18.0)),
                        Text('수송업무 담당자 확인 후 PUSH 알림으로 반납완료 처리 예정입니다.', style: TextStyle(fontSize: 15.0)),
                      ],
                    )
                  )
                ),
                actions: [
                  Center(
                    child: TextButton(
                      child: Text('닫기'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }
                    ),
                  ),
                ],
              );
            },
          );*/
        },
      )
    );
  }
}
/*
void showToast(){
  Fluttertoast.showToast(
    msg: '차량 반납 완료',
    gravity: ToastGravity.TOP,
    backgroundColor: Color(0xffffffff),
    fontSize: 20,
    textColor: Colors.black,
    toastLength: Toast.LENGTH_SHORT,
  );
}
*/

class VehicleReturnSet extends StatefulWidget {
  const VehicleReturnSet({super.key});

  @override
  State<VehicleReturnSet> createState() => _VehicleReturnSetState();
}

class _VehicleReturnSetState extends State<VehicleReturnSet> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.black,
            iconSize: 15.0,
            onPressed: () {Navigator.of(context).pop();},
          ),
          const Padding(
              padding: EdgeInsets.only(bottom: 10.0)
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text('차량반납', style: TextStyle(fontSize: 22.5, fontWeight: FontWeight.bold)),
          ),
          const Padding(
              padding: EdgeInsets.only(bottom: 10.0)
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () => Navigator.of(context).pop(), 
              child: const Text('차량 반납하기', style: TextStyle(fontSize: 18.0)),
            ),
          ),
        ],
      )
    );
  }
}