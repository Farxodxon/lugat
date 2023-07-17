import 'package:flutter/material.dart';

class DetailItem extends StatelessWidget {
  DetailItem({Key? key, required this.word, required this.numbers})
      : super(key: key);
  String word;
  String numbers;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> result = parseString(numbers);

    return Scaffold(
      appBar: AppBar(
        title: Text(word),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                numbers,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: List.generate(
                    result.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 7,horizontal: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: const Color(0xFF0048FF),
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                        "Достон неча марта қўлланганлигини: "),
                                    Text(result[index]["count"],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ))
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text("Саҳифада қўлланиш даражасини: "),
                                    Text(
                                      result[index]["level"],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Map<String, dynamic>> parseString(String input) {
    List<String> parts = input.split(" ");
    List<Map<String, dynamic>> result = [];

    for (int i = 1; i < parts.length; i++) {
      String countLevel = parts[i];
      int openBracketIndex = countLevel.indexOf("(");
      int closeBracketIndex = countLevel.indexOf(")");
      String count = countLevel.substring(0, openBracketIndex);
      String level =
          countLevel.substring(openBracketIndex + 1, closeBracketIndex);

      Map<String, dynamic> entry = {
        "count": count,
        "level": level,
      };

      result.add(entry);
    }

    return result;
  }
}
