import 'package:climbers_flutter/screens/add_page.dart';
import 'package:climbers_flutter/screens/home_page.dart';
import 'package:climbers_flutter/screens/me_page.dart';
import 'package:climbers_flutter/screens/qr_page.dart';
import 'package:climbers_flutter/screens/search_page.dart';
import "package:flutter/material.dart";

// 1-2. 탭 화면 (각 화면 import)

// 1-2. 탭 화면 (Stateless -> Stateful)
class MainPage extends StatefulWidget {
  // 1-2. 탭 화면 (_selectedTabIndex 변수 옮김)
  // 1-2. 탭 화면 (탭 인덱스 설정)

  // 1-2. 탭 화면 (createState 함수 추가)
  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

// 1-2. 탭 화면 (State 구현)
class _MainPageState extends State<MainPage> {
  int _selectedTabIndex = 0;
  final List<Widget> _children = [
    Home_page(),
    Search_page(),
    Add_page(),
    QR_page(),
    Me_page()
  ];

// 1-2. 탭 화면 (build() 함수를 _MainState로 옮김)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // 1-1. 상단화면 (제목 수정)
          title: Text('Climbers'),
          // 1-1. 상단화면 (좌측 버튼 추가)
          leading: Icon(Icons.menu),
          // 1-1. 상단화면 (우측 팝업 버튼 및 이벤트 추가)
          // actions: <Widget>[
          //   IconButton(
          //     icon: Icon(Icons.sort),
          //     onPressed: () {},
          //   )
          // ]),
          actions: <Widget>[
            PopupMenuButton<int>(
              icon: Icon(Icons.sort),
              onSelected: (value) {
                if (value == 0)
                  print("예매율순");
                else if (value == 1)
                  print("큐레이션");
                else
                  print("최신순");
              },
              itemBuilder: (context) {
                return [
                  PopupMenuItem(value: 0, child: Text("예매율순")),
                  PopupMenuItem(value: 1, child: Text("큐레이션")),
                  PopupMenuItem(value: 2, child: Text("최신순"))
                ];
              },
            )
          ]),
      // 1-2. 탭 화면 (List, Grid Widget 연동)
      body: _children[_selectedTabIndex],
      // 1-2. 탭 화면 (bottomNavigationBar 추가)
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle), label: 'Add'),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: 'QR'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Me')
        ],
        currentIndex: _selectedTabIndex,
        onTap: (index) {
          setState(() {
            _selectedTabIndex = index;
            print("$_selectedTabIndex Tab Clicked");
          });
        },
      ),
    );
  }
}


// 1-2. 탭 화면 (List, Grid Widget 반환)
