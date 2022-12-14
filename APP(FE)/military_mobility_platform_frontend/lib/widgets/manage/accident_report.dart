import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as io;
import 'package:military_mobility_platform_frontend/provider/accident.dart';
import 'package:provider/provider.dart';

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
            context, MaterialPageRoute(builder: (childContext) => AccidentReportSet(context: context))
          );
        },
      )
    );
  }
}

class AccidentReportSet extends StatefulWidget {
  const AccidentReportSet({super.key, required this.context});
  final BuildContext context;

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
    return ChangeNotifierProvider<AccidentProvider>(
      create: (_) => AccidentProvider(),
        builder: (context,child){
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
                  padding: EdgeInsets.only(bottom: 25.0)
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text('사고접수', style: TextStyle(fontSize: 22.5, fontWeight: FontWeight.bold)),
              ),
              const Padding(
                  padding: EdgeInsets.only(bottom: 10.0)
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10.0, bottom: 20.0),
                child: Text('사고 유형을 선택해주세요.', style: TextStyle(fontSize: 18.0,)),
              ),
              Padding(
                padding: EdgeInsets.only(left: 50.0),
                child: Container( 
                  width: 300.0,
                  child: DropdownButton(
                    isExpanded: true,
                    value: dropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),   
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
                      context.read<AccidentProvider>().accidentTypeSet(dropdownvalue);
                    },
                  ), 
                )
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10.0, top: 200.0, bottom: 20.0),
                child: Text('사고 위치를 입력해주세요.', style: TextStyle(fontSize: 18.0,)),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                  children: [
                    Row(
                      children: [       
                        Padding(
                          padding: EdgeInsets.only(left: 2.0),
                        ),
                        SizedBox(
                          width: 350,
                          child:
                            TextField(
                              decoration: 
                                const InputDecoration(hintText: "서울특별시 동작구 OOO번길 OO", 
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                              onChanged: (val) => context.read<AccidentProvider>().accidentLocationSet(val)
                            ),
                        ),
                      ]
                    ),
                  ]
                ),
              ),
              Padding(
                    padding: EdgeInsets.only(left: 12.0, bottom: 50.0, top: 5.0),
                    child: Text('오른쪽 아이콘을 클릭해서 현재 위치를 조회해주세요.', style: TextStyle(fontSize: 12.0)),
              ), 
              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context, MaterialPageRoute(builder: (childContext) => AccidentReportSetImage(context: context))
                    );
                  }, 
                  child: const Text('다음', style: TextStyle(fontSize: 18.0)),
                ),
              )
            ],
          )
        );
      }
    );
  }
}

class AccidentReportSetImage extends StatefulWidget {
  const AccidentReportSetImage({super.key, required this.context});
  final BuildContext context;

  @override
  State<AccidentReportSetImage> createState() => _AccidentReportSetImageState();
}

class _AccidentReportSetImageState extends State<AccidentReportSetImage> {
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AccidentProvider>(
      create:(_) => AccidentProvider(),
      builder: (context, child) {
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
                padding: EdgeInsets.only(left: 10.0, bottom: 25.0),
                child: Text('사고현장 사진 업로드', style: TextStyle(fontSize: 22.5, fontWeight: FontWeight.bold)),
              ),
              /*
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Container( 
                  height: 400,
                  width: 380,
                  decoration: BoxDecoration(border: Border.all(),), 
                  child: Image.file(context.read<AccidentProvider>().accidentImage) == null
                        ?Text('')
                        :Image.file(context.read<AccidentProvider>().accidentImage),
                ),
              ),
              */
              const Padding(
                  padding: EdgeInsets.only(bottom: 20.0)
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () async {
                    var picker = ImagePicker();
                    var image = await picker.pickImage(source: ImageSource.camera);
                    if (image != null) {
                      context.read<AccidentProvider>().accidentImageSet(io.File(image.path));
                    }
                  },
                  child: const Text('카메라에서 사진 업로드하기', style: TextStyle(fontSize: 18.0)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () async {
                    var picker = ImagePicker();
                    var image = await picker.pickImage(source: ImageSource.gallery);
                    if (image != null) {
                      context.read<AccidentProvider>().accidentImageSet(io.File(image.path));
                    }
                  }, 
                  child: const Text('갤러리에서 사진 업로드하기', style: TextStyle(fontSize: 18.0)),
                ),
              ),
              const Padding(
                  padding: EdgeInsets.only(bottom: 20.0)
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    int count = 0;
                  Navigator.popUntil(context, (route) {
                      return count++ == 2;
                  });
                  }, 
                  child: const Text('접수하기', style: TextStyle(fontSize: 18.0)),
                ),
              )
            ],
          )
        );    
      }
    );
  }
}
