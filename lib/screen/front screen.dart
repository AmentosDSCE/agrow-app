import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jit_gaye_hackathon/screen/chatbot/ChatbotPage.dart';
import 'package:jit_gaye_hackathon/screen/chatbot/page/home_page.dart';

import 'package:jit_gaye_hackathon/screen/discussion_page.dart';
import 'package:jit_gaye_hackathon/screen/image_send/image_send.dart';
import 'package:jit_gaye_hackathon/screen/latest_news.dart';
import 'package:jit_gaye_hackathon/screen/nearby%20shops/nearby.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  List<Widget> pages = [
    const ImageSendOption(),

    const NearByPlaces(),
    const Discussion(),
    //  HomePage(),
    const ChatBotPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
          data: const NavigationBarThemeData(
              indicatorColor: Color.fromARGB(255, 117, 108, 108), height: 58),
          child: NavigationBar(
            animationDuration: const Duration(seconds: 1),
            backgroundColor: Colors.brown[300],
            selectedIndex: _currentIndex,
            onDestinationSelected: (int newIndex) {
              setState(() {
                _currentIndex = newIndex;
              });
            },
            destinations: const [
              NavigationDestination(
                  selectedIcon: Icon(Icons.home),
                  icon: Icon(Icons.home_outlined),
                  label: 'Home'),
              NavigationDestination(
                  selectedIcon: Icon(FontAwesomeIcons.shop),
                  icon: Icon(FontAwesomeIcons.shop),
                  label: 'Fertilizer shop'),
              NavigationDestination(
                  selectedIcon: Icon(Icons.chat),
                  icon: Icon(Icons.chat_outlined),
                  label: 'Discussion'),
              NavigationDestination(
                  selectedIcon: Icon(FontAwesomeIcons.robot),
                  icon: Icon(FontAwesomeIcons.robot),
                  label: 'Bot'),
            ],
          )),
      body: Center(child: pages[_currentIndex]),
    );
  }
}
