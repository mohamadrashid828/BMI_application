import 'dart:math';

import 'package:bmiaplication/BMI/resolt_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainPageBMI extends StatefulWidget {
  const MainPageBMI({super.key});

  @override
  State<MainPageBMI> createState() => _MainPageBMIState();
}

class _MainPageBMIState extends State<MainPageBMI> {
  Color color_container = Color.fromARGB(255, 98, 141, 131);
  int slider_valu = 150;
  bool is_male = true;
  Map<String, int> age_waite = {"Age": 2, "Weight": 55};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                mycontainer(Icons.male, "Male"),
                mycontainer(Icons.female, "Female")
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: boxdecoration_container(color_container, ""),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Hight",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${slider_valu}",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                          Text(
                            "  Cm",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Slider(
                          min: 100,
                          value: slider_valu.toDouble(),
                          max: 250,
                          onChanged: (v) {
                            setState(() {
                              slider_valu = v.toInt();
                            });
                          })
                    ],
                  ),
                ),
              ),
            ),
            Row(
              children: [mycontainer_last("Weight"), mycontainer_last("Age")],
            ),
            Container(
              width: double.infinity,
              color: Colors.teal,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return Resolt_Bmi(info: {
                      "Gender": "${is_male ? "male" : "female"}",
                      "resoult": "${Bmi_calculate()}",
                      "Age": "${age_waite["Age"]}"
                    });
                  }));
                },
                child: Text(
                  "Calculate",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Bmi_calculate() {
    print(slider_valu);
    return (age_waite["Weight"]!.toInt() / pow(slider_valu / 100, 2))
        .toStringAsFixed(1);
  }

  boxdecoration_container(Color colordate, String m_or_f) {
    return BoxDecoration(
      color: (m_or_f == "Male" && is_male) || (m_or_f == "Female" && !is_male)
          ? Colors.teal
          : colordate,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [BoxShadow(blurRadius: 2, blurStyle: BlurStyle.outer)],
    );
  }

  Widget mycontainer_last(String title) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 125,
          decoration: boxdecoration_container(color_container, ""),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18),
              ),
              Text(
                "${age_waite[title]}",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      add_wight_age(title, "-");
                    },
                    child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            boxShadow: [BoxShadow(blurStyle: BlurStyle.outer)],
                            color: Colors.teal,
                            shape: BoxShape.circle),
                        child: Center(
                            child: Text(
                          "--",
                          style: TextStyle(color: Colors.white),
                        ))),
                  ),
                  InkWell(
                    onTap: () {
                      add_wight_age(title, "+");
                    },
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          boxShadow: [BoxShadow(blurStyle: BlurStyle.outer)],
                          color: Colors.teal,
                          shape: BoxShape.circle),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void add_wight_age(String type, String oprator) {
    if (age_waite[type]! > 0) {
      setState(() {
        print("object");

        oprator == "+"
            ? age_waite[type] = age_waite[type]!.toInt() + 1
            : age_waite[type] = age_waite[type]!.toInt() - 1;
      });
    } else {
      age_waite[type] = 1;
    }
  }

  Widget mycontainer(IconData iconda, String title) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            setState(() {
              is_male = title == "Male" ? true : false;
            });
          },
          child: Container(
            height: 125,
            decoration: boxdecoration_container(color_container, title),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  iconda,
                  color: Colors.white,
                  size: 75,
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
