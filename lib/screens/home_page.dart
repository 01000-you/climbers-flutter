import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../cards/postCard.dart';

CollectionReference feedRef = FirebaseFirestore.instance.collection('Feeds');

// 1-3. 리스트 화면 (임포트)
class Home_page extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

List<PostCard> createTenPostCard(index) {
  List<PostCard> _newCard = [];
  for (int i = 0; i < 10; i++) {
    _newCard.add(PostCard(number: index + i));
  }
  return _newCard;
}

class _HomeScreenState extends State<Home_page> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final _postCards = <PostCard>[];

  @override
  Widget build(BuildContext context) {
    return Container(child: ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        if (index >= _postCards.length) {
          print('get Card');
          // feedRef.get().then((QuerySnapshot querySnapshot) {
          //   querySnapshot.docs.forEach((doc) {
          //     // print(doc['description']);
          //   });
          // });
          // print(feedRef.doc('02b04647-ae3d-4b46-904e-307331fcd3de').get());
          // var testData = await firestore.collection('test').doc('hhhh').get();

          _postCards.addAll(createTenPostCard(index));
        }

        // return PostCard(
        //   number: index,
        // );
        return _postCards[index];
      },
      // separatorBuilder: (BuildContext context, int index) {
      //   return SizedBox(
      //     height: 20,
      //   );
      // },
    ));
  }
}
