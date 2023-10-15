import 'dart:math';

import 'package:catfishtsu/pages/resultpage.dart';
import 'package:catfishtsu/utils/header.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _fishWeightError = true;
  bool _fishAmountError = true;
  bool _fishSurviveError = false;
  bool _fishDayError = true;
  bool _fishMealError = true;

  List<ListItem> typeList = [
    ListItem(value: "instant", text: "อาหารสำเร็จรูปแบบเม็ดลอยน้ำ"),
    ListItem(value: "manual", text: "อาหารผสมใช้เอง ไม่ผ่านการอบแห้ง"),
  ];

  List<ListItem> systemList = [
    ListItem(value: "3", text: "เปลี่ยนน้ำสม่ำเสมอ (3 ครั้ง/สัปดาห์)"),
    ListItem(value: "2", text: "เปลี่ยนน้ำบ่อย (2 ครั้ง/สัปดาห์)"),
    ListItem(value: "1", text: "เปลี่ยนน้ำน้อย (1 ครั้ง/สัปดาห์)"),
  ];

  List<ListItem> weatherList = [
    ListItem(value: "0", text: "แดดดี/อากาศร้อน"),
    ListItem(value: "1", text: "ไม่มีแดด/ฝนตกเล็กน้อย"),
    ListItem(value: "2", text: "มืดครึ้ม/อากาศเย็น/ฝนตกหนัก"),
  ];

  List<WeightData> weightdata = [
    WeightData(lenght: 3.5, weight: 1.36),
    WeightData(lenght: 4, weight: 1.82),
    WeightData(lenght: 4.5, weight: 2.29),
    WeightData(lenght: 5, weight: 2.75),
    WeightData(lenght: 5.5, weight: 3.22),
    WeightData(lenght: 6, weight: 3.68),
    WeightData(lenght: 6.5, weight: 4.15),
    WeightData(lenght: 7, weight: 4.61),
    WeightData(lenght: 7.5, weight: 5.08),
    WeightData(lenght: 8, weight: 5.54),
    WeightData(lenght: 8.5, weight: 6.01),
    WeightData(lenght: 9, weight: 6.47),
    WeightData(lenght: 9.5, weight: 6.94),
  ];

  // void _onChanged(dynamic val) {
  //   // print(val.text);
  //   // debugPrint(_formKey.currentState!.value["feedType"].value.toString());
  //   // debugPrint(_formKey.currentState!.value["fishSystem"].value.toString());
  //   // debugPrint(_formKey.currentState!.value["weather"].value.toString());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: FormBuilder(
            key: _formKey,
            onChanged: () {
              _formKey.currentState!.save();
              // debugPrint(_formKey.currentState!.value.toString());
            },
            child: Column(
              children: [
                createHeaderLogo(context),
                appName(
                    titlecolor: Colors.black,
                    subtitlecolor: Colors.black,
                    toppadding: 10),
                createSection(title: "กรุณาเลือกประเภทอาหารที่ใช้เลี้ยงปลา"),
                createRadioList(name: "feedType", options: typeList),
                createSection(title: "กรุณาเลือกระบบการเลี้ยงปลาของท่าน"),
                createRadioList(name: "fishSystem", options: systemList),
                createSection(title: "กรุณาเลือกสภาพอากาศวันนี้"),
                createRadioList(name: "weather", options: weatherList),
                createSection(title: "กรุณากรอกข้อมูลการเลี้ยงปลา"),
                createTextInput(
                    name: "fishWeight",
                    label: "น้ำหนักปลาเริ่มต้น",
                    suffix: "กรัม",
                    error: _fishWeightError,
                    errorText: "ใส่น้ำหนักปลาเริ่มต้น"),
                const SizedBox(height: 8),
                InkWell(
                    onTap: () {
                      var dialog = Dialog.fullscreen(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: ElevatedButton.icon(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(Icons.close),
                                label: const Text("ปิดหน้าต่าง"),
                              ),
                            ),
                            Expanded(
                              child: DataTable2(
                                headingRowDecoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 102, 249, 222),
                                      Color.fromARGB(255, 201, 245, 237),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                                columns: const [
                                  DataColumn2(
                                    label: Text(
                                      'ความยาวตัวลูกปลา (เซนติเมตร)',
                                      textAlign: TextAlign.center,
                                      softWrap: true,
                                    ),
                                    size: ColumnSize.M,
                                  ),
                                  DataColumn2(
                                    label: Text(
                                      'น้ำหนักตัวลูกปลา (กรัม)',
                                      textAlign: TextAlign.center,
                                      softWrap: true,
                                    ),
                                    size: ColumnSize.M,
                                  ),
                                ],
                                rows: weightdata.map((data) {
                                  return DataRow(cells: [
                                    DataCell(Center(
                                      child: Text(data.lenght.toString()),
                                    )),
                                    DataCell(Center(
                                      child: Text(data.weight.toString()),
                                    )),
                                  ]);
                                }).toList(),
                                // const [
                                //   DataRow(
                                //     cells: <DataCell>[
                                //       DataCell(Text('3.5')),
                                //       DataCell(Text('4')),
                                //     ],
                                //   ),
                                //   DataRow(
                                //     cells: <DataCell>[
                                //       DataCell(Text('Sarah')),
                                //       DataCell(Text('19')),
                                //     ],
                                //   ),
                                // ],
                              ),
                            ),
                          ],
                        ),
                      );
                      showDialog(
                        context: context,
                        builder: (context) => dialog,
                      );
                    },
                    child: const Text(
                      "ถ้าไม่ทราบ กดดูความยาวตัวกับน้ำหนักปลาที่นี้",
                      style: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.blue),
                    )),
                const SizedBox(height: 8),
                createTextInput(
                    name: "fishAmount",
                    label: "จำนวนปลาที่ปล่อยเริ่มต้น",
                    suffix: "ตัว",
                    error: _fishAmountError,
                    errorText: "ใส่จำนวนปลาที่ปล่อยเริ่มต้น"),
                const SizedBox(height: 8),
                createTextInput(
                    name: "fishSurvive",
                    label: "อัตราการรอด",
                    suffix: "%",
                    initialvalue: '85',
                    error: _fishSurviveError,
                    errorText: "ใส่เปอร์เซ็นอัตราการรอด"),
                const SizedBox(height: 8),
                createTextInput(
                    name: "fishDay",
                    label: "จำนวนวันที่เลี้ยงปลา",
                    suffix: "วัน",
                    error: _fishDayError,
                    errorText: "ใส่จำนวนวันที่เลี้ยงปลา"),
                const SizedBox(height: 8),
                createTextInput(
                    name: "fishMeal",
                    label: "จำนวนมื้อที่ให้อาหารปลาต่อวัน",
                    suffix: "ครั้งต่อวัน",
                    error: _fishMealError,
                    errorText: "จำนวนมื้อที่ให้อาหารปลาต่อวัน"),
                const SizedBox(height: 8),
                const Text("(ปกติให้อาหารปลา 1-3 มื้อต่อวัน)"),
                const SizedBox(height: 12),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Calculate growth and feed consumption
                            Map<String, dynamic> result = {};
                            double waterFactor = 1.0;
                            double weatherFactor = 1.0;

                            String feedType =
                                _formKey.currentState!.value["feedType"].value;
                            String fishSystem = _formKey
                                .currentState!.value["fishSystem"].value;
                            String weather =
                                _formKey.currentState!.value["weather"].value;
                            double fishWeight = double.parse(
                                _formKey.currentState!.value["fishWeight"]);
                            int fishAmount = int.parse(
                                _formKey.currentState!.value["fishAmount"]);
                            int fishSurvive = int.parse(
                                _formKey.currentState!.value["fishSurvive"]);
                            int fishDay = int.parse(
                                _formKey.currentState!.value["fishDay"]);
                            int fishMeal = int.parse(
                                _formKey.currentState!.value["fishMeal"]);
                            waterFactor = fishSystem == "1"
                                ? 0.93
                                : fishSystem == "2"
                                    ? 0.95
                                    : 1.00;
                            weatherFactor = weather == "1"
                                ? 0.9
                                : weather == "2"
                                    ? 0.8
                                    : 1.0;

                            if (feedType == "instant") {
                              if (fishDay <= 120) {
                                double feedRate =
                                    (fishDay * (-0.0394)) + 7.4936;
                                result = calculateForLess120(
                                    fishDay,
                                    fishWeight,
                                    fishAmount,
                                    fishSurvive,
                                    fishMeal,
                                    waterFactor,
                                    weatherFactor,
                                    feedRate);
                              } else {
                                double feedRate = 2.76;
                                result = calculateForMore120(
                                    fishDay,
                                    fishWeight,
                                    fishAmount,
                                    fishSurvive,
                                    fishMeal,
                                    waterFactor,
                                    weatherFactor,
                                    feedRate);
                              }
                            } else if (feedType == "manual") {
                              if (fishDay <= 120) {
                                double feedRate =
                                    ((fishDay * (-0.0394)) + 7.4936) * 1.25;
                                result = calculateForLess120(
                                    fishDay,
                                    fishWeight,
                                    fishAmount,
                                    fishSurvive,
                                    fishMeal,
                                    waterFactor,
                                    weatherFactor,
                                    feedRate);
                              } else {
                                double feedRate = 3.58;
                                result = calculateForMore120(
                                    fishDay,
                                    fishWeight,
                                    fishAmount,
                                    fishSurvive,
                                    fishMeal,
                                    waterFactor,
                                    weatherFactor,
                                    feedRate);
                              }
                            }
                            // Send the result to output page
                            // print(result);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ResultPage(
                                      lastWeight: result["lastWeight"],
                                      finalWeight: result["finalWeight"],
                                      suitableFeed: result["suitableFeed"]),
                                ));
                          }
                        },
                        child: const Text("คำนวณ"))),
                devByText2(context, color: Colors.deepPurple),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Map<String, dynamic> calculateForLess120(
      int fishDay,
      double fishWeight,
      int fishAmount,
      int fishSurvive,
      int fishMeal,
      double waterFactor,
      double weatherFactor,
      double feedRate) {
    double sgr = (fishDay * (-0.0003)) + 0.0683;
    double lastWeight = calculateLastWeight(
      sgr: sgr,
      fishDay: fishDay,
      fishWeight: fishWeight,
      waterFactor: waterFactor,
    );
    double finalWeight =
        ((lastWeight * ((fishSurvive / 100) * fishAmount))) / 1000;
    double suitableFeed =
        (((feedRate / 100) * finalWeight) / fishMeal) * weatherFactor;
    return {
      "lastWeight": lastWeight,
      "finalWeight": finalWeight,
      "suitableFeed": suitableFeed
    };
  }

  Map<String, dynamic> calculateForMore120(
      int fishDay,
      double fishWeight,
      int fishAmount,
      int fishSurvive,
      int fishMeal,
      double waterFactor,
      double weatherFactor,
      double feedRate) {
    double sgr = (120 * (-0.0003)) + 0.0683;
    double lastWeight120 = calculateLastWeight(
      sgr: sgr,
      fishDay: 120,
      fishWeight: fishWeight,
      waterFactor: waterFactor,
    );
    int dayRemain = fishDay - 120;
    sgr = 0.055;
    double lastWeightRemain = calculateLastWeight(
      sgr: sgr,
      fishDay: dayRemain,
      fishWeight: fishWeight,
      waterFactor: waterFactor,
    );
    double lastWeight = lastWeight120 + lastWeightRemain;
    double finalWeight =
        ((lastWeight * ((fishSurvive / 100) * fishAmount))) / 1000;
    double suitableFeed =
        (((feedRate / 100) * finalWeight) / fishMeal) * weatherFactor;
    return {
      "lastWeight": lastWeight,
      "finalWeight": finalWeight,
      "suitableFeed": suitableFeed
    };
  }

  double calculateLastWeight(
      {required sgr,
      required int fishDay,
      required double fishWeight,
      required double waterFactor}) {
    double lnLastWeight = (sgr * fishDay) + log(fishWeight);
    return exp(lnLastWeight) * waterFactor;
  }

  Widget createTextInput(
      {required String name,
      required String label,
      required String suffix,
      required bool error,
      required String errorText,
      String? initialvalue}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: FormBuilderTextField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        name: name,
        textInputAction: TextInputAction.next,
        initialValue: initialvalue,
        decoration: InputDecoration(
          labelText: label,
          suffixText: suffix,
          suffixIcon: error
              ? const Icon(Icons.error, color: Colors.red)
              : const Icon(Icons.check, color: Colors.green),
        ),
        textAlign: TextAlign.center,
        onChanged: (val) {
          setState(() {
            error = !(_formKey.currentState?.fields[name]?.validate() ?? false);
            if (name == "fishWeight") {
              _fishWeightError = error;
            } else if (name == "fishAmount") {
              _fishAmountError = error;
            } else if (name == "fishSurvive") {
              _fishSurviveError = error;
            } else if (name == "fishDay") {
              _fishDayError = error;
            } else if (name == "fishMeal") {
              _fishMealError = error;
            }
          });
        },
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(errorText: errorText),
          FormBuilderValidators.numeric(errorText: "ใส่เฉพาะตัวเลข"),
        ]),
        keyboardType: TextInputType.number,
      ),
    );
  }

  Widget createRadioList(
      {required String name, required List<ListItem> options}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: FormBuilderRadioGroup<ListItem>(
        name: name,
        // onChanged: _onChanged,
        validator: FormBuilderValidators.compose(
            [FormBuilderValidators.required(errorText: "กรุณาเลือก")]),
        options: options
            .map((opt) => FormBuilderFieldOption<ListItem>(
                  value: opt,
                  child: Text(
                    opt.text,
                    style: const TextStyle(fontSize: 16),
                  ),
                ))
            .toList(),
        controlAffinity: ControlAffinity.leading,
        decoration: const InputDecoration(border: InputBorder.none),
      ),
    );
  }

  Card createSection({String title = ""}) {
    return Card(
      color: const Color(0xFF09B7B1),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          title,
          softWrap: true,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}

class ListItem {
  final String value;
  final String text;

  ListItem({required this.value, required this.text});
}

class WeightData {
  final double lenght;
  final double weight;

  WeightData({required this.lenght, required this.weight});
}
