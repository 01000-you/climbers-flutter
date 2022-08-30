import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// 1-3. 리스트 화면 (임포트)
class Search_page extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<Search_page> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('테스트페이지'),
        ),
        body: Center(
          child: Container(
              child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Text(name),
              ElevatedButton(
                  onPressed: () async {
                    DocumentSnapshot test1docData = await firestore
                        .collection('test')
                        .doc('test1doc')
                        .get();
                    print(test1docData.id);
                    setState(() {
                      name = test1docData['name'];
                    });
                  },
                  child: Text('데이터 불러오기'))
            ],
          )),
        ));
  }
}
