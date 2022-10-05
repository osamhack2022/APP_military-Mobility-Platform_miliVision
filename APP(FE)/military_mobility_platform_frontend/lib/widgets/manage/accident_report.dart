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
  String dropdownvalue = '차 대 사람';

  var items = [
    '차 대 사람',
    '차 대 차',
    '차 대 이륜차',
    '차 대 자전거',
    '고속도로',
  ];

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
          Padding(
            padding: EdgeInsets.only(left: 140.0),
            child: 
              DropdownButton(
               
              // Initial Value
              value: dropdownvalue,
               
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),   
               
              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ), 
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10.0, top: 100.0),
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
              onPressed: () {
                Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AccidentReportSetImage())
                );
              }, 
              child: const Text('다음', style: TextStyle(fontSize: 18.0)),
            ),
          )
        ],
      )
    );
  }
}

class AccidentReportSetImage extends StatefulWidget {
  const AccidentReportSetImage({super.key});

  @override
  State<AccidentReportSetImage> createState() => _AccidentReportSetImageState();
}

class _AccidentReportSetImageState extends State<AccidentReportSetImage> {
  
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
            child: Text('사고현장 사진 업로드', style: TextStyle(fontSize: 22.5, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Container( 
              height: 400,
              width: 380,
              decoration: BoxDecoration(border: Border.all(),), 
            ),
          ),
          const Padding(
              padding: EdgeInsets.only(bottom: 20.0)
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () => Navigator.of(context).pop(), 
              child: const Text('사고현장 사진 업로드', style: TextStyle(fontSize: 18.0)),
            ),
          )
        ],
      )
    );
  }
}