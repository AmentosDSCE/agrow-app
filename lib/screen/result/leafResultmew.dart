import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:translator/translator.dart';

class LeafResultnew extends StatefulWidget {
  var results;
  LeafResultnew({required this.results, super.key});

  @override
  State<LeafResultnew> createState() => _LeafResultnewState();
}

class _LeafResultnewState extends State<LeafResultnew> {
  GoogleTranslator translator = GoogleTranslator();

  void trans() {
    translator
        .translate(widget.results.toString(),
            to: 'hi') //translating to hi = hindi
        .then((output) {
      setState(() {
        widget.results =
            output; //placing the translated text to the String to be used
      });
    });
  }

  bool x = false;
  void convert() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("result"),
        actions: [
          IconButton(
              onPressed: () {
                trans();
              },
              icon: const Icon(FontAwesomeIcons.language))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(25),
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const Text(
            //   "Probablity 1 :\n",
            //   style: TextStyle(
            //       color: Colors.black,
            //       fontWeight: FontWeight.bold,
            //       fontSize: 25),
            // ),
            // Text("Cause : ${widget.results['probability_1']["cause"]}",
            //     style: const TextStyle(color: Colors.black, fontSize: 18)),
            // Text("fertilisers : ${widget.results['probability_1']["fertiliser"]}",
            //     style: const TextStyle(color: Colors.black, fontSize: 18)),
            // Text("name : ${widget.results['probability_1']["name"]}",
            //     style: const TextStyle(color: Colors.black, fontSize: 18)),
            // const SizedBox(
            //   height: 20,
            // ),
            // const Text(
            //   "Probablity 2 :\n",
            //   style: TextStyle(
            //       color: Colors.black,
            //       fontWeight: FontWeight.bold,
            //       fontSize: 25),
            // ),
            // Text("Cause : ${widget.results['probability_2']["cause"]}",
            //     style: const TextStyle(color: Colors.black, fontSize: 18)),
            // Text("fertilisers : ${widget.results['probability_2']["fertiliser"]}",
            //     style: const TextStyle(color: Colors.black, fontSize: 18)),
            // Text("name : ${widget.results['probability_2']["name"]}",
            //     style: const TextStyle(color: Colors.black, fontSize: 18)),
            // const SizedBox(
            //   height: 20,
            // ),
            // const Text(
            //   "Probablity 3 :\n",
            //   style: TextStyle(
            //       color: Colors.black,
            //       fontWeight: FontWeight.bold,
            //       fontSize: 25),
            // ),
            // Text("Cause : ${widget.results['probability_3']["cause"]}",
            //     style: const TextStyle(color: Colors.black, fontSize: 18)),
            // Text("fertilisers : ${widget.results['probability_3']["fertiliser"]}",
            //     style: const TextStyle(color: Colors.black, fontSize: 18)),
            // Text("name : ${widget.results['probability_3']["name"]}",
            //     style: const TextStyle(color: Colors.black, fontSize: 18)),
            const Text(
              "Your Result :",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.results.toString(),
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            )
          ],
        ),
      ),
    );
  }
}
