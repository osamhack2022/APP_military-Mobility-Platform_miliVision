import 'package:flutter/material.dart';

class EmergencyEvacuationRequest extends StatelessWidget {
  const EmergencyEvacuationRequest({super.key});

  @override
  Widget build(BuildContext context) {
    const subtitle = '응급환자 후송 요청';
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
                child: Icon(Icons.vaccines_outlined, size: 60),
              ),
              Text(subtitle, style: TextStyle(fontSize: 16)),
            ]
          )
        ),
        onTap: () {
          Navigator.push(
            context, MaterialPageRoute(builder: (context) => EmergencyEvacuationRequestSet())
          );
        },
    )
    );
  }
}

class EmergencyEvacuationRequestSet extends StatefulWidget {
  const EmergencyEvacuationRequestSet({super.key});

  @override
  State<EmergencyEvacuationRequestSet> createState() => _EmergencyEvacuationRequestSetState();
}

class _EmergencyEvacuationRequestSetState extends State<EmergencyEvacuationRequestSet> {
 
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
            child: Text('응급환자 후송 요청', style: TextStyle(fontSize: 22.5, fontWeight: FontWeight.bold)),
          ),
          const Padding(
              padding: EdgeInsets.only(bottom: 10.0)
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () => print('clicked'), 
              child: const Text('응급환자 후송 요청', style: TextStyle(fontSize: 18.0)),
            ),
          ),
        ],
      )
    );
  }
}