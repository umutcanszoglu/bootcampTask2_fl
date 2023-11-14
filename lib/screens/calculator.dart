import 'package:basic_calc_fl/widgets/numbers.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var keyList = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", " + ", "="];
  var text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1B1A17),
      appBar: AppBar(
        backgroundColor: const Color(0xff1B1A17),
        leading: const Icon(
          Icons.calculate,
          color: Colors.white,
        ),
        titleSpacing: 0,
        title: const Text(
          "Calculator",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerLeft,
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: const Color(0xffE6D5B8),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xffE6D5B8).withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 0,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Text(
                text,
                style: const TextStyle(
                    color: Color(0xff1B1A17), fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                setState(() {
                  text = "";
                });
              },
              child: Container(
                width: 150,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xffE45826),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xffE45826).withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 0,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.delete_forever,
                  size: 30,
                  color: Color(0xffE6D5B8),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              runSpacing: 5,
              children: [
                ...keyList.asMap().entries.map(
                      (e) => Numbers(
                        number: e.value,
                        color: e.key > 9 ? Colors.orange : const Color(0xffE6D5B8),
                        onTap: () {
                          setState(() {
                            text += e.value;
                            if (e.value == "=") {
                              text = text.substring(0, (text.length - 1));
                              var res = 0;
                              var nums = text.split(" + ");
                              for (var num in nums) {
                                if (num == "") {
                                  num = "0";
                                }
                                res += int.parse(num);
                              }
                              text = res.toString();
                            }
                          });
                        },
                      ),
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
