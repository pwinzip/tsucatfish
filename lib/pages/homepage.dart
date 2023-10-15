import 'package:catfishtsu/pages/formpage.dart';
import 'package:catfishtsu/utils/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF01F16F), Color(0xFF1174C1), Color(0xFF01B1DC)],
            ),
          ),
          child: Column(
            children: [
              createHeaderLogo(context),
              appName(),
              const Expanded(child: SizedBox()),
              startButton(),
              // logoApp(),
              const Expanded(child: SizedBox()),
              devByText1(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget logoApp() {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 250,
      child: Image.asset(
        "assets/images/app_logo.jpg",
        fit: BoxFit.contain,
      ),
    );
  }

  Widget startButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 32),
      height: 50,
      child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FormPage(),
                ));
          },
          child: const Text(
            "เริ่มต้นใช้งาน",
            style: TextStyle(fontSize: 20),
          )),
    );
  }

  Widget devByText() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      // color: Colors.grey[200],
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Application Thaksin Catfish Growth and Feed Consumption Ver. 1.0",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                "พัฒนาโดย โครงการวิจัยการพัฒนานวัตกรรมการเลี้ยงปลาดุกลูกผสมเพื่อผลิตเป็นวัตถุดิบสำหรับแปรรูปผลิตภัณฑ์ปลาดุกร้า บพท. 2566 คณะวิทยาศาสตร์และนวัตกรรมดิจิทัล \n มหาวิทยาลัยทักษิณ",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
