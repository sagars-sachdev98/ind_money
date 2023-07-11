import 'dart:math';

import 'package:flutter/material.dart';

class GenerateRowsCols extends StatefulWidget {
  GenerateRowsCols({Key? key}) : super(key: key);

  @override
  State<GenerateRowsCols> createState() => _GenerateRowsColsState();
}

class _GenerateRowsColsState extends State<GenerateRowsCols> {
  List<Container> containers = [];
  int noOfRows = 4;
  int noOfCols = 5;
  int? randomNumberForP;
  int? randomNumberForG;
  generateRowsCols(int noOfRows, int noOfCols) {
    containers = [];
    int temp = noOfCols * noOfRows;
    Random random = Random();
    randomNumberForP = random.nextInt(temp);
    randomNumberForG = random.nextInt(temp);
    List.generate(
        temp,
        (index) => containers.add(Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
                color: Colors.grey,
              ),
              child: index == randomNumberForP
                  ? const Center(
                      child: Text(
                      "👮",
                      style: TextStyle(fontSize: 50),
                    ))
                  : index == randomNumberForG
                      ? const Center(
                          child: Text(
                          "👻",
                          style: TextStyle(fontSize: 50),
                        ))
                      : const Offstage(),
            )));

    setState(() {});
  }

  @override
  void initState() {
    generateRowsCols(noOfRows, noOfCols);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: GridView.count(
                  crossAxisCount: noOfRows, children: containers)),
          ElevatedButton(
              onPressed: () {
                generateRowsCols(noOfRows, noOfCols);
              },
              child: const Text("Change Postions"))
        ],
      ),
    );
  }
}
