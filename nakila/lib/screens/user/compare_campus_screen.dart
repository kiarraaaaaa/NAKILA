// TODO Implement this library.
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/campus_model.dart';

class CompareCampusScreen extends StatelessWidget {
  final CampusModel campus1;
  final CampusModel campus2;

  const CompareCampusScreen({
    super.key,
    required this.campus1,
    required this.campus2,
  });

  Widget buildCampusImage(String image) {
    if (image.isEmpty) {
      return Container(
        color: Colors.grey.shade200,
        child: const Center(child: Icon(Icons.image, size: 50)),
      );
    }

    if (image.startsWith("assets/")) {
      return Image.asset(image, fit: BoxFit.cover);
    }

    return Image.memory(base64Decode(image), fit: BoxFit.cover);
  }

  Widget compareTile({
    required String title,
    required String left,
    required String right,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(18),

        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: .05), blurRadius: 10),
        ],
      ),

      child: Row(
        children: [
          Expanded(
            child: Text(
              left,
              textAlign: TextAlign.center,

              style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            ),
          ),

          Expanded(
            child: Text(
              title,

              textAlign: TextAlign.center,

              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,

                color: Colors.blue,
              ),
            ),
          ),

          Expanded(
            child: Text(
              right,

              textAlign: TextAlign.center,

              style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),

      appBar: AppBar(
        centerTitle: true,

        title: Text(
          "Campus Comparison",

          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),

                        child: SizedBox(
                          height: 160,

                          child: buildCampusImage(campus1.image),
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        campus1.name,

                        textAlign: TextAlign.center,

                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),

                        child: SizedBox(
                          height: 160,

                          child: buildCampusImage(campus2.image),
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        campus2.name,

                        textAlign: TextAlign.center,

                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            compareTile(
              title: "World Ranking",
              left: campus1.worldRanking,
              right: campus2.worldRanking,
            ),

            compareTile(
              title: "Founded Year",
              left: campus1.foundedYear,
              right: campus2.foundedYear,
            ),

            compareTile(
              title: "Country",
              left: campus1.country,
              right: campus2.country,
            ),

            compareTile(
              title: "Rating",
              left: campus1.rating.toString(),
              right: campus2.rating.toString(),
            ),

            compareTile(
              title: "Verified",
              left: campus1.verified ? "Yes" : "No",

              right: campus2.verified ? "Yes" : "No",
            ),
          ],
        ),
      ),
    );
  }
}
