import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class BotResult extends StatefulWidget {
  var results;
  BotResult({super.key, this.results});

  @override
  State<BotResult> createState() => _BotResultState();
}

class _BotResultState extends State<BotResult> {
  GoogleTranslator translator = GoogleTranslator();

  bool x = false;
  void trans() {
    translator.translate(widget.results.toString(), to: 'hi').then((output) {
      setState(() {
        widget.results = output;
      });
    });
  }

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
              icon: Icon(Icons.language))
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Government policies :",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                // (x)?const Text(
                //   '1st most relevant',
                //   style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       fontSize: 20,
                //       color: Colors.black),
                // ):Text(
                //   trans( '1st most relevant'),
                //   style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       fontSize: 20,
                //       color: Colors.black)),
                // Text(
                //   widget.results['1st most relevant'].toString(),
                //   style: const TextStyle(color: Colors.black),
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                // const Text(
                //   '2nd most relevant',
                //   style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       fontSize: 20,
                //       color: Colors.black),
                // ),
                // Text(
                //   widget.results['2nd most relevant'].toString(),
                //   style: const TextStyle(color: Colors.black),
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                // const Text(
                //   '3rd most relevant',
                //   style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       fontSize: 20,
                //       color: Colors.black),
                // ),
                // Text(
                //   widget.results['3rd most relevant '].toString(),
                //   style: const TextStyle(color: Colors.black),
                // ),
                // Text(
                //   widget.results.toString(),
                //   style: TextStyle(color: Colors.black),
                // )
                Text(
                  widget.results.toString(),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
