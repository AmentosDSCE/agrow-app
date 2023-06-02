import 'dart:convert';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NearByPlaces extends StatefulWidget {
  const NearByPlaces({super.key});

  @override
  State<NearByPlaces> createState() => _NearByPlacesState();
}

class _NearByPlacesState extends State<NearByPlaces> {
  static void navigateTo(double lat, double lng) async {
    var uri = Uri.parse("google.navigation:q=$lat,$lng&mode=d");
    if (await canLaunch(uri.toString())) {
      await launch(uri.toString());
    } else {
      throw 'Could not launch ${uri.toString()}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Fertilizers Shop",
          ),
        ),
        body: Column(
          children: [
            direction("Sri Vinayaka Fertilizers", 13.037293, 77.591499),
            const SizedBox(
              height: 5,
            ),
            direction(
                "The Fertilizers & Chemicals Travencore", 12.966970, 77.527954),
            const SizedBox(
              height: 5,
            ),
            direction("MS Fertilizers & Pesticides", 12.956280, 77.731483),
            const SizedBox(
              height: 5,
            ),
            direction("Mahafeed Speciality Fertilizers (India)", 13.097948,
                77.563118),
            const SizedBox(
              height: 5,
            ),
            direction("Paras Agro Fertilizers", 12.975048, 77.596962),
            const SizedBox(
              height: 5,
            ),
            direction("Sree Manjunatha Fertilizers", 13.010798, 77.540016),
            const SizedBox(
              height: 5,
            ),
            direction("Sri Lakshmi Balaji Fertilizers", 12.957049, 77.616508),
            const SizedBox(
              height: 5,
            ),
            direction("Shiva Anjaneya Fertilizers and Pesticides", 13.021198,
                77.587425),
          ],
        ));
  }

  Card direction(String name, double lat, double lon) {
    return Card(
      elevation: 2,
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(child: Text(name, style: const TextStyle(fontSize: 18))),
            IconButton(
              icon: const Icon(
                FontAwesomeIcons.directions,
                color: Colors.black,
              ),
              onPressed: () {
                navigateTo(lat, lon);
              },
            ),
          ],
        ),
      ),
    );
  }
}
