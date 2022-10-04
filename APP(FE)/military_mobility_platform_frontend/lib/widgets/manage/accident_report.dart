import 'package:flutter/material.dart';

class AccidentReport extends StatelessWidget {
  const AccidentReport({super.key});

  @override
  Widget build(BuildContext context) {
    const subtitle = '사고접수';
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
                child: Icon(Icons.car_crash_outlined, size: 60),
              ),
              Text(subtitle, style: TextStyle(fontSize: 16)),
            ]
          )
        ),
        onTap: () {
          Navigator.push(
            context, MaterialPageRoute(builder: (context) => AccidentReportSet())
          );
        },
    )
    );
  }
}

class AccidentReportSet extends StatefulWidget {
  const AccidentReportSet({super.key});

  @override
  State<AccidentReportSet> createState() => _AccidentReportSetState();
}

class _AccidentReportSetState extends State<AccidentReportSet> {
 
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
            child: Text('사고접수', style: TextStyle(fontSize: 22.5, fontWeight: FontWeight.bold)),
          ),
          const Padding(
              padding: EdgeInsets.only(bottom: 10.0)
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text('사고 유형을 선택해주세요.', style: TextStyle(fontSize: 18.0,)),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text('---사고 유형을 선택해주세요.---', style: TextStyle(fontSize: 15.0,)),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text('사고 위치를 입력해주세요.', style: TextStyle(fontSize: 18.0,)),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Column(
              children: [
                TextField(
                  decoration:
                    const InputDecoration(hintText: "서울특별시 동작구 OOO번길 OO", 
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                    )
                ),
                Text('기타 운행계획의 특이사항을 입력해주세요.', style: TextStyle(fontSize: 10.0)),
              ]
            )
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () => Navigator.of(context).pop(), 
              child: const Text('사고 접수하기', style: TextStyle(fontSize: 18.0)),
            ),
          ),
        ],
      )
    );
  }
}