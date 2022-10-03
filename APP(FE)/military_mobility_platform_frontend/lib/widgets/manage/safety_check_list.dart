import 'package:flutter/material.dart';

class SafetyCheckList extends StatelessWidget {
  const SafetyCheckList({super.key});

  @override
  Widget build(BuildContext context) {
    const subtitle = '안전 점검표';
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
                child: Icon(Icons.checklist, size: 60),
              ),
              Text(subtitle, style: TextStyle(fontSize: 16)),
            ]
          )
        ),
        onTap: () {
          Navigator.push(
            context, MaterialPageRoute(builder: (context) => SafetyCheckListSet())
          );
        },
    )
    );
  }
}

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    super.key,
    required this.label,
    required this.padding,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Expanded(child: Text(label, style: TextStyle(fontSize: 14.0))),
            Checkbox(
              value: value,
              onChanged: (bool? newValue) {
                onChanged(newValue!);
              },
              activeColor: Color(0xFF6200EE),
            ),
          ],
        ),
      ),
    );
  }
}

class SafetyCheckListSet extends StatefulWidget {
  const SafetyCheckListSet({super.key});

  @override
  State<SafetyCheckListSet> createState() => _SafetyCheckListSetState();
}

class _SafetyCheckListSetState extends State<SafetyCheckListSet> {
  bool _isSelected1 = false;
  bool _isSelected2 = false;
  bool _isSelected3 = false;
  bool _isSelected4 = false;
  bool _isSelected5 = false;
  bool _isSelected6 = false;
  bool _isSelected7 = false;

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
            child: Text('안전 점검표', style: TextStyle(fontSize: 22.5, fontWeight: FontWeight.bold)),
          ),
          const Padding(
              padding: EdgeInsets.only(bottom: 10.0)
          ),
          LabeledCheckbox(
            label: '어느 한쪽 타이어의 공기압력이 현저히 줄어들지 않았는가?',
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            value: _isSelected1,
            onChanged: (bool newValue) {
              setState(() {
                _isSelected1 = newValue;
              });
            },
          ),
          LabeledCheckbox(
            label: '타이어가 지면에 닿는 트레드 부분이 과마모되지 않았는가?',
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            value: _isSelected2,
            onChanged: (bool newValue) {
              setState(() {
                _isSelected2 = newValue;
              });
            },
          ),
          LabeledCheckbox(
            label: '각 타이어 측면이 갈라지거나 찢기지 않았는가?',
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            value: _isSelected3,
            onChanged: (bool newValue) {
              setState(() {
                _isSelected3 = newValue;
              });
            },
          ),
          LabeledCheckbox(
            label: '클러치나 브레이크 페달의 유격 및 브레이크 액의 수준은 양호한가?',
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            value: _isSelected4,
            onChanged: (bool newValue) {
              setState(() {
                _isSelected4 = newValue;
              });
            },
          ),
          LabeledCheckbox(
            label: '각종오일(엔진오일, 파워핸들 오일, 자동변속기 오일 등)의 양은 적정한가?',
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            value: _isSelected5,
            onChanged: (bool newValue) {
              setState(() {
                _isSelected5 = newValue;
              });
            },
          ),
          LabeledCheckbox(
            label: '각종 안전장구류(삼각대, 스노우체인 등)은 보유하고 있는가?',
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            value: _isSelected6,
            onChanged: (bool newValue) {
              setState(() {
                _isSelected6 = newValue;
              });
            },
          ),
          LabeledCheckbox(
            label: '장시간 운행 시 적정한 휴식을 취하며 적당한 스트레칭을 하는가?',
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            value: _isSelected7,
            onChanged: (bool newValue) {
              setState(() {
                _isSelected7 = newValue;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () => print('clicked'), 
              child: const Text('안전 점검표 제출하기', style: TextStyle(fontSize: 18.0)),
            ),
          ),
        ],
      )
    );
  }
}