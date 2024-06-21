import 'package:flutter/material.dart';
import 'package:frontend/screen/MealPage/MealTime.dart';
import 'package:frontend/screen/MedicalPage/MedicalHistory.dart';
import 'package:frontend/screen/ExercisePage/ExercisePage.dart';
import 'package:frontend/screen/MyPage/Mypage.dart';
import 'package:frontend/screen/LoginPage/Login.dart';
import 'package:frontend/screen/SymtomPage/SymtomHistory.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:frontend/Api/RootUrlProvider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String username = '';

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token != null && token.isNotEmpty) {
      Map<String, String> header = {
        "accept": "*/*",
        "Authorization": "Token $token"
      };

      print('token: $token');
      print('$header');
      try {
        var response = await http.get(
            Uri.parse('${RootUrlProvider.baseURL}/accounts/mypage/'),
            headers: header);

        if (response.statusCode == 200) {
          var userData = json.decode(response.body);
          print('$userData');
          setState(() {
            username = userData['userName']; // 수정: 사용자 이름 업데이트
          });
        } else {
          print('Failed to load user data: ${response.statusCode}');
          // 실패 처리 로직 추가
        }
      } catch (e) {
        print('Error loading user data: $e');
        // 예외 처리 로직 추가
      }
    } else {
      print('Token not found');
      // 토큰 없음 처리 로직 추가
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('메인 화면'),
          leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.all(10)),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Mypage(),
                          ),
                        );
                      },
                      child: Image.asset(
                        'images/mainPageImg/grandma.png',
                        width: width * 0.1,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Mypage(),
                          ),
                        );
                      },
                      child: Text(
                        username.isNotEmpty ? '$username님' : '사용자 이름 없음',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(width * 0.03),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(160, 160),
                    backgroundColor: Color(0xFFFFCC66),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 4,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SymtomHistory()),
                    );
                  },
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: width * 0.024)),
                      Image.asset(
                        'images/mainPageImg/healthIcon.png',
                        height: width * 0.16,
                      ),
                      Text(
                        '건강',
                        style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(160, 160),
                    backgroundColor: Color(0xFF8ED973),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 4,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Exercisepage()), // 수정: Exercisepage -> ExercisePage
                    );
                  },
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: width * 0.024)),
                      Image.asset(
                        'images/mainPageImg/exerciseIcon.png',
                        height: width * 0.16,
                      ),
                      Text(
                        '운동',
                        style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(width * 0.024),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(160, 160),
                    backgroundColor: Color(0xFFFF9966),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 4,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MealTime()),
                    );
                  },
                  child: Column(children: [
                    Padding(padding: EdgeInsets.only(top: width * 0.024)),
                    Image.asset(
                      'images/mainPageImg/mealIcon.png',
                      height: width * 0.16,
                    ),
                    Text(
                      '식사',
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ]),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(160, 160),
                    backgroundColor: Color(0xFFA1DCFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 4,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MedicalHistory()),
                    );
                  },
                  child: Column(children: [
                    Padding(padding: EdgeInsets.only(top: width * 0.024)),
                    Image.asset(
                      'images/mainPageImg/medicalIcon.png',
                      height: width * 0.16,
                    ),
                    Text(
                      '진료',
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ]),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(width * 0.04),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(160, 40),
                backgroundColor: Colors.blueGrey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 4,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              child: Text(
                '로그인 화면으로',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(width * 0.05),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.08),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: width * 0.17,
                        height: width * 0.17,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 170, 170, 170),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Image.asset(
                              'images/mainPageImg/callIcon.png',
                              width: width * 0.08,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        '상담전화',
                        style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                  Column(children: [
                    SizedBox(
                      width: width * 0.17,
                      height: width * 0.17,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 170, 170, 170),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Image.asset(
                            'images/mainPageImg/qnaIcon.png',
                            width: width * 0.07,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      '문의하기',
                      style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    )
                  ])
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(width * 0.02),
            ),
          ],
        ),
      ),
    );
  }
}
