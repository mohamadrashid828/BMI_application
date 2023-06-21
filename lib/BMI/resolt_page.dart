import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Resolt_Bmi extends StatefulWidget {
  Map<String, String> info;
  Resolt_Bmi({required this.info, super.key});

  @override
  State<Resolt_Bmi> createState() => _Resolt_BmiState();
}

class _Resolt_BmiState extends State<Resolt_Bmi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("resolt"),
        centerTitle: true,
      ),
      body: DefaultTextStyle(
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [Text("Gender  : ${widget.info["Gender"]}"), Text("resoult :${widget.info["resoult"]}"), Text("Age : ${widget.info["Age"]}")],
            ),
          ),
        ),
      ),
    );
  }
}
