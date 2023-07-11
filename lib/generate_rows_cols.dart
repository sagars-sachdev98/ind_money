import 'dart:math';

import 'package:flutter/material.dart';

class GenerateRowsCols extends StatefulWidget {
  GenerateRowsCols({Key? key}) : super(key: key);

  @override
  State<GenerateRowsCols> createState() => _GenerateRowsColsState();
}

class _GenerateRowsColsState extends State<GenerateRowsCols> {
  List<Container> containers = [];
  int? noOfRows;
  int? noOfCols;
  int? randomNumberForP;
  int? randomNumberForG;
  generateRowsCols(int noOfRows, int noOfCols) {
    containers = [];
    int temp = noOfCols * noOfRows;
    Random random = Random();
    randomNumberForP = random.nextInt(temp);
    randomNumberForG = random.nextInt(temp);
    print(randomNumberForG! / 4); //row
    print(randomNumberForP! / 4); // row
    print(randomNumberForG! / 5); // col
    print(randomNumberForP! / 5); //col
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

  // @override
  // void initState() {
  //   generateRowsCols(noOfRows, noOfCols);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  onChanged: (value) {
                    if (value != "") {
                      noOfRows = int.parse(value);
                    }
                  },
                  decoration: const InputDecoration(hintText: "No of Rows")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  onChanged: (value) {
                    if (value != "") {
                      noOfCols = int.parse(value);
                    }
                  },
                  decoration: const InputDecoration(hintText: "No of Cols")),
            ),
            ElevatedButton(
                onPressed: () {
                  generateRowsCols(noOfRows!, noOfCols!);
                },
                child: const Text("Generate")),
            containers.isNotEmpty
                ? Expanded(
                    child: GridView.count(
                        crossAxisCount: noOfRows!, children: containers))
                : const Offstage(),
            containers.isNotEmpty
                ? ElevatedButton(
                    onPressed: () {
                      generateRowsCols(noOfRows!, noOfCols!);
                    },
                    child: const Text("Change Postions"))
                : const Offstage()
          ],
        ),
      ),
    );
  }
}
