import 'package:catfishtsu/utils/header.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage(
      {super.key,
      required this.lastWeight,
      required this.finalWeight,
      required this.suitableFeed});

  final double lastWeight, finalWeight, suitableFeed;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            createHeaderLogo(context),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text(
                "ผลการคำนวณ",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
              ),
            ),
            resultTitle(
                title: "น้ำหนักเฉลี่ยต่อตัวของปลา",
                titleColor: const Color(0xFF02A696)),
            resultCard(
                widget.lastWeight, "กรัมต่อตัว", const Color(0xFF02A696)),
            resultTitle(
                title: "น้ำหนักปลาทั้งบ่อ",
                titleColor: const Color(0xFF028DA6)),
            resultCard(
                widget.finalWeight, "กิโลกรัมต่อบ่อ", const Color(0xFF028DA6)),
            resultTitle(
                title: "น้ำหนักเฉลี่ยต่อตัวของปลา",
                titleColor: const Color(0xFF026DA6)),
            resultCard(widget.suitableFeed, "กิโลกรัมต่อมื้อ",
                const Color(0xFF026DA6)),
            recalculateBtn(),
            devByText2(context, color: Colors.deepPurple),
          ],
        ),
      )),
    );
  }

  Container recalculateBtn() {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text("คำนวณใหม่"),
            )),
      ),
    );
  }

  Widget resultTitle({required String title, required Color titleColor}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 16),
      child: Text(
        title,
        style: TextStyle(fontSize: 22, color: titleColor),
      ),
    );
  }

  Widget resultCard(num val, String unit, Color cardColor) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 110,
      child: Card(
        color: cardColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        // decoration: BoxDecoration(
        //   color: Colors.yellow,
        //   borderRadius: BorderRadius.circular(16),
        // ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                val.toStringAsFixed(3),
                style: const TextStyle(fontSize: 26, color: Colors.white),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  unit,
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
