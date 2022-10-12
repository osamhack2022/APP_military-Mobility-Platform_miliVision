import 'package:flutter/material.dart';
import 'package:military_mobility_platform_frontend/provider/operation_info.dart';
import 'package:provider/provider.dart';
import 'package:military_mobility_platform_frontend/service/toast.dart';

class OperationPlan extends StatelessWidget {
  const OperationPlan({super.key});
  
  @override
  Widget build(BuildContext context) {
    const subtitle = '운행 계획 작성';

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
                  child: Icon(Icons.menu_book_outlined, size: 60),
                ),
                Text(subtitle, style: TextStyle(fontSize: 16)),
              ]
            )
          ),
          onTap: () {
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => OperationPlanSet())
            );
          },
      )
    );
  }
}

class OperationPlanSet extends StatefulWidget {
  const OperationPlanSet({super.key});

  @override
  State<OperationPlanSet> createState() => _OperationPlanSetState();
}

class _OperationPlanSetState extends State<OperationPlanSet> {
  TextEditingController TdriverInfo = TextEditingController();
  TextEditingController TcommanderInfo = TextEditingController();
  TextEditingController ToperationPurpose = TextEditingController();
  TextEditingController ToperationNote = TextEditingController();


  @override
  Widget build(BuildContext context) {
    List<bool> _isFilled = [false, false, false, false,];

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
            child: Text('운행 계획 작성', style: TextStyle(fontSize: 22.5, fontWeight: FontWeight.bold)),
          ),
          const Padding(
              padding: EdgeInsets.only(bottom: 25.0)
          ),
          Column( 
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 12.0, bottom: 12.0),
                child: Text('운전자 정보를 등록해주세요.(*)'),
              ),
              Row(
                children: [       
                  Padding(
                    padding: EdgeInsets.only(left: 12.0),
                  ),
                  SizedBox(
                    width: 350,
                    child:
                      TextField(
                        onChanged: (val) { 
                          setState(() {
                            _isFilled[0] = true;
                          });
                          context.watch<OperationInfoProvider>().driverInfo = val;
                        },
                        decoration: 
                          const InputDecoration(hintText: "일병 OOO", 
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                      ),
                  ),
                ]
              ),
              Padding(
                padding: EdgeInsets.only(left: 12.0, bottom: 30.0, top: 5.0),
                child: Text('직접 운전 간부의 경우에는 본인의 성함을 기입해주세요.', style: TextStyle(fontSize: 12.0)),
              ),  
            ]
          ),
          Column( 
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 12.0, bottom: 12.0),
                child: Text('선탑자 정보를 등록해주세요.(*)'),
              ),     
              Row(
                children: [       
                  Padding(
                    padding: EdgeInsets.only(left: 12.0),
                  ),
                  SizedBox(
                    width: 350,
                    child:
                      TextField(
                        onChanged: (val) { 
                          setState(() {
                            _isFilled[1] = true;
                          });
                          context.watch<OperationInfoProvider>().commanderInfo = val;
                        },
                        decoration: 
                          const InputDecoration(hintText: "중사 OOO", 
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                      ),
                  ),
                ]
              ),
              Padding(
                padding: EdgeInsets.only(left: 12.0, bottom: 30.0, top: 5.0),
                child: Text('직접 운전 간부의 경우에는 본인의 성함을 기입해주세요.', style: TextStyle(fontSize: 12.0)),
              ), 
            ]
          ),
          Column( 
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 12.0, bottom: 12.0),
                child: Text('운행 목적을 입력해주세요.(*)'),
              ),  
              Row(
                children: [       
                  Padding(
                    padding: EdgeInsets.only(left: 12.0),
                  ),
                  SizedBox(
                    width: 350,
                    child:
                      TextField(
                        onChanged: (val) {
                          setState(() {
                            _isFilled[2] = true;
                          }); 
                          context.watch<OperationInfoProvider>().operationPurpose = val;
                        },
                        decoration: 
                          const InputDecoration(hintText: "ex) 환자 후송, 출장, 회의 참석 등", 
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                      ),
                  ),
                ]
              ),
              Padding(
                padding: EdgeInsets.only(left: 12.0, bottom: 30.0, top: 5.0),
                child: Text('운행 목적을 상세하게 입력해주세요.', style: TextStyle(fontSize: 12.0)),
              ), 
          ]),
          Column( 
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 12.0, bottom: 12.0),
                child: Text('비고기재란.(*)'),
              ),  
              Row(
                children: [       
                  Padding(
                    padding: EdgeInsets.only(left: 12.0),
                  ),
                  SizedBox(
                    width: 350,
                    child:
                      TextField(
                        onChanged: (val) { 
                          setState(() {
                            _isFilled[3] = true;
                          });
                          context.watch<OperationInfoProvider>().operationNote = val;
                        },
                        decoration: 
                          const InputDecoration(hintText: "ex) 이동 간 동승자 경유지에서 탑승 예정", 
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                      ),
                  ),
                ]
              ),
              Padding(
                padding: EdgeInsets.only(left: 12.0, bottom: 30.0, top: 5.0),
                child: Text('기타 운행계획의 특이사항을 입력해주세요.', style: TextStyle(fontSize: 12.0)),
              ), 
          ]),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
                int check = 0;
                for(int i=0; i < _isFilled.length; i++){
                  if(_isFilled[i] == false) {
                    Toast.showFailToast('모든 항목을 작성해주십이오.');
                    check++;
                    break;
                  }
                }
                if(check == 0) {
                  Toast.showSuccessToast('운전 계획이 작성되었습니다.');
                  Navigator.of(context).pop();
                }
              },
              child: const Text('운행 계획 작성하기', style: TextStyle(fontSize: 18.0)),
            ),
          ),
        ],
      )
    );
  }
}