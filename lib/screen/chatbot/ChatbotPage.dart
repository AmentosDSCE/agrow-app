import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:jit_gaye_hackathon/screen/chatbot/resul.dart';
import 'package:translator/translator.dart';

class ChatBotPage extends StatefulWidget {
  const ChatBotPage({super.key});

  @override
  State<ChatBotPage> createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  GoogleTranslator translator = GoogleTranslator();
  List<String> arr = [
    "do you fall under the age group of 40 years and above?",
    "is your cultivating land size below 1 hector?",
    "do you belong to rural region?",
    "do you have Indian citizenship?",
    "is your land under a lease agreement from the past seven years?",
    "do you cultivate seasonal crops?",
    "do you have children pursuing higher education?",
    "do you work in a cluster farming?",
    ""
  ];
  void trans() {
    for (int i = 0; i < arr.length; i++) {
      translator.translate(arr.elementAt(i), to: 'hi').then((output) {
        setState(() {
          arr[i] = output.toString();
        });
      });
    }
    setState(() {
      y = !y;
    });
  }

  bool y = true;
  List<int> a = [];
  int i = 0;
  uploadResult() async {
    final headers = {"Content-type": "application/json"};
    final body = jsonEncode(<String, List<int>>{'input': a});
    final response = await http.post(
        Uri.parse("https://74e1-14-99-167-142.ngrok-free.app/scheme"),
        headers: headers,
        body: body);
    final resJson = jsonDecode(response.body);
    if (response.statusCode == 200) {
      // print(response.body);

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  BotResult(results: resJson['message'])));
    } else {
      throw Exception('Failed to send post request.');
    }
  }

  bool x = false;
  bool check() {
    if (i == arr.length - 1) {
      setState(() {
        x = !x;
        uploadResult();
      });
    }
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bot"),
        actions: [
          IconButton(
              onPressed: () {
                trans();
              },
              icon: const Icon(FontAwesomeIcons.language))
        ],
      ),
      body: Center(
        child: (check())
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(30),
                    decoration: const BoxDecoration(
                      color: Colors.green,
                    ),
                    height: 200,
                    width: 360,
                    child: Center(
                        child: Text(
                      arr.elementAt(i),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25),
                    )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (i == arr.length - 1) {
                                i = 0;
                              }
                              a.insert(i, 1);
                              i++;
                            });
                          },
                          child: Text((y) ? "YES" : "हाँ")),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (i == arr.length - 1) {
                                i = 0;
                              }
                              a.insert(i, -1);
                              i++;
                            });
                          },
                          child: Text((y) ? "No" : "नहीं")),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (i == arr.length - 1) {
                                i = 0;
                              }
                              a.insert(i, 0);
                              i++;
                            });
                          },
                          child: Text((y) ? "Don't know" : "मालूम नहीं"))
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
