import 'package:flutter/material.dart';

class RecoveryTeamRequest extends StatelessWidget {
  const RecoveryTeamRequest({super.key});

  @override
  Widget build(BuildContext context) {
    const subtitle = '구난차량 요청';
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
                child: Icon(Icons.accessibility_outlined, size: 60),
              ),
              Text(subtitle, style: TextStyle(fontSize: 16)),
            ]
          )
        ),
        onTap: () {
          Navigator.push(
            context, MaterialPageRoute(builder: (context) => VehicleLocationCheck())
          );
        },
    )
    );
  }
}

class VehicleLocationCheck extends StatefulWidget {
  const VehicleLocationCheck({super.key});

  @override
  State<VehicleLocationCheck> createState() => _VehicleLocationCheckState();
}

class _VehicleLocationCheckState extends State<VehicleLocationCheck> {
 
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
            child: Text('차량 위치 확인', style: TextStyle(fontSize: 22.5, fontWeight: FontWeight.bold)),
          ),
          const Padding(
              padding: EdgeInsets.only(bottom: 10.0)
          ),
          //지도 api 대체
          Image.network(
            'https://user-images.githubusercontent.com/2384779/52900496-bb651780-3239-11e9-8a01-27f4cca590cb.jpg',
            width: 700.0,
            height: 350.0,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context, MaterialPageRoute(builder: (context) => RecoveryTeamRequestContent())
                );
              },
              child: const Text('다음', style: TextStyle(fontSize: 18.0)),
            ),
          ),
        ],
      )
    );
  }
}


class RecoveryTeamRequestContent extends StatefulWidget {
  const RecoveryTeamRequestContent({super.key});

  @override
  State<RecoveryTeamRequestContent> createState() => _RecoveryTeamRequestContentState();
}

class _RecoveryTeamRequestContentState extends State<RecoveryTeamRequestContent> {
 
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
            child: Text('구난 차량 요청 내용', style: TextStyle(fontSize: 22.5, fontWeight: FontWeight.bold)),
          ),
          const Padding(
              padding: EdgeInsets.only(bottom: 10.0)
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text('긴급출동 요청내용을 입력해주세요', style: TextStyle(fontSize: 18.0,)),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Container( 
              height: 220,
              width: 380,
              decoration: BoxDecoration(border: Border.all(),), 
              child: Text('요청내용 입력칸'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () => Navigator.of(context).pop(), 
              child: const Text('확인', style: TextStyle(fontSize: 18.0)),
            ),
          ),
        ],
      )
    );
  }
}