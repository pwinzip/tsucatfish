import 'package:flutter/material.dart';

Widget createHeaderLogo(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    decoration: const BoxDecoration(color: Colors.white),
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        createLogoContainer(
            120, 80, 8.0, "assets/images/logo_a.jpg", BoxFit.cover),
        createLogoContainer(
            65, 100, 4.0, "assets/images/tsu_logo.png", BoxFit.fill),
        createLogoContainer(
            150, 80, 6.0, "assets/images/scidi_logo.jpeg", BoxFit.fill),
      ],
    ),
  );
}

Container createLogoContainer(
    double width, double height, double padding, String img, BoxFit boxfit) {
  return Container(
    padding: EdgeInsets.all(padding),
    width: width,
    height: height,
    child: Image.asset(img, fit: boxfit),
  );
}

Widget appName(
    {Color titlecolor = Colors.white,
    Color subtitlecolor = const Color(0xFFE0E0E0),
    double toppadding = 40}) {
  return Padding(
    padding: EdgeInsets.fromLTRB(10, toppadding, 8, 8),
    child: Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "โปรแกรมคำนวณการเจริญเติบโต และปริมาณการกินอาหารของปลาดุก",
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 20, color: titlecolor),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          "Thaksin Catfish Growth and \nFeed Consumption Ver. 1.0",
          style: TextStyle(fontSize: 16, color: subtitlecolor),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

Widget devByText1(BuildContext context, {Color color = Colors.white}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    // color: Colors.grey[200],
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          bottomAppCard(),
          devBy(),
        ],
      ),
    ),
  );
}

Widget devByText2(BuildContext context, {Color color = Colors.white}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    // color: Colors.grey[200],
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          bottomOnlyAppName(),
          devBy(color: color),
        ],
      ),
    ),
  );
}

Padding devBy({Color color = Colors.white}) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Text(
      "พัฒนาโดย โครงการวิจัยการพัฒนานวัตกรรมการเลี้ยงปลาดุกลูกผสมเพื่อผลิตเป็นวัตถุดิบสำหรับแปรรูปผลิตภัณฑ์ปลาดุกร้า บพท. 2566 คณะวิทยาศาสตร์และนวัตกรรมดิจิทัล \n มหาวิทยาลัยทักษิณ",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 12, color: color),
    ),
  );
}

Card bottomAppCard() {
  return Card(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8))),
    child: bottomOnlyAppName(),
  );
}

Padding bottomOnlyAppName() {
  return const Padding(
    padding: EdgeInsets.all(8.0),
    child: Text(
      "Application Thaksin Catfish Growth and Feed Consumption Ver. 1.0",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 14, color: Colors.black),
    ),
  );
}
